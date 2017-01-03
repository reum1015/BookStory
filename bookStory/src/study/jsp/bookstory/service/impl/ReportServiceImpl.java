package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.BookMark;
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Comment;
import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.RecentEpisode;
import study.jsp.bookstory.model.Rent;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.model.StarMark;
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
	
	//--------------------------------------------------------공지 업로드
	
	@Override
	public void insertNoticeArticle(Article article) throws Exception {
		int result = 0;
		try{
			result = sqlSession.insert("ArticleMapper.insertNoticeArticle", article);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("공지사항 inser를 하기위한 데이터가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("공지사항 insert SQL쿼리문의 오류입니다.");
		} finally {
			sqlSession.commit();
		}
	}
	
	//--------------------------------------------------------공지 업로드 끝 
	
	//------------------------------------------------------------------------ 회원 강제 삭제 서비스 레이어
	
	@Override
	public List<Member> selectMemberList(Member member) throws Exception {
		List<Member> result = null;
		try{
			result = sqlSession.selectList("MemberMapper.selectMemberList", member);
			if(result == null){
				throw new NullPointerException();
			}
		} catch(NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원 리스트를 출력하기 위한 회원이 없습니다.");
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원 리스트를 출력하기 위한 sql문이 실패 하였습니다.");
		}
		
		return result;
	}
	
	//-----------------------------------------------------회원을 강제 삭제하기 위한 사전 작업
	

	@Override
	public int selectAdminCountArticle(Article article) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("ArticleMapper.selectAdminCountArticle", article);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 게시물의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void updateAdminArticle(Article article) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("ArticleMapper.updateAdminArticle", article);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 수정하기위한 게시물이 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 게시물 수정 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountCommment(Comment comment) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("CommentMapper.selectAdminCountComment", comment);
		} catch (NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 덧글의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void updateAdminComment(Comment comment) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("CommentMapper.updateAdminComment", comment);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 수정하기위한 덧글이 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 덧글 수정 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountBuy(Buy buy) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("BuyMapper.selectAdminCountBuy", buy);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 Buy의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminBuy(Buy buy) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("BuyMapper.deleteBuyAll", buy);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 Buy가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 Buy를 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountRent(Rent rent) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("RentMapper.selectRentCount", rent);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 Rent의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminRent(Rent rent) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("RentMapper.deleteRentAll", rent);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 Rent가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 Rent를 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountReport(Report report) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("ReportMapper.selectAdminCountReport", report);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 Report의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminReport(Report report) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("ReportMapper.deleteAdminMemberReport", report);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 Report가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 Report를 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
		
	}

	@Override
	public int selectAdminCountRecentEpisode(RecentEpisode recentEpisode) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("RecentEpisodeMapper.selectAdminCountRecentEpisode", recentEpisode);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 RecentEpisode의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminRecentEpisode(RecentEpisode recentEpisode) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("RecentEpisodeMapper.deleteRecentEpisodeAll", recentEpisode);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 RecentEpisode가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 RecentEpisode를 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountFavorite(Favorite favorite) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("FavoriteMapper.selectFavoriteCount", favorite);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 Favorite의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminFavorite(Favorite favorite) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("FavoriteMapper.deleteFavoriteAll", favorite);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 Favorite가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 Favorite을 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountBookMark(BookMark bookMark) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("BookMarkMapper.selectBookMarkCount", bookMark);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 BookMark의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminBookMark(BookMark bookMark) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("BookMarkMapper.deleteBookMarkAll", bookMark);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 BookMark가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 BookMark을 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}

	@Override
	public int selectAdminCountStarMark(StarMark starMark) throws Exception {
		int result= 0;
		try{
			result=sqlSession.selectOne("StarMarkMapper.selectCountAddStarById", starMark);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("특정 회원의 StarMark의 count조회가 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteAdminStarMark(StarMark starMark) throws Exception {
		int result = 0;
		try{
			result = sqlSession.update("StarMarkMapper.deleteStarMarkAll", starMark);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("특정회원을 삭제하기위한 StarMark가 존재하진 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("특정 회원의 StarMark을 삭제하기 위한 SQL문의 에러입니다."); 
		}
			sqlSession.commit();
	}
	
	//-----------------------------------------------------회원을 강제 삭제하기 위한 사전 작업 끝
	
	@Override
	public void deleteMemberId(Member member) throws Exception {
		int result;
		try{
			result = sqlSession.delete("ReportMapper.deleteMemberId", member);
			if(result == 0){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("삭제하기위한 회원이 존재하지 않습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("삭제하기 위한 회원이 존재하지 않습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	
	//------------------------------------------------------------------------ 회원 강제 삭제 서비스 레이어
}
