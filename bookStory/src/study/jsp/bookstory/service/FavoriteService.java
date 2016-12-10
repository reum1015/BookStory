package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.Favorite;


public interface FavoriteService {	
	
	/**
	 * 관심작품을 저장한다.
	 * @param favorite - 관심작품 데이터
	 * @throws Exception
	 */
	public void insertAddFavorite(Favorite favorite) throws Exception;
	
	/**
	 * 하나의 관심작품을 삭제한다.
	 *  @param favorite - 관심작품 데이터
	 * @throws Exception
	 */
	public void deleteRemoveFavorite(Favorite favorite) throws Exception;
	
	/**
	 * 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return List- 관심작품 목록
	 * @throws Exception
	 */
	public List<Favorite> selectFavoriteList(Favorite favorite) throws Exception;
	
	/**
	 *  전체 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectFavoriteCount(Favorite favorite) throws Exception;
	

}
