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

import study.jsp.bookstory.model.BookMark;
import study.jsp.bookstory.model.Episode;

import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookMarkService;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;

import study.jsp.bookstory.service.impl.BookMarkServiceImpl;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class AddBookMark
 */
@WebServlet("/book/addBookMark.do")
public class AddBookMark extends BaseController {
		
	private static final long serialVersionUID = -875770477356253156L;
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookMarkService bookmarkService;
	BookService bookService;
	EpisodeService episodeService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		
		web = WebHelper.getInstance(request, response);
		
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		
		int member_id = web.getInt("member_id");
		int book_id = web.getInt("book_id");
		int episode_id = web.getInt("episode_id");
		int bookmark_count = web.getInt("bookmark_count");
		int total_bookmark = web.getInt("total_bookmark");
		

		//관심 작품 등록 해제 여부 false --> 해제 , true --> 등록
		boolean isBookMarkState = false;
		
		System.out.println("bookmark_count ---------------------->" + bookmark_count);
		System.out.println("episode_id ---------------------->" + episode_id);
		
		
		//관심등록이 등록된 상태이면 관심 등록 삭제
		if(bookmark_count == 1){
			//관심등록 테이블(favorite)에서 삭제 할 Beans 셋팅
			BookMark bookmark = new BookMark();
			bookmark.setMember_id(member_id);
			bookmark.setEpisode_id(episode_id);
			bookmark.setBook_id(book_id);
			
			//작품의 총 관심등록 -1을 위 한 Beans 셋팅
			Episode episode = new Episode();
			episode.setId(episode_id);
			
			try{
				//관심등록 삭제
				bookmarkService.deleteRemoveBookMark(bookmark);
				
			
				
			}catch (Exception e) {
			
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally {
				sqlSession.close();
			}//try ~ finally End
			
			isBookMarkState = false;
			total_bookmark--;
			bookmark_count = 0;
			
		}else{//관심등록이 되어있지 않은 상태이면 관심등록 추가
			
			//관심등록 테이블(bookmark)에 저장할 회원정보 가져오기(birthdate, gender)
			//세션에서 가져온 회원정보
			Member loginInfo = new Member();
			loginInfo = (Member)web.getSession("loginInfo");
			
			logger.debug("loginInfo ------------->" + loginInfo);
			//관심등록 테이블에 저장 할 생일, 성별 추출 
		
			//파라미터 Beans에 담기
			BookMark bookmark = new BookMark();		
			bookmark.setBook_id(book_id);
			bookmark.setEpisode_id(episode_id);
			bookmark.setMember_id(member_id);
			
			//총 관심등록 수 +1 파라미터 Beans에 담기
			//총 관심등록 수 +1은 Sql구문에 SET total_favorite=total_favorite+1을 통해 업데이트
			Episode episode = new Episode();
			episode.setId(episode_id);
			
			//총 관심등록 회원수 +1
			//json으로 화면에 뿌려줄 값(ajax 통신 완료후 화면에 뿌려주기 위한 값)
			total_bookmark++;
		
			try{
				//관심등록 테이블에 추가
				bookmarkService.insertAddBookMark(bookmark);
							
				
			}catch (Exception e) {				
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally {
				sqlSession.close();
			}//try ~ finally End
			
			//관심작품 등록 상태 변경
			isBookMarkState = true;
			bookmark_count =1;			
			
		}//end else
		
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("total_bookmark", total_bookmark);
		data.put("isBookMarkState", isBookMarkState);
		data.put("bookmark_count", bookmark_count);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}
	
		
		
	}
  
   
