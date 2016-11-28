package study.jsp.bookstory.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.service.BookService;

public class BookServiceImpl implements BookService{

	/** 처리 결과를 위한 Log4J객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public BookServiceImpl(SqlSession sqlSession,Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}
	
	/**
	 * 책 등록
	 * @param book - 책 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public void insertBook(Book book) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlSession.insert("BookMapper.insertBook",book);
			if(result == 0){
				//등록된 책 정보가 없다면
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlSession.rollback();
			throw new Exception("등록된 책 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("책 등록에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
		
	}

}
