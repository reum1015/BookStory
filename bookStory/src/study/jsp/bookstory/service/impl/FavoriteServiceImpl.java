package study.jsp.bookstory.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.service.FavoriteService;




/** 관심등록 서비스 */
public class FavoriteServiceImpl implements FavoriteService{
	
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
	public int selectCountFavoriteBookById(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try{
			
			// 관심등록 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("FavoriteMapper.selectCountFavoriteBookById", favorite);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("관심등록 확인 조회에 실패했습니다. ");
		}
		
		return result;
	}

	@Override
	public int insertAddFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		
		try{
			int result = sqlSession.insert("FavoriteMapper.insertAddFavorite",favorite);
			if(result == 0){
				//등록된 책 정보가 없다면
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlSession.rollback();
			throw new Exception("관심등록  정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("관심등록 추가에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
		
		return 0;
	}

	@Override
	public void deleteRemoveFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlSession.delete("FavoriteMapper.deleteRemoveFavorite",favorite);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("관심등록 해제에 실패 했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

}
