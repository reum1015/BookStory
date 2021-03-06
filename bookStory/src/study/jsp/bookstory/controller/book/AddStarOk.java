package study.jsp.bookstory.controller.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.StarMark;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.StarMarkService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/book/AddStarOk.do")
public class AddStarOk extends BaseController{

	private static final long serialVersionUID = -5686895178885874355L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	
	StarMarkService starMarkService;
	EpisodeService episodeService;
	BookService bookService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
		
		starMarkService = new StarMarkServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		
		//별점 점수 받기
		String tempStar = web.getString("star_rate");
		int id = web.getInt("member_id");
		
		System.out.println("id----------------------------->" + id);
		
		
		int star_rate = 0;
		//점수 정수형으로 변환
		if(tempStar != null){
			star_rate = Integer.parseInt(tempStar);
		}
		logger.debug("star_rate ----------------->" + star_rate);
		
		
		//만약 점수가 0이면 되돌림
		if(star_rate == 0){
			sqlSession.close();
			web.printJsonRt("0점 이상만 등록 가능합니다.");
			return null;
		}
		
		
		
		int member_id = 0;
		//회원일련번호를 Beans에 추가
		Member loginInfo = (Member) web.getSession("loginInfo");
			if(loginInfo != null){
			member_id = loginInfo.getId();	
		}
		if(member_id == 0){
			sqlSession.close();
			web.printJsonRt("회원 번호가 없습니다.");
			return null;
		}
		
		
		//파라미터 받기
		int episode_id = web.getInt("episode_id");	//에피소드 Id 받기
		int book_id = web.getInt("book_id");	//작품 Id 받기
		member_id = web.getInt("member_id");
		
		/* 파라미터를 Beans로 묶기 */
		StarMark starMark = new StarMark();
		
		starMark.setBook_id(book_id);
		starMark.setEpisode_id(episode_id);
		starMark.setMember_id(member_id);
		starMark.setStar_point(star_rate);
		
		
		StarMark resultItemForCountAvg = new StarMark();
		
		int star_count = 0;					//에피소드에 별점준 총회원 수
		double starAvgEpisode = 0.0;		//에피소드의 별점 평균
		//double starAvgBook = 0.0;			//작품의 별점 평균
		
		//작품테이블에 별점평균 입력 파라미터 셋팅
		Book book = new Book();
		book.setId(book_id);
		
		try{
			
			//starmark 테이블에 별점 정보 입력
			starMarkService.insertAddStar(starMark);
			
			//에피소드에 별점준 총 회원 수와 작품의 별점 평균
			resultItemForCountAvg = starMarkService.selectStarCountAndAvgEpisode(starMark);
			
			if(resultItemForCountAvg != null){
				star_count = resultItemForCountAvg.getStar_count();
				starAvgEpisode = resultItemForCountAvg.getEpisode_star_avg();
			}
			
			//에피소드 테이블에 작품에 별점준 총회원 수와 작품의 별점 평균 입력
			Episode episode = new Episode();
			episode.setTotal_starcount(star_count);
			episode.setTotal_star(starAvgEpisode);
			episode.setId(episode_id);
			
			episodeService.updateStarCountAndAvg(episode);
			
			//작품테이블(Book)에 평균 별점 등록
			bookService.updateStarAvg(book);
			
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		StarMark star = new StarMark();
		star.setEpisode_id(episode_id);
		
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("starCount", star_count);
		data.put("starAvgEpisode", starAvgEpisode);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
