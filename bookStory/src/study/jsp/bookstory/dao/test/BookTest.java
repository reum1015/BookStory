package study.jsp.bookstory.dao.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.impl.BookServiceImpl;

public class BookTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger(StarmarkTest.class.getName());
		
		BookService bookService = new BookServiceImpl(sqlSession, logger);
		
		Book book = new Book();
		book.setId(1);
		
		Book book1 = new Book();
		
		try{
			book1 = bookService.selectOneBookItem(book);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		System.out.println(book1.toString());
		
	}

}
