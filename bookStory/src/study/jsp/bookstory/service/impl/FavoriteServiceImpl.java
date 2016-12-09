package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.service.FavoriteService;

public class FavoriteServiceImpl  implements FavoriteService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public FavoriteServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertAddFavorite(Favorite favorite) throws Exception {
		try {
			int result = sqlSession.insert("FavoriteMapper.insertAddFavorite", favorite);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 관심작품이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("관심작품 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}
	

	@Override
	public void deleteRemoveFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<Favorite> selectFavoriteList(Favorite favorite) throws Exception {
         List<Favorite> result = null;
		
		try {
			result = sqlSession.selectList("FavoriteMapper.selectFavoriteList", favorite);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("관심작품에 등록된 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("관심작품 조회에 실패했습니다.");
		}		
		
		return result;
	}

	@Override
	public int selectFavoriteCount(Favorite favorite) throws Exception {
	int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("FavoriteMapper.selectFavoriteCount", favorite);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("관심작품 수 조회에 실패했습니다. ");
		}
		
		return result;
	}


}
