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
import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.FavoriteService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.FavoriteServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/book/addFavorite.do")
public class AddFavorite extends BaseController{
	
	private static final long serialVersionUID = 7267734244051973492L;
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	FavoriteService favoriteService;
	BookService bookService;
	EpisodeService episodeService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		
		web = WebHelper.getInstance(request, response);
		
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		
		int member_id = web.getInt("member_id");
		int book_id = web.getInt("book_id");
		int favorite_count = web.getInt("favorite_count");
		int total_favorite = web.getInt("total_favorite");
		
		
		//관심 작품 등록 해제 여부 false --> 해제 , true --> 등록
		boolean isFavoriteState = false;
		
		//작품에 대한 총 에피소드 개 수
		int episode_count = 0;
		
		System.out.println("favorite_count ---------------------->" + favorite_count);
		
		//관심등록이 등록된 상태이면 관심 등록 삭제
		if(favorite_count == 1){
			//관심등록 테이블(favorite)에서 삭제 할 Beans 셋팅
			Favorite favorite = new Favorite();
			favorite.setMember_id(member_id);
			favorite.setBook_id(book_id);
			
			//작품의 총 관심등록 -1을 위 한 Beans 셋팅
			Book book = new Book();
			book.setId(book_id);
			
			try{
				//관심등록 삭제
				favoriteService.deleteRemoveFavorite(favorite);
				
				//총 관심등록  -1
				bookService.updateTotalFavoriteMinus(book);
				
			}catch (Exception e) {
				// TODO: handle exception
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally {
				sqlSession.close();
			}//try ~ finally End
			
			isFavoriteState = false;
			total_favorite--;
			favorite_count = 0;
			
		}else{//관심등록이 되어있지 않은 상태이면 관심등록 추가
			
			//관심등록 테이블(favorite)에 저장할 회원정보 가져오기(birthdate, gender)
			//세션에서 가져온 회원정보
			Member loginInfo = new Member();
			loginInfo = (Member)web.getSession("loginInfo");
			
			logger.debug("loginInfo ------------->" + loginInfo);
			//관심등록 테이블에 저장 할 생일, 성별 추출 
			String birthdate = null;
			String gender = "";
			
			if(loginInfo != null){
				birthdate = loginInfo.getBirthdate();
				gender = loginInfo.getGender();
			}
			
			//파라미터 Beans에 담기
			Favorite favorite = new Favorite();
			favorite.setBirthdate(birthdate);
			favorite.setGender(gender);
			favorite.setBook_id(book_id);
			favorite.setMember_id(member_id);
			
			//총 관심등록 수 +1 파라미터 Beans에 담기
			//총 관심등록 수 +1은 Sql구문에 SET total_favorite=total_favorite+1을 통해 업데이트
			Book book = new Book();
			book.setId(book_id);
			
			//총 관심등록 회원수 +1
			//json으로 화면에 뿌려줄 값(ajax 통신 완료후 화면에 뿌려주기 위한 값)
			total_favorite++;
			
			Episode episode = new Episode();
			episode.setBook_id(book_id);
		
			try{
				//작품에 대한 총 에피소드 개수
				episode_count = episodeService.countTotalEpisodeByBookId(episode);
				
				favorite.setEpisode_count(episode_count);
				
				//관심등록 테이블에 추가
				favoriteService.insertAddFavorite(favorite);
				//작품의 총 관심등록 수 +1
				bookService.updateTotalFavoritePlus(book);
				
				
			}catch (Exception e) {
				// TODO: handle exception
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally {
				sqlSession.close();
			}//try ~ finally End
			
			//관심작품 등록 상태 변경
			isFavoriteState = true;
			favorite_count =1;
			
			
		}//end else
		
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("total_favorite", total_favorite);
		data.put("isFavoriteState", isFavoriteState);
		data.put("favorite_count", favorite_count);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}
	
}
