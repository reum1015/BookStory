package study.jsp.bookstory.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;


import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.service.EpisodeService;

public class EpisodeServiceImpl implements EpisodeService{

	/** 처리 결과를 위한 Log4J객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public EpisodeServiceImpl(SqlSession sqlSession,Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}
	
	/**
	 * 에피소드 등록
	 * @param book - 에피소드 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public void insertEpisode(Episode episode) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlSession.insert("EpisodeMapper.insertEpisode",episode);
			if(result == 0){
				//등록된 에피소드 정보가 없다면
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlSession.rollback();
			throw new Exception("등록된 에피소드 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 등록에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public int countEqualEpisodeName(Episode episode) throws Exception {
		// TODO Auto-generated method stub
				int result = 0;
				
				try{
					result = sqlSession.selectOne("EpisodeMapper.countEqualEpisodeName", episode);
					if(result > 0){
						throw new Exception();
					}
				}catch (Exception e) {
					// TODO: handle exception
					logger.error(e.getLocalizedMessage());
					throw new Exception("같은 이름의 작품이 존재 합니다.");
				}
				return result;
	}

}
