package study.jsp.bookstory.controller.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/novelview/view_page.do")
public class ViewPage extends BaseController{

	private static final long serialVersionUID = 113920651746454564L;
	
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	EpisodeService episodeService;
	PageHelper pageHelper;
	StarMarkService starMarkService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = "novelview/view_page";
		
        /** (2)사용하고자 하는 Helper + Serive 객체 선언*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		starMarkService = new StarMarkServiceImpl(sqlSession, logger);
		
		/** (3)파라미터 받기 */
		
		int episode_id = web.getInt("episode_id");
		int book_id = web.getInt("book_id");
		
		logger.debug("episode_id ------------------> " + episode_id);
		logger.debug("book_id ------------------> " + book_id);
		
		if (episode_id == 0) {
			sqlSession.close();
			web.redirect(null, "에피소드 번호가 지정되지 않았습니다.");
			return null;
		}
		
		
		/** 로그인 여부 검사 */
		
		
		int memberId = 0;
		
		Member loginInfo = new Member();
		
		loginInfo = (Member)web.getSession("loginInfo");
		
		logger.debug("loginInfo-------------------------------------->" + loginInfo);
		
		if(loginInfo != null){
			memberId = loginInfo.getId();
		}
		
		
		logger.debug("member_id -----------------------------------> " + memberId);
		
		
		
		
		
		
		
		
		/** 파라미터 Beans로 묶기 */
		Episode episode = new Episode();
		episode.setId(episode_id);
		episode.setBook_id(book_id);
		
		Book book = new Book();
		book.setId(book_id);
		
	
		
		Episode episodeItem = new Episode();
		Book bookItem = new Book();
		
		
		/** 별점 등록 확인 여부 */ 
		int resultaddStarCount = 0;
		
		//
		StarMark star = new StarMark();
		star.setMember_id(memberId);
		star.setEpisode_id(episode_id);
		
		List<Episode> episodeTitleList = null;		//에피소드 제목 리스트 저장 변수
		try{
			
			/** 별점 참여 여부 검사 */ 
			resultaddStarCount = starMarkService.selectCountAddStarById(star);
			
			/** 한개의 에피소드 가져오기 */
			episodeItem = episodeService.selectOneEpisodeItem(episode);
			
			/** 한개의 작품 정보 가져오기 */
			bookItem = bookService.selectOneBookItem(book);
			
			/** 한개의 작품속에 있는 에피소드의 제목과 ID*/
			episodeTitleList = episodeService.selectAllEpisodeTitle(episode);
			
			
		}catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, "에피소드 번호가 지정되지 않았습니다.");
			return null;
		}finally{
			sqlSession.close();
		}
		
		
		boolean isStarAdd = false;
		if(resultaddStarCount > 0){
			isStarAdd = true;
		}
		
		
		logger.debug("isStarAdd -----------------------------------------> " + isStarAdd);
		
		request.setAttribute("isStarAdd", isStarAdd);
		request.setAttribute("episodeTitleList", episodeTitleList);
		request.setAttribute("episode", episodeItem);
		request.setAttribute("book", bookItem);
        
		request.setAttribute("member_id", memberId);
		request.setAttribute("book_id", book_id);
		
		
		return view;
	}

}
