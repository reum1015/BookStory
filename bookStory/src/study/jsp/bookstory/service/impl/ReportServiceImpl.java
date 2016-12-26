package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Comment;
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

	//------------------------------------------------------------------------ 게시판 관리 서비스 레이어 시작
	
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

	// 게시물 강제삭제 서비스 레이어
	
	@Override
	public int selectCommentCount(Comment comment) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.selectOne("ReportMapper.selectCommentCount", comment);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글에 대한 count 조회가 실패 하였습니다.");
		}
		return result;
	}
	
	@Override
	public void deleteAdminComment(Comment comment) throws Exception {
		try{
			int result = sqlSession.delete("ReportMapper.deleteAdminComment", comment);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("해당 덧글이 아닙니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void deleteReportArticle(Report report) throws Exception {
		try{
			int result = sqlSession.delete("ReportMapper.deleteReportArticle", report);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("해당 신고게시물이 아닙니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("신고 게시물 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void deleteAdminArticle(Article article) throws Exception {
		try{
			int result = sqlSession.delete("ReportMapper.deleteAdminArticle", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("해당 자유 게시물이 아닙니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("자유 게시물 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}
	
	@Override
	public int selectReportCountArticle(Report report) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.selectOne("ReportMapper.selectReportCountArticle", report);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("report에 대한 count 조회가 실패 하였습니다.");
		}
		return result;
	}

	@Override
	public void updateArticleReported(Article article) throws Exception {
		try{
			int result = sqlSession.update("ReportMapper.updateArticleReported", article);
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
	// 게시물 강제삭제 서비스 레이어 끝

	//------------------------------------------------------------------------ 게시판 관리 서비스 레이어 끝
	
	//------------------------------------------------------------------------ 덧글 관리 서비스 레이어 시작
	@Override
	public void insertCommentReport(Report report) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.insert("ReportMapper.insertCommentReport", report);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("insert하기위한 덧글이 존재하지 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("덧글을 insert하는데 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
	
	@Override
	public void updateComment(Comment comment) throws Exception {
		
	}

	@Override
	public int selectCommentReportCount(Report report) throws Exception {
		int result;
		
		try{
			result = sqlSession.selectOne("ReportMapper.selectCommentReportCount", report);
			if( result == 0){
				throw new NullPointerException() ;
			}
		} catch (NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("CommentReportCount를 실패하였습니다.");
		}
		return result;
	}

	@Override
	public List<Report> selectCommentReportList(Report report) throws Exception {
		List<Report> result = null;
		
		try{
			result = sqlSession.selectList("ReportMapper.selectCommentReportList", report);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new NullPointerException("CommentReportList를 출력하기 위한 데이터가 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("CommentReportList를 출력하기 실패했습니다.");
		} 
		return result;
	}
	
	@Override
	public void deleteComment(Comment comment) throws Exception {
		int result;
		
		try{
			result = sqlSession.delete("ReportMapper.deleteComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new NullPointerException("Comment의 삭제하기 위한 덧글이 존재하지 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("Comment의 덧글을 삭제하기 위한 sql쿼리문이 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}
	} 

	@Override
	public void deleteReportComment(Report report) throws Exception {
		int result;
		
		try{
			result = sqlSession.delete("ReportMapper.deleteReportComment", report);
			if (result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new NullPointerException("report테이블에 덧글을 삭제하기 위한 데이터가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("report에 덧글만삭제하기 위한 sql쿼리문이 실패하였습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	//------------------------------------------------------------------------ 덧글 관리 서비스 레이어 끝
	
	
}
