package study.jsp.bookstory.service;

import study.jsp.bookstory.model.StarMark;

public interface StarMarkService {
	
	/**
	 * 별첨 추가
	 * @param star
	 * @throws Exception
	 */
	public void insertAddStar(StarMark star)throws Exception;
	
	/**
	 * 에피소드 별점 평균
	 * @param star
	 * @return
	 * @throws Exception
	 */
	public double selectStarAvgEpisode(StarMark star)throws Exception;
	
	/**
	 * 에피소드 별점 등록 총 회원 수 
	 * @param star
	 * @return
	 * @throws Exception
	 */
	public int selectStarCountEpisode(StarMark star)throws Exception;
	
	/**
	 * 작품 별점 평균
	 * @param star
	 * @return
	 * @throws Exception
	 */
	public double selectStarAvgBook(StarMark star)throws Exception;

}
