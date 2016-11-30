package study.jsp.bookstory.service;


import study.jsp.bookstory.model.Episode;

public interface EpisodeService {

	/**
	 * 회차 등록 등록
	 * @param book
	 * @throws Exception
	 */
	public void insertEpisode(Episode episode)throws Exception;

}
