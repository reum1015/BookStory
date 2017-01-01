package study.jsp.bookstory.service;

import java.util.List;

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

public interface ReportService {
	
	/**
	 * 신고된 게시글 report테이블에 등록
	 * @param insert_report
	 * @throws Exception
	 */
	public void insertReportArticle(Report insert_report) throws Exception;

	/**
	 * 신고된 게시글의 reported 데이터 변경
	 * @param report_update
	 * @throws Exception
	 */
	public void updateReport(Article update_reported) throws Exception;
	
	/**
	 * 이미 신고가 된 게시글인지 판별
	 * @param report
	 * @throws Exception
	 */
	public int selectReportArticle(Report report) throws Exception;
	
	/**
	 * 신고된 전체 게시물 COUNT 조회
	 * @param report
	 * @throws Exception
	 */
	public int selectReportCount(Report report) throws Exception;
	
	/**
	 * 신고된 게시글 데이터를 출력한다.
	 * @param report_select
	 * @throws Exception
	 */
	public List<Report> selectReport(Report select_report) throws Exception;
	
	/**
	 * 회원과 신고된 게시물의 참조관계를 해제한다.
	 * @param report - 신고된 게시물 데이터
	 * @throws Exception
	 */
	public void updateReportMemberOut(Report report) throws Exception;
	
	// 게시물을 강제 삭제하기 또는 report게시물만 삭제하기 위한 서비스 구축
	
	public int selectCommentCount(Comment comment) throws Exception;
	public void deleteAdminComment(Comment comment) throws Exception;
	public void deleteReportArticle(Report report) throws Exception;
	public void deleteAdminArticle(Article article) throws Exception;
	public int selectReportCountArticle(Report report) throws Exception;
	public void updateArticleReported(Article article) throws Exception;
	
	// 게시물을 강제 삭제하기 또는 report게시물만 삭제하기 위한 서비스 구축 끝
	
	//----------------------------------------------------회원 강제 탈퇴 시키기위한 서비스 레이어
	// 회원가입된 회원들의 리스트를 출력한다.
	public List<Member> selectMemberList(Member member) throws Exception;
	
	// 회원을 강제 삭제 시키기전 특정회원을 다른 테이블에 대한 관계를 전부 끊어주기.
	public int selectAdminCountArticle(Article article) throws Exception;
	public void updateAdminArticle(Article Article) throws Exception;
	public int selectAdminCountCommment(Comment comment) throws Exception;
	public void updateAdminComment(Comment comment) throws Exception;
	public int selectAdminCountBuy(Buy buy)throws Exception;
	public void deleteAdminBuy(Buy buy) throws Exception;
	public int selectAdminCountRent(Rent rent) throws Exception;
	public void deleteAdminRent(Rent rent) throws Exception;
	public int selectAdminCountReport(Report report) throws Exception;
	public void deleteAdminReport(Report report) throws Exception;
	public int selectAdminCountRecentEpisode(RecentEpisode recentEpisode) throws Exception;
	public void deleteAdminRecentEpisode(RecentEpisode recentEpisode) throws Exception;
	public int selectAdminCountFavorite(Favorite favorite) throws Exception;
	public void deleteAdminFavorite(Favorite favorite) throws Exception;
	public int selectAdminCountBookMark(BookMark bookMark) throws Exception;
	public void deleteAdminBookMark(BookMark bookMark) throws Exception;
	public int selectAdminCountStarMark(StarMark starMark) throws Exception;
	public void deleteAdminStarMark(StarMark starMark) throws Exception;
	// 회원을 강제 삭제 시키기전 특정회원을 다른 테이블에 대한 관계를 전부 끊어주기 끝.
	// 회원을 강제 삭제한다.
	public void deleteMemberId(Member member) throws Exception;
	//----------------------------------------------------회원 강제 탈퇴 시키기위한 서비스 레이어 끝
	
	
	
	//----------------------------------------------------공지사항 업로드
	public void insertNoticeArticle(Article article) throws Exception;
	//----------------------------------------------------공지사항 업로드 끝
	
	
	
	//----------------------------------------------------덧글 서비스 레이어 시작
	// 덧글을 report테이블에 저장하기
	public void insertCommentReport(Report report) throws Exception;
	// 덧글이 저장되면서 덧글을 reported 데이터가 변경
	public void updateComment(Comment comment) throws Exception;
	// 신고덧글의 총 개수값 구하기 (페이징 처리하기위한 값)
	public int selectCommentReportCount(Report report) throws Exception;
	// 신고덧글을 List로 출력하기
	public List<Report> selectCommentReportList(Report report) throws Exception;
	// 신고덧글을 삭제하기
	public void deleteComment(Comment comment)throws Exception;
	// 신고 덧글을 reoprt에서만 삭제하기
	public void deleteReportComment(Report report) throws Exception;
	//----------------------------------------------------덧글 서비스 레이어 끝
}
