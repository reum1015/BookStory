package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Report;

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
	
	
}
