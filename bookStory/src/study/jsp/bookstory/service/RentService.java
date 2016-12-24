package study.jsp.bookstory.service;

import java.util.List;
import java.util.Map;

import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;

public interface RentService {

	/**
	 * 회원이 선택한 대여 에피소드들 저장
	 * @param all_buy
	 * @throws Exception
	 */
	public void insertEpisodeAllRent(Map<String,Object> map) throws Exception;
	
		
	/**
	 * 특정 회원에 속한 모든 대여 리스트 조회한다. (윤식)
	 * @param rent
	 * @throws Exception
	 */
	public List<Rent> selectRentList(Rent rent) throws Exception;	
	
	/**
	 * 특정 회원에 속한 모든 대여 내역을 삭제한다.
	 * @param rent
	 * @throws Exception
	 */
	public void deleteRentAll(Rent rent) throws Exception;
	
	/**
	 *  전체 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectRentCount(Rent rent) throws Exception;
	
	/**
	 * 선택한 모든 에피소드의 남은 시간
	 * @param rent
	 * @return
	 * @throws Exception
	 */
	public List<Rent> selectEndRentTerm(Map map) throws Exception;
	
	/**
	 * 작품의 모든 에피소드의 남은 시간
	 * @param rent
	 * @return
	 * @throws Exception
	 */
	public List<Rent> selectEndRentTermForBook(Rent rent) throws Exception;
	
}
