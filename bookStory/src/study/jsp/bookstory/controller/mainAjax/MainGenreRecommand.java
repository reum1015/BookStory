package study.jsp.bookstory.controller.mainAjax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.CommonUtils;
import study.jsp.helper.WebHelper;

@WebServlet("/main/genreList.do")
public class MainGenreRecommand extends BaseController{

	private static final long serialVersionUID = -4787805624782434151L;
	
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	BookService bookService;
	CommonUtils commonUtils;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		commonUtils = CommonUtils.getInstance();
		
		String genre = web.getString("genre"); 
		
		Book book = new Book();
		book.setGenre(genre);
		
		List<Book> mainGenrelListForDrop = new ArrayList<Book>();
		
		try{
			//메인 장르별 추천작 4개
			mainGenrelListForDrop = bookService.selectListMainByGenre(book);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		logger.debug("mainGenrelListForDrop -------> " + mainGenrelListForDrop.toString());
		
		//메인 장르별 추천작 텍스트 변환(ex.. MON --> 월요일, Romance --> 로맨스)
				if(mainGenrelListForDrop != null){
				
					Book temp = new Book();
					
					for(int i = 0 ; i < mainGenrelListForDrop.size(); i++){
						temp = mainGenrelListForDrop.get(i);
						
						String tempDay = temp.getDaily_date();
						String tempGenre = temp.getGenre();
						
						String day = commonUtils.genreOrDayConverter(tempDay);
						String genreConvert = commonUtils.genreOrDayConverter(tempGenre);
						
						temp.setDaily_date(day);
						temp.setGenre(genreConvert);
					}
					
				}
		

		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("mainGenrelListForDrop",mainGenrelListForDrop);

		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
