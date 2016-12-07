package study.jsp.bookstory.service.impl;

import java.util.List;

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
	/**
	 *  같은 이름의 작품이 있는지 검사
	 * @param book
	 * @throws Exception
	 */
	@Override
	public int countEqualBookName(Book book) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		try{
			result = sqlSession.selectOne("BookMapper.countEqualBookName", book);
			if(result > 0){
				throw new Exception();
			}
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("같은 이름의 작품이 존재 합니다.");
		}
		return result;
	}

	@Override
	public List<Book> searchBookItemList(Book book) throws Exception {
		// TODO Auto-generated method stub
		List<Book> bookList = null;
		
		try{
			bookList = sqlSession.selectList("BookMapper.searchBookItemList", book);
			if(bookList == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("검색 결과가 없습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("작품 검색에 실패 했습니다.");
			
		}
	
		return bookList;
	}

	
	/**
	 *  메인 캐러셀 3개 
	 * @param book
	 * @throws Exception
	 */
	@Override
	public List<Book> selectMainCarouselByRandomThree() throws Exception {
		// TODO Auto-generated method stub
		List<Book> bookList = null;
		
		try{
			bookList = sqlSession.selectList("BookMapper.selectMainCarouselByRandomThree");
			if(bookList == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("캐러셀이 조재 하지 않습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("메인 캐러셀 불러오기 실패했습니다.");
			
		}
	
		return bookList;
	}

}
