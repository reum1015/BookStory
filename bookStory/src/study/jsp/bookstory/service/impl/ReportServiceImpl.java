package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.ReportService;

public class ReportServiceImpl implements ReportService{

	/** 실행 결과를 알기위한 Log4J 객체 생성 */
	Logger logger;
	
	/** MyBatis 객체 생성 */
	SqlSession sqlSession;
	
	/** 생성자로 통한 객체 생성 */
	public ReportServiceImpl(SqlSession sqlSession, Logger logger) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertReportArticle(Report insert_report) throws Exception {
		try{
			int result = sqlSession.insert("ReportMapper.insertArticleReport", insert_report);
			if ( result == 0 ) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("신고하기 위한 게시글 정보가 없습니다.");
		} catch (Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("신고게시글 저장에 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void updateReport(Article update_reported) throws Exception {
		try{
			int result = sqlSession.update("ReportMapper.updateReportedDate", update_reported);
			if ( result == 0 ) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("reported를 수정하기위한 게시글 정보가 없습니다.");
		} catch (Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("reported수정을 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public List<Report> selectReport(Report select_report) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
