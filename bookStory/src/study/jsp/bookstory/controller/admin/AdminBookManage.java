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
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.CommonUtils;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/book_manage.do")
public class AdminBookManage extends BaseController{
	private static final long serialVersionUID = -3926502295903972315L;
	
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	RegexHelper regex;
	CommonUtils commonUtils;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "admin/admin_book_manage";
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		bookService = new BookServiceImpl(sqlSession, logger);
		commonUtils = CommonUtils.getInstance();
		
		List<Book> bookList = new ArrayList<>();
		
		try{
			bookList = bookService.selectAllBookList(null);
		}catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		request.setAttribute("bookList", bookList);
		
		
		
		//장르 한글 변환
				if(bookList != null){
					for(int i = 0; i < bookList.size(); i++){
						Book bookItem  = bookList.get(i);
						String tempgenre = bookItem.getGenre();
						if(tempgenre != null){
							String genre= commonUtils.genreOrDayConverter(tempgenre);
							bookItem.setGenre(genre);
							logger.debug("Genre ---------> " + bookItem.getGenre());
						}
					}
				}		
		
		return view;
		
		
		
	}

}
