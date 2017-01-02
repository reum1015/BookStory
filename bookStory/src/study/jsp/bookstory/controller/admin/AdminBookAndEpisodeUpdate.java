package study.jsp.bookstory.controller.admin;

import java.io.IOException;

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
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/admin_bookAndEpisodeUpdate.do")
public class AdminBookAndEpisodeUpdate extends BaseController{
	private static final long serialVersionUID = -2689903639711580690L;

	Logger logger;
	SqlSession sqlSession;
	EpisodeService episodeService;
	ImageFileService imageFileService;
	BookService bookService;
	WebHelper web;
	UploadHelper upload;
	RegexHelper regex;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "";
		
		/** (2)사용하고자 하는 Helper + Serive 객체 선언*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		
		String tempBook_id = web.getString("book_id");
		String tempEpisode_id = web.getString("episode_id");
		
		int book_id = 0;
		int episode_id = 0;
		
		//세팅 객체
		Book bookParam = new Book();
		Episode epiParam = new Episode();
		
		//저장 객체
		Book bookItem = new Book();
		Episode epiItem = new Episode();
		
		if(tempEpisode_id == null){
			book_id = Integer.parseInt(tempBook_id);
			bookParam.setId(book_id);
			
			try{
				bookItem = bookService.selectOneBookItem(bookParam);
				
				view = "admin/admin_edit_book";
			}catch (Exception e) {
				// TODO: handle exception
				web.redirect(null, e.getLocalizedMessage());
			}finally {
				sqlSession.close();
			}
			
		}else if(tempEpisode_id != null && tempBook_id != null){
			episode_id = Integer.parseInt(tempEpisode_id);
			epiParam.setId(episode_id);
			
			book_id = Integer.parseInt(tempBook_id);
			
			try{
				epiItem = episodeService.selectOneEpisodeItem(epiParam);
				view = "admin/admin_edit_episode";
			}catch (Exception e) {
				// TODO: handle exception
				web.redirect(null, e.getLocalizedMessage());
			}finally {
				sqlSession.close();
			}
		}
		
		
		request.setAttribute("bookItem", bookItem);
		request.setAttribute("epiItem", epiItem);
		request.setAttribute("book_id", book_id);
		
		return view;
	}
	

}
