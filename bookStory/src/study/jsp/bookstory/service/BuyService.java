package study.jsp.bookstory.service;

import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Member;

// 에피소드의 구매에 대한 Service
public interface BuyService {

	/**
	 * n개의  Episode를 구매한 책을 등록
	 * @param  buy
	 * @throws Exception
	 */
	public void insertEpisodeBuy(Buy buy) throws Exception;
	
	/**
	 * 전체의 Episode를 구매한 책을 등록
	 * @param all_buy
	 * @throws Exception
	 */
	public void insertEpisodeAllBuy(Buy all_buy) throws Exception;
	
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
	public void updateMemberAllBuyPoint(Member all_buy_point) throws Exception;
	
	/**
	 * 회원이 구매한 모든 작품의 리스트
	 * @param all_buy_list
	 * @throws Exception
	 */
	public int selectMemberBuyList(Buy all_buy_list) throws Exception;
}
