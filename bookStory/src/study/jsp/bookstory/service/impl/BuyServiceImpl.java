package study.jsp.bookstory.service.impl;

import java.util.List;
import java.util.Map;

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

	
	
	/**
	 * 선택한 에피소드 구매 테이블에 등록
	 */
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
			throw new Exception("저장된 구매목록이 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("구매목록 저장에 실패했습니다.");
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
	public List<Buy> selectBuyList(Buy buy) throws Exception {
		  List<Buy> result = null;
			
			try {
				result = sqlSession.selectList("BuyMapper.selectBuyList", buy);
				if (result == null) {
					throw new NullPointerException();
				}
			} catch (NullPointerException e) {
				throw new Exception("구매 처리된 에피소드목록이 없습니다.");
			} catch (Exception e) {
				logger.error(e.getLocalizedMessage());
				throw new Exception("구매 목록 조회에 실패했습니다.");
			}				
			return result;
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

	@Override
	public int selectBuyCount(Buy buy) throws Exception {
		 int result = 0;		
			try {
				// 게시물 수가 0건인 경우도 있으므로
				// 결과값이 0인 경우에 예외를 발생시키지 않는다.
				result = sqlSession.selectOne("BuyMapper.selectBuyCount", buy);
			} catch(Exception e) {
				logger.error(e.getLocalizedMessage());
				throw new Exception("구매내역 수 조회에 실패했습니다. ");
			}		
			return result;
		}

}
