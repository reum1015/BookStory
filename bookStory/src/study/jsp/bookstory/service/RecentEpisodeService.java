package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.RecentEpisode;



public interface RecentEpisodeService {
	/**
	 * 최근작품을 저장한다.
	 * @param recentepisode - 최근작품 데이터
	 * @throws Exception
	 */
	public void insertAddRecentEpisode(RecentEpisode recentepisode) throws Exception;
	
	/**
	 * 하나의 최근작품을 삭제한다.
	 *  @param recentepisode - 최근작품 데이터
	 * @throws Exception
	 */
	public void deleteRemoveRecentEpisode(RecentEpisode recentepisode) throws Exception;
	
	/**
	 * 최근작품 목록 조회
	 *  @param recentepisode - 최근작품이 저장된 BEans
	 *  @return List- 에피소드 목록
	 * @throws Exception
	 */
	public List<RecentEpisode> selectRecentEpisodeList(RecentEpisode recentepisode) throws Exception;
	
	/**
	 *  전체 최근작품 목록 조회
	 *  @param recentepisode - 최근작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectRecentEpisodeCount(RecentEpisode recentepisode) throws Exception;
	
}