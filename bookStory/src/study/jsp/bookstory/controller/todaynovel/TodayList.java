package study.jsp.bookstory.controller.todaynovel;

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
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.CommonUtils;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/todaynovel/todayList.do")
public class TodayList extends BaseController{

	private static final long serialVersionUID = 2974413864183931676L;

	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	ImageFileService imageFileService;
	UploadHelper upload;
	CommonUtils commonUtils; 
	
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		commonUtils = CommonUtils.getInstance();
		
		//오늘 요일 받기
		String today = web.getString("today");
		String order = web.getString("order");
		
		//오늘 요일 파라미터 셋팅
		Book book = new Book();
		book.setDaily_date(today);
		book.setOrder(order);

		List<Book> todayList = new ArrayList<Book>();
		
		try{
			todayList = bookService.selectNovelListByDay(book);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		logger.debug("todayList ---------------------> " + todayList);
		
		
		if(todayList != null){
			Book temp = new Book();
			
			for(int i = 0 ; i < todayList.size(); i++){
				temp = todayList.get(i);
				
				String tempGenre = temp.getGenre();
				
				String genre = commonUtils.genreOrDayConverter(tempGenre);
				
				temp.setGenre(genre);
			}
			
		}
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("todayList",todayList);
		data.put("today",today);
		data.put("order",order);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}

}
