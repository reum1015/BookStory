package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;
import study.jsp.bookstory.service.RentService;

public class RentServiceImpl implements RentService{

	/** 처리결과를 확인하기 위한 Log4j 객체 생성 */
	Logger logger;
	
	/** MyBatis 객체 생성 */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public RentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertEpisodeRent(Rent rent_insert) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertEpisodeAllRent(Rent rent_all_insert) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMemberRentPoint(Member rent_point) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMemberAllRentPoint(Member rent_all_point) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Rent> selectMemberRentList(Rent rent_all_list) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
