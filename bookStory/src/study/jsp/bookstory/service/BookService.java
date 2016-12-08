package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.Book;

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
	 * 한개의 작품 정보 가져오기
	 * @return
	 * @throws Exception
	 */
	public Book selectOneBookItem(Book book)throws Exception;

}
