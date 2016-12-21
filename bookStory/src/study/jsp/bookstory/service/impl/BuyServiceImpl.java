package study.jsp.bookstory.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
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
	public void insertEpisodeAllBuy(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlSession.insert("BuyMapper.insertAllEpisode", map);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("저장된 전체 구매목록이 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("전체 구매목록 저장에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
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

	@Override
	public List<Buy> selectPurchaseEpisodeList(Buy buy) throws Exception {
		// TODO Auto-generated method stub
		List<Buy> result = null;
		
		try {
			result = sqlSession.selectList("BuyMapper.selectPurchaseEpisodeList", buy);

		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("구매목록  조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 회원이 구매한 작품의 에피소드 수
	 */
	@Override
	public int selectCountAllBuyEpisode(Buy buy) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.selectOne("BuyMapper.selectCountAllBuyEpisode", buy);

		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드의 구매목록 갯수 조회에 실패했습니다.");
		}

		return result;
	}

}
