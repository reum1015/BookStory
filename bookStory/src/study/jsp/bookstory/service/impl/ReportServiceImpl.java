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
		List<Report> result = null;

		try {
			result = sqlSession.selectList("ReportMapper.selectReportArticleList", select_report);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 신고게시글 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("신고게시글 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectReportArticle(Report report) throws Exception {
		int result = 0;
		
		try{
			// 자신의 게시물이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReportMapper.selectReportArticle", report);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("신고된 게시물에 대한 조회가 실패 하였습니다.");
		}
		return result;
	}

	@Override
	public int selectReportCount(Report report) throws Exception {
		int result = 0;
		
		try{
			// 자신의 게시물이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReportMapper.selectReportCount", report);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("신고된 게시물에 대한 count 조회가 실패 하였습니다.");
		}
		return result;
	}

	@Override
	public void updateReportMemberOut(Report report) throws Exception {
		// TODO Auto-generated method stub
		try{
			// 대여내역이 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.update("ReportMapper.updateReportMemberOut", report);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("신고내역 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	
}
