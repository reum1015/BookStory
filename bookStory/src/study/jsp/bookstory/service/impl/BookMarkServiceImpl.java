package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.BookMark;

import study.jsp.bookstory.service.BookMarkService;

public class BookMarkServiceImpl implements BookMarkService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public BookMarkServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertAddBookMark(BookMark bookmark) throws Exception {
		try {
			int result = sqlSession.insert("BookMarkMapper.insertAddBookMark", bookmark);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 북마크가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}	

	@Override
	public void deleteRemoveBookMark(BookMark bookmark) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BookMark> selectBookMarkList(BookMark bookmark) throws Exception {
		
		List<BookMark> result = null;
		
		try {
			result = sqlSession.selectList("BookMarkMapper.selectBookMarkList", bookmark);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("북마크 처리된 에피소드목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 목록 조회에 실패했습니다.");
		}		
		
		return result;
	}

	@Override
	public int selectBookMarkCount(BookMark bookmark) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("BookMarkMapper.selectBookMarkCount", bookmark);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 수 조회에 실패했습니다. ");
		}
		
		return result;
	}


}
