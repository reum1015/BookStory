package study.jsp.bookstory.service;

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

}
