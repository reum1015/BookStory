package study.jsp.bookstory.service;


import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.model.Episode;

public interface EpisodeService {

	/**
	 * 회차 등록 등록
	 * @param book
	 * @throws Exception
	 */
	public void insertEpisode(Episode episode)throws Exception;
	
	/**
	 *  같은 이름의 에피소드 제목이 있는지 검사
	 * @param book
	 * @throws Exception
	 */
	public int countEqualEpisodeName(Episode episode)throws Exception;

}
