package study.jsp.bookstory.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<Rent> selectRentList(Rent rent) throws Exception {
         List<Rent> result = null;
		
		try {
			result = sqlSession.selectList("RentMapper.selectRentList", rent);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("대여 처리된 에피소드목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("대여 목록 조회에 실패했습니다.");
		}				
		return result;
	}
	
	
	@Override
	public void deleteRentAll(Rent rent) throws Exception {
		try{
			// 대여내역이 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("RentMapper.deleteRentAll", rent);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("대여내역 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public int selectRentCount(Rent rent) throws Exception {
         int result = 0;		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("RentMapper.selectRentCount", rent);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("대여내역 수 조회에 실패했습니다. ");
		}		
		return result;
	}

	
	/**
	 * 회원이 선택한 대여 에피소드들 저장
	 */
	@Override
	public void insertEpisodeAllRent(Map<String, Object> map) throws Exception {
		try{
			int result = sqlSession.insert("RentMapper.insertAllRentEpisode", map);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("저장된 대여 목록이 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("대여목록 저장에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}		
	}

	@Override
	public List<Rent> selectEndRentTerm(Map map) throws Exception {
		List<Rent> result = null;
		try {
			result = sqlSession.selectList("RentMapper.selectEndRentTerm", map);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("선택한 에피소드의 대여기간 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드의 대여기간 조회에 실패했습니다.");
		}				
		return result;
		
	}

	
	/**
	 * 작품의 모든 에피소드의 남은 대여기간
	 */
	@Override
	public List<Rent> selectEndRentTermForBook(Rent rent) throws Exception {
		List<Rent> result = null;
		try {
			result = sqlSession.selectList("RentMapper.selectEndRentTermForBook", rent);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("작품의 모든 에피소드의 대여기간 조회에 실패했습니다.");
		}				
		return result;
	}


	/**
	 * 회원의 에피소드에 대한 대여 여부 확인, 남은기간 조회
	 */
	@Override
	public Rent selectRentCountByMemberId(Rent rent) throws Exception {
		// TODO Auto-generated method stub
		Rent result = new Rent();
		try {
			result = sqlSession.selectOne("RentMapper.selectRentCountByMemberId", rent);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드에 대한 대여기간 조회에 실패했습니다.");
		}
		return result;
	}
}
