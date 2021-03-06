package study.jsp.bookstory.service;


import java.util.List;
import java.util.Map;

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
	
	
	/**
	 * 그 작품 에피소드의 총 횟차 수
	 * @param episode
	 * @return
	 * @throws Exception
	 */
	public int countTotalEpisodeByBookId(Episode episode)throws Exception;
	
	/**
	 * 작품의 에피소드 리스트
	 * 	 
	 * @param episode
	 * @return
	 * @throws Exception
	 */
	public List<Episode> selectEpisdoeListAllByBook(Episode episode)throws Exception;
	
	/**
	 * 작품의 에피소드 첫화
	 * @param episode
	 * @return
	 * @throws Exception
	 */
	public int selectFirstEpisodeIdByBookId(Episode episode)throws Exception;
	
	/**
	 * 한개의 에피소드 가져오기
	 * @param episode
	 * @return
	 * @throws Exception
	 */
	public Episode selectOneEpisodeItem(Episode episode)throws Exception;
	
	
	/**
	 * 한 작품에 속한 모든 에피소드의 제목(뷰페이지 리스트박스용)
	 * @param episode
	 * @return
	 * @throws Exception
	 */
	public List<Episode> selectAllEpisodeTitle(Episode episode)throws Exception;
	
	/**
	 * 에피소드 테이블에 별점등록 총 회원수, 별점 평균 등록
	 * @param episode
	 * @throws Exception
	 */
	public void updateStarCountAndAvg(Episode episode)throws Exception;
	
	
	/**
	 * 작품의 총 에피소드 구입용 select
	 * @param episode
	 * @return
	 * @throws Exception
	 */
	public List<Episode> selectEpisdoeListByBookForBuy(Episode episode)throws Exception;
	
	/**
	 * 회원이 선택한 에피소드의 총 구매 가격
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int selectTotalPointByEpisodeIds(Map map)throws Exception;
	
	
	/**
	 * 회원이 선택한 에피소드들의 각각의 구매 가격
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Episode> selectEachPointByEpisodeIds(Map map)throws Exception;
	
	/**
	 * 회원이 선택한 에피소드들의 각각의 대여 가격
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Episode> selectEachRentPointByEpisodeIds(Map map)throws Exception;
	
	/**
	 * 회원이 선택한 에피소드의 총 대여 가격
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int selectTotalRentPointByEpisodeIds(Map map)throws Exception;
	
	/**
	 * episode hit +1
	 * @param episode
	 * @throws Exception
	 */
	public void updateEpisodeHit(Episode episode)throws Exception;
	
	/**
	 * 현재 에피소드 기준으로 이전 에피소드 읽어옮
	 * @param episode - 현재Episode에 대한 정보가 저장된 Beans
	 * @return
	 * @throws Exception
	 */
	public Episode selectPreEpisode(Episode episode)throws Exception;


	/**
	 * 현재 에피소드 기준으로 다음 에피소드 읽어옮
	 * @param episode - 현재Episode에 대한 정보가 저장된 Beans
	 * @return
	 * @throws Exception
	 */
	public Episode selectNextEpisode(Episode episode)throws Exception;
	
	/**
	 * 에피소드 업데이트
	 * @param episode - 현재Episode에 대한 정보가 저장된 Beans
	 * @return
	 * @throws Exception
	 */
	public void updateEpisodeItem(Episode episode)throws Exception;
	
	
	
	
	
	
}
