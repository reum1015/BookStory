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
	 * 회원이 대여한 모든 작품의 리스트
	 * @param all_rent_list
	 * @throws Exception
	 */
	public List<Rent> selectMemberRentList(Rent rent_all_list) throws Exception;
}
