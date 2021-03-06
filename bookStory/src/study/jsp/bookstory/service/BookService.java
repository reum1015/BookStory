package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.model.Buy;

/** Novel 관련 기능을 제공하기 위한 Service계층 */
public interface BookService {
	
	/**
	 * Novel 등록
	 * @param book
	 * @throws Exception
	 */
	public void insertBook(Book book)throws Exception;
	
	/**
	 *  같은 이름의 작품이 있는지 검사
	 * @param book
	 * @throws Exception
	 */
	public int countEqualBookName(Book book)throws Exception;
	
	
	/**
	 * 작품 검색(관리자 에피소드 올리기)
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> searchBookItemList(Book book)throws Exception;
	
	/**
	 * 메인 캐러셀(랜덤3개)
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectMainCarouselByRandomThree()throws Exception;
	
	/**
	 * 메인 장르별 추천작(랜덤3개)
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectListMainByGenre(Book book)throws Exception;
	
	
	/**
	 * 한개의 작품 정보 가져오기
	 * @return
	 * @throws Exception
	 */
	public Book selectOneBookItem(Book book)throws Exception;
	
	
	/**
	 * 작품에 대한 총 관심등록 수 +1
	 * @param book
	 * @throws Exception
	 */
	public void updateTotalFavoritePlus(Book book)throws Exception;
	
	/**
	 * 작품에 대한 총 관심등록 수 -1
	 * @param book
	 * @throws Exception
	 */
	public void updateTotalFavoriteMinus(Book book)throws Exception;
	
	
	/**
	 * 작품의 별점평균 업데이트
	 * @param book
	 * @throws Exception
	 */
	public void updateStarAvg(Book book)throws Exception;

	
	/**
	 * 남여별 인기 추천작 메인 (여성)
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectListForMainByGenderFemale(Book book)throws Exception;

	
	
	/**
	 * 남여별 인기 추천작 메인 (남성)
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectListForMainByGenderMale(Book book)throws Exception;
	
	
	/**
	 *  TodayNovel 오늘날짜 작품 리스트 
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectNovelListByDay(Book book)throws Exception;
	
	
	/**
	 * 작품의 총 구매 포인트와 렌트 포인트 업데이트
	 * @param book
	 * @throws Exception
	 */
	public void updateTotalBuyAndRentPointForBook(Book book)throws Exception;
	
	/**
	 * 작품의 총 구매 포인트와 총 렌트 포인트 조회
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public Book selectTotalPointFromBook(Book book)throws Exception;
	
	/**
	 * book hit +1
	 * @param episode
	 * @throws Exception
	 */
	public void updateBookHit(Book book)throws Exception;
	
	/**
	 * 장르별 List
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectListByGenre(Book book)throws Exception;
	
	
	/**
	 *  연령대 별 순위
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectRankListByAge(int age)throws Exception;
	
	/**
	 *  작품 리스트
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public List<Book> selectAllBookList(Book book)throws Exception;
	
	
	/**
	 * 작품 업데이트
	 * @param book
	 * @throws Exception
	 */
	public void updateBook(Book book)throws Exception;

	
	
	
	
}
