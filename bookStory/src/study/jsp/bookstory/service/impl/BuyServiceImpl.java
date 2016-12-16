package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BuyService;

public class BuyServiceImpl implements BuyService{

	/** 처리결과를 위한 Log4j 객체 생성 */
	Logger logger;
	
	/** MyBatis 객체 생성*/
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public BuyServiceImpl(SqlSession sqlSession, Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertEpisodeBuy(Buy buy_insert) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertEpisodeAllBuy(Buy all_buy_insert) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMemberBuyPoint(Member buy_point) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMemberAllBuyPoint(Member buy_all_point) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Buy> selectMemberBuyList(Buy buy_all_list) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void deleteBuyAll(Buy buy) throws Exception {
		try{
			// 구매내역이 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("BuyMapper.deleteBuyAll", buy);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("구매내역 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

}
