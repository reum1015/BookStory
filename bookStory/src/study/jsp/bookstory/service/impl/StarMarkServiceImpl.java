package study.jsp.bookstory.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.StarMark;
import study.jsp.bookstory.service.StarMarkService;

public class StarMarkServiceImpl implements StarMarkService{
	/** 처리 결과를 위한 Log4J객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public StarMarkServiceImpl(SqlSession sqlSession,Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}
	
	/**
	 * 별점 등록
	 */
	@Override
	public void insertAddStar(StarMark star) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlSession.insert("StarMarkMapper.insertAddStar",star);
			if(result == 0){
				//등록된 별점 정보가 없다면
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlSession.rollback();
			throw new Exception("등록된 별점 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("별점 등록에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
	}

}
