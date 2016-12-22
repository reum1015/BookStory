package study.jsp.bookstory.service;

import java.util.List;


import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;

public interface RentService {

	/**
	 * n개의  Episode를 대여한 책을 등록
	 * @param rent
	 * @throws Exception
	 */
	public void insertEpisodeRent(Rent rent_insert) throws Exception;
	
	/**
	 * 전체의 Episode를 대여한 책을 등록
	 * @param all_rent
	 * @throws Exception
	 */
	public void insertEpisodeAllRent(Rent rent_all_insert) throws Exception;
	
	/**
	 * 회원이 n개의 에피소드 대여후 Point수정
	 * @param rent_point
	 * @throws Exception
	 */
	public void updateMemberRentPoint(Member rent_point) throws Exception;
	
	/**
	 * 회원의 전체의 에피소드 대여후 Point수정
	 * @param all_rent_point
	 * @throws Exception
	 */
	public void updateMemberAllRentPoint(Member rent_all_point) throws Exception;
	
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
	
}
