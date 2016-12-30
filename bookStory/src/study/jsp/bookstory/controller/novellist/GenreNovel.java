package study.jsp.bookstory.controller.novellist;

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

/**
 * Servlet implementation class GenreNovel
 */
@WebServlet("/novellist/genre_novel.do")
public class GenreNovel extends BaseController {

	private static final long serialVersionUID = -8191602294059016913L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	ImageFileService imageFileService;
	UploadHelper upload;
	CommonUtils commonUtils;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		commonUtils = CommonUtils.getInstance();
		
        String genre = web.getString("genre");
        String order = web.getString("order");
        
        if(genre.equals("SFFantasy")){
        	genre="SF&Fantasy";
        }
        
        
        logger.debug("genre *********************** " + genre);
        
        Book book = new Book();
        book.setGenre(genre);
        book.setOrder(order);
		
		
		List<Book> ggenreList = new ArrayList<Book>();
		
		try{
			ggenreList = bookService.selectListByGenre(book);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		if(ggenreList != null){
			Book temp = new Book();
			
			for(int i=0; i<ggenreList.size(); i++){
				temp = ggenreList.get(i);
				
				String tempGenre = temp.getGenre();
				String genreConvert = commonUtils.genreOrDayConverter(tempGenre);
				
				temp.setGenre(genreConvert);
			}
		}
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("ggenreList",ggenreList);
		
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
	
}
