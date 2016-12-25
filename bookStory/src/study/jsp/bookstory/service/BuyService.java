package study.jsp.bookstory.service;

import java.util.List;
import java.util.Map;

import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;

// 에피소드의 구매에 대한 Service
public interface BuyService {
	
	/**
	 * 전체의 Episode를 구매한 책을 등록
	 * @param all_buy
	 * @throws Exception
	 */
	public void insertEpisodeAllBuy(Map<String,Object> map) throws Exception;
	
	/**
	 * 회원이 작품n개의 구입후 Point수정
	 * @param buy_point
	 * @throws Exception
	 */
	public void updateMemberBuyPoint(Member buy_point) throws Exception;
	
	/**
	 * 회원이 모든작품의 구입후 Point수정
	 * @param all_buy_point
	 * @throws Exception
	 */
	public void updateMemberAllBuyPoint(Member buy_all_point) throws Exception;
	
	/**
	 * 회원이 구매한 모든 작품의 리스트 (윤식)
	 * @param all_buy_list
	 * @throws Exception
	 */
	public List<Buy> selectBuyList(Buy buy) throws Exception;
	
	/**
	 * 특정 회원에 속한 모든 구매 내역을 삭제한다.
	 * @param buy
	 * @throws Exception
	 */
	public void deleteBuyAll(Buy buy) throws Exception;
	
	/** 
	 * 회원의 작품 구매 목록 조회
	 * @param buy
	 * @return
	 * @throws Exception
	 */
	public List<Buy> selectPurchaseEpisodeList(Buy buy) throws Exception;
	
	/**
	 *  전체 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectBuyCount(Buy buy) throws Exception;
	
	/**
	 * 회원의 에피소드에 대한 구매 여부 확인
	 * @param buy
	 * @return
	 * @throws Exception
	 */
	public int selectBuyCountByMemberId(Buy buy)throws Exception;
}
