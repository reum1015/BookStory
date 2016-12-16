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


	@Override
	public double selectStarAvgBook(StarMark star) throws Exception {
		// TODO Auto-generated method stub
				double result = 0;
				
				try{
					result = sqlSession.selectOne("StarMarkMapper.selectStarAvgBook", star);
					
				}catch (Exception e) {
					logger.error(e.getLocalizedMessage());
					throw new Exception("작품 평균 별점 조회에 실패 했습니다.");
				}
				
			
				return result;
	}

	@Override
	public int selectCountAddStarById(StarMark star) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		try{
			result = sqlSession.selectOne("StarMarkMapper.selectCountAddStarById", star);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("별점 등록 확인여부에 실패 했습니다.");
		}
		
		
		return result;
	}

	@Override
	public StarMark selectStarCountAndAvgEpisode(StarMark star) throws Exception {
		// TODO Auto-generated method stub
		StarMark result = null;
		
		try{
			result = sqlSession.selectOne("StarMarkMapper.selectStarCountAndAvgEpisode", star);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("에피소드 별점 평균과 총 회원수 조회 실패.");
		}
	
		return result;
	}
	
	@Override
	public void deleteStarMarkAll(StarMark starmark) throws Exception {
		try{
			// 별점이 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("StarMarkMapper.deleteStarMarkAll", starmark);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("별점 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

}
