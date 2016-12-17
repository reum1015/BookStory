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
		
		try{
			int result = sqlSession.insert("BookMapper.insertBook",book);
			if(result == 0){
				//등록된 책 정보가 없다면
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			
			sqlSession.rollback();
			throw new Exception("등록된 책 정보가 없습니다.");
		}catch (Exception e) {
			
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
	
		int result = 0;
		
		try{
			result = sqlSession.selectOne("BookMapper.countEqualBookName", book);
			if(result > 0){
				throw new Exception();
			}
		}catch (Exception e) {
			
			logger.error(e.getLocalizedMessage());
			throw new Exception("같은 이름의 작품이 존재 합니다.");
		}
		return result;
	}
	
	
	/**
	 * 작품 검색(관리자용)
	 */
	@Override
	public List<Book> searchBookItemList(Book book) throws Exception {
		
		List<Book> bookList = null;
		
		try{
			bookList = sqlSession.selectList("BookMapper.searchBookItemList", book);
			if(bookList == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			
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
		
		List<Book> bookList = null;
		
		try{
			bookList = sqlSession.selectList("BookMapper.selectMainCarouselByRandomThree");
			if(bookList == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			
			throw new Exception("캐러셀이 존재 하지 않습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("메인 캐러셀 불러오기 실패했습니다.");
			
		}
	
		return bookList;
	}
	
	
	@Override
	public List<Book> selectListMainByGenre(Book book) throws Exception {
		List<Book> bookList = null;
		
		try{
			bookList = sqlSession.selectList("BookMapper.selectListMainByGenre",book);
			if(bookList == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			
			throw new Exception("메인 장르별 추천작이 존재 하지 않습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("메인 장르별 추천작 불러오기 실패했습니다.");
			
		}
	
		return bookList;
	}
	
	
	
	/**
	 * 한건의 작품 정보 조회
	 */
	@Override
	public Book selectOneBookItem(Book book) throws Exception {
		
		Book result = null;
		
		try{
			result = sqlSession.selectOne("BookMapper.selectOneBookItem", book);
			if(result == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
		
			throw new Exception("조회된 하나의 작품정보가 없습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("하나의 작품정보 불러오기 실패");
			
		}
	
		return result;
	}

	/**
	 * 총 관심등록 수 +1
	 */
	@Override
	public void updateTotalFavoritePlus(Book book) throws Exception {
		
		try{
			int result = sqlSession.update("BookMapper.updateTotalFavoritePlus",book);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("작품의 관심등록 회원 수 갱신에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
		
		
	}
	
	/**
	 * 총 관심등록 수 -1
	 */
	@Override
	public void updateTotalFavoriteMinus(Book book) throws Exception {
		
		try{
			int result = sqlSession.update("BookMapper.updateTotalFavoriteMinus",book);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("작품의 관심등록 회원 수 갱신에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
		
		
	}

	@Override
	public void updateStarAvg(Book book) throws Exception {
	
		try{
			int result = sqlSession.update("BookMapper.updateStarAvg",book);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("작품의 별점 평균 갱신에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
	}


	/**
	 * 메인 남여별 인기작(여성)
	 */
	@Override
	public List<Book> selectListForMainByGenderFemale(Book book) throws Exception {
		// TODO Auto-generated method stub
		List<Book> bookList = null;
		try{
			bookList = sqlSession.selectList("BookMapper.selectListForMainByGenderFemale");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("메인 남여 인기작(여) 불러오기 실패했습니다.");
			
		}
		return bookList;
	}

	/**
	 * 메인 남여별 인기작(남성)
	 */
	@Override
	public List<Book> selectListForMainByGenderMale(Book book) throws Exception {
		// TODO Auto-generated method stub
		List<Book> bookList = null;
		try{
			bookList = sqlSession.selectList("BookMapper.selectListForMainByGenderMale");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("메인 남여 인기작(남) 불러오기 실패했습니다.");
			
		}
		return bookList;
	}

	@Override
	public List<Book> selectNovelListByDay(Book book) throws Exception {
		// TODO Auto-generated method stub
				List<Book> bookList = null;
				try{
					bookList = sqlSession.selectList("BookMapper.selectNovelListByDay",book);
				}catch (Exception e) {
					logger.error(e.getLocalizedMessage());
					throw new Exception("요일별 작품 리스트 불러오기 실패했습니다.");
					
				}
				return bookList;
	}


	

}
