package study.jsp.bookstory.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
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


@WebServlet("/admin/book_updateList.do")
public class AdminBookUpdateList extends BaseController{
	private static final long serialVersionUID = 2065878891751460461L;
	
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
		String view = "admin/admin_book_updateList";
		
		
		/** (2)사용하고자 하는 Helper + Serive 객체 선언*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		
		//파라미터 받기
		String tempBook_id = web.getString("book_id");
		int book_id = 0;
		
		if(tempBook_id != null){
			book_id = Integer.parseInt(tempBook_id);
		}
		
		logger.debug("book_id -------------> " + book_id);
		
		//파라미터 셋팅
		Book bookParam = new Book();
		bookParam.setId(book_id);
		
		Episode epiParam = new Episode();
		epiParam.setBook_id(book_id);
		
		//저장 객체
		Book bookItem = new Book();
		List<Episode> episodeList = new ArrayList<Episode>();
		
		try{
			bookItem = bookService.selectOneBookItem(bookParam);
			episodeList = episodeService.selectEpisdoeListAllByBook(epiParam);
		}catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		request.setAttribute("bookItem", bookItem);
		request.setAttribute("episodeList", episodeList);
		return view;
	}

}
