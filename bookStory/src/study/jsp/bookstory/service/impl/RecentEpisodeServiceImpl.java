package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.RecentEpisode;
import study.jsp.bookstory.service.RecentEpisodeService;

public class RecentEpisodeServiceImpl implements RecentEpisodeService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public RecentEpisodeServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertAddRecentEpisode(RecentEpisode recentepisode) throws Exception {
		try {
			int result = sqlSession.insert("RecentEpisodeMapper.insertAddRecentEpisode", recentepisode);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 최근작품이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("최근작품 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void deleteRemoveRecentEpisode(RecentEpisode recentepisode) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RecentEpisode> selectRecentEpisodeList(RecentEpisode recentepisode) throws Exception {
List<RecentEpisode> result = null;
		
		try {
			result = sqlSession.selectList("RecentEpisodeMapper.selectRecentEpisodeList", recentepisode);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("최근작품 에피소드목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("최근작품 목록 조회에 실패했습니다.");
		}		
		
		return result;
	}

	@Override
	public int selectRecentEpisodeCount(RecentEpisode recentepisode) throws Exception {
	int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("RecentEpisodeMapper.selectRecentEpisodeCount", recentepisode);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("최근작품 수 조회에 실패했습니다. ");
		}
		
		return result;
	}
	
	@Override
	public void deleteRecentEpisodeAll(RecentEpisode recentepisode) throws Exception {
		try{
			// 최근본 작품이 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("RecentEpisodeMapper.deleteRecentEpisodeAll", recentepisode);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("최근본 작품 모두 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void deleteRecentEpisodeOneByOld(RecentEpisode recentepisode) throws Exception {
		try{
			// 최근본 작품이 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("RecentEpisodeMapper.deleteRecentEpisodeOneByOld", recentepisode);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("최근본 작품 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}



}
