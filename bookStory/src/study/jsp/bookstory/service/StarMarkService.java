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
	 * 에피소드 별점 평균, 별점 등록 총 회원 수 
	 * @param star
	 * @return
	 * @throws Exception
	 */
	public StarMark selectStarCountAndAvgEpisode(StarMark star)throws Exception;
	
	
	/**
	 * 작품 별점 평균
	 * @param star
	 * @return
	 * @throws Exception
	 */
	public double selectStarAvgBook(StarMark star)throws Exception;
	
	/**
	 * 별점 등록 확인 1---> 별점 등록, 0 ---->별점 등록 X
	 * @param star
	 * @return
	 * @throws Exception
	 */
	public int selectCountAddStarById(StarMark star)throws Exception;
	
	/**
	 * 특정 회원에 속한 모든 구매 내역을 삭제한다.
	 * @param buy
	 * @throws Exception
	 */
	public void deleteStarMarkAll(StarMark starmark) throws Exception;

}
