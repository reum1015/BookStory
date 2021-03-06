package study.jsp.bookstory.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.service.EpisodeService;

public class EpisodeServiceImpl implements EpisodeService {

	/** 처리 결과를 위한 Log4J객체 생성 */
	Logger logger;

	/** MyBatis */
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public EpisodeServiceImpl(SqlSession sqlSession, Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	/**
	 * 에피소드 등록
	 * 
	 * @param book
	 *            - 에피소드 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public void insertEpisode(Episode episode) throws Exception {

		try {
			int result = sqlSession.insert("EpisodeMapper.insertEpisode", episode);
			if (result == 0) {
				// 등록된 에피소드 정보가 없다면
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {

			sqlSession.rollback();
			throw new Exception("등록된 에피소드 정보가 없습니다.");
		} catch (Exception e) {

			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	/**
	 * 같은 이름의 에피소드가 존재하는지 검사
	 */
	@Override
	public int countEqualEpisodeName(Episode episode) throws Exception {

		int result = 0;

		try {
			result = sqlSession.selectOne("EpisodeMapper.countEqualEpisodeName", episode);
			if (result > 0) {
				throw new Exception();
			}
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("같은 이름의 작품이 존재 합니다.");
		}
		return result;
	}

	/**
	 * 작품에 속해 있는 총 에피소드의 수
	 */

	@Override
	public int countTotalEpisodeByBookId(Episode episode) throws Exception {

		int result = 0;

		try {
			result = sqlSession.selectOne("EpisodeMapper.countTotalEpisodeByBookId", episode);

		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 총 횟차 검색 에러");
		}
		return result;
	}

	/**
	 * 작품에 속해 있는 모든 에피소드 Select
	 */
	@Override
	public List<Episode> selectEpisdoeListAllByBook(Episode episode) throws Exception {

		List<Episode> result = null;

		try {
			result = sqlSession.selectList("EpisodeMapper.selectEpisdoeListAllByBook", episode);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 에피소드 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 목록 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 작품의 에피소드 첫화
	 */
	@Override
	public int selectFirstEpisodeIdByBookId(Episode episode) throws Exception {

		int result = 0;

		try {
			result = sqlSession.selectOne("EpisodeMapper.selectFirstEpisodeIdByBookId", episode);
			if (result == 0) {
				throw new NullPointerException();
			}

		} catch (NullPointerException e) {

			throw new Exception("작품의 에피소드가 존재 하지 않습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("작품의 첫화 조회에 실패했습니다.");
		}

		return result;

	}

	/***
	 * 한개의 에피소드 가져오기
	 */
	@Override
	public Episode selectOneEpisodeItem(Episode episode) throws Exception {

		Episode result = null;

		try {
			result = sqlSession.selectOne("EpisodeMapper.selectOneEpisodeItem", episode);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 에피소드가 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Episode> selectAllEpisodeTitle(Episode episode) throws Exception {

		List<Episode> result = null;

		try {
			result = sqlSession.selectList("EpisodeMapper.selectAllEpisodeTitle", episode);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 에피소드제목이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 제목 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void updateStarCountAndAvg(Episode episode) throws Exception {

		try {
			int result = sqlSession.update("EpisodeMapper.updateStarCountAndAvg", episode);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("에피소드에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 별점, 회원 수 추가 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override
	public List<Episode> selectEpisdoeListByBookForBuy(Episode episode) throws Exception {
		// TODO Auto-generated method stub
		List<Episode> result = null;

		try {
			result = sqlSession.selectList("EpisodeMapper.selectEpisdoeListByBookForBuy", episode);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 에피소드목록이(모두 구매용) 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 목록 조회에(모두 구매용) 실패했습니다.");
		}

		return result;
	}

	/**
	 * 회원이 선택한 에피소드의 총 대여 가격
	 */
	@Override
	public int selectTotalPointByEpisodeIds(Map map) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.selectOne("EpisodeMapper.selectTotalPointByEpisodeIds", map);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("선택된 에피소드의 모든 가격이 없습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드의 총 가격 조회에 실패 했습니다.");
		}

		return result;
	}

	/**
	 * 회원이 선택한 에피소드들의 각각의 구매 가격
	 */
	@Override
	public List<Episode> selectEachPointByEpisodeIds(Map map) throws Exception {
		// TODO Auto-generated method stub
		List<Episode> list = new ArrayList<Episode>();

		try {
			list = sqlSession.selectList("EpisodeMapper.selectEachPointByEpisodeIds", map);
		} catch (NullPointerException e) {
			throw new Exception("선택된 에피소드의 모든 가격이 없습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드의 총 가격 조회에 실패 했습니다.");
		}

		return list;
	}

	/**
	 * 회원이 선택한 에피소드들의 각각의 대여 가격
	 */
	@Override
	public List<Episode> selectEachRentPointByEpisodeIds(Map map) throws Exception {
		// TODO Auto-generated method stub
		List<Episode> list = new ArrayList<Episode>();

		try {
			list = sqlSession.selectList("EpisodeMapper.selectEachRentPointByEpisodeIds", map);
		} catch (NullPointerException e) {
			throw new Exception("선택된 에피소드의 각각의 대여 가격이 없습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드의 각각의 대여 가격 조회에 실패 했습니다.");
		}

		return list;
	}

	
	/**
	 * 회원이 선택한 에피소드들의 총 대여 가격
	 */
	@Override
	public int selectTotalRentPointByEpisodeIds(Map map) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.selectOne("EpisodeMapper.selectTotalRentPointByEpisodeIds", map);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("선택된 에피소드의 총 대여 가격이 없습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드의 총 대여 가격 조회에 실패 했습니다.");
		}

		return result;
	}

	@Override
	public void updateEpisodeHit(Episode episode) throws Exception {
		try{
			int result = sqlSession.update("EpisodeMapper.updateEpisodeHit",episode);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("조회수 갱신에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
	}

	@Override
	public Episode selectPreEpisode(Episode episode) throws Exception {
		Episode result = null;
		try {
			result = sqlSession.selectOne("EpisodeMapper.selectPreEpisode", episode);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 이전화 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public Episode selectNextEpisode(Episode episode) throws Exception {
		Episode result = null;
		try {
			result = sqlSession.selectOne("EpisodeMapper.selectNextEpisode", episode);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 다음화 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateEpisodeItem(Episode episode) throws Exception {
		try{
			int result = sqlSession.update("EpisodeMapper.updateEpisodeItem",episode);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 수정에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
	}

}
