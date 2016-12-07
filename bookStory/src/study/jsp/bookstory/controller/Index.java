package study.jsp.bookstory.controller;

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
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;


@WebServlet("/index.do")
public class Index extends BaseController{
	

	/**
	 *  시리얼 재발급 
	 */
	private static final long serialVersionUID = -2715156977810660808L;
	
	
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	ImageFileService imageFileService;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "";
		view = "index";
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		List<Book> carouselList = new ArrayList<>();
		
		try{
			carouselList = bookService.selectMainCarouselByRandomThree();
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
	
		
		
		
		
		request.setAttribute("carouselList", carouselList);
		
		return view;
	}

}
