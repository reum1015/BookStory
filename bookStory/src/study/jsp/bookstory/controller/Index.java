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
import study.jsp.helper.TextConverter;
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
	TextConverter textConverter; 
	
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
		textConverter = TextConverter.getInstance();
		
		//메인 케러셀용 작품 리스트(랜덤 3개)
		List<Book> carouselList = new ArrayList<>();
		
		//메인 장르별 추천작 4개
		List<Book> mainGenrelList = new ArrayList<>();
		
		
		try{
			
			//메인 케러셀용 작품 리스트(랜덤 3개)
			carouselList = bookService.selectMainCarouselByRandomThree();
			
			//메인 장르별 추천작 4개
			mainGenrelList = bookService.selectListMainByGenre();
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		
		//메인 장르별 추천작 텍스트 변환(ex.. MON --> 월요일, Romance --> 로맨스)
		if(mainGenrelList != null){
			Book tempGenreForMain = mainGenrelList.get(0);
			
			String genreformain = tempGenreForMain.getGenre();
			request.setAttribute("genreformain", genreformain);
			
			
			Book temp = new Book();
			
			for(int i = 0 ; i < mainGenrelList.size(); i++){
				temp = mainGenrelList.get(i);
				
				String tempDay = temp.getDaily_date();
				String tempGenre = temp.getGenre();
				
				String day = textConverter.genreOrDayConverter(tempDay);
				String genre = textConverter.genreOrDayConverter(tempGenre);
				
				temp.setDaily_date(day);
				temp.setGenre(genre);
				logger.debug("getDaily_date create > " + temp.getDaily_date());
				logger.debug("getGenre create > " + temp.getGenre());
			}
			
		}
		
		//메인 캐러셀 텍스트 변환(ex.. MON --> 월요일, Romance --> 로맨스)
				if(carouselList != null){
					Book temp = new Book();
					
					for(int i = 0 ; i < carouselList.size(); i++){
						temp = carouselList.get(i);
						
						String tempDay = temp.getDaily_date();
						String tempGenre = temp.getGenre();
						
						String day = textConverter.genreOrDayConverter(tempDay);
						String genre = textConverter.genreOrDayConverter(tempGenre);
						
						temp.setDaily_date(day);
						temp.setGenre(genre);
						logger.debug("getDaily_date create > " + temp.getDaily_date());
						logger.debug("getGenre create > " + temp.getGenre());
					}
					
				}

		request.setAttribute("mainGenrelList", mainGenrelList);
		request.setAttribute("carouselList", carouselList);
		
		return view;
	}

}
