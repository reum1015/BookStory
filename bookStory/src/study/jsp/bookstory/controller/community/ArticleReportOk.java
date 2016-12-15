package study.jsp.bookstory.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleReportOk
 */
@WebServlet("/community/article_report_ok.do")
public class ArticleReportOk extends BaseController {

	private static final long serialVersionUID = -1726846206102138530L;

	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	ReportService reportService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		// 파라미터 name값 가져오기
		int member_id = web.getInt("id");									//신고자 id
		int target_member_id = web.getInt("member_id");				//게시자 id
		String report_subject = web.getString("subject");				//게시글 제목
		String report_content = web.getString("report_content");		//신고 내용
		int article_id = web.getInt("article_id");					 			//게시글 번호
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("id=" + member_id);
		logger.debug("mamber_id=" + target_member_id);
		logger.debug("subject=" + report_subject);
		logger.debug("report_content=" + report_content);
		logger.debug("article_id=" + article_id);
		
		// beans로 묶기
		Report report = new Report();
		report.setMember_id(member_id);
		report.setTarget_member_id(target_member_id);
		report.setReport_subject(report_subject);
		report.setReport_content(report_content);
		report.setArticle_id(article_id);
		
		Article article = new Article();
		article.setMember_id(target_member_id);
		article.setId(article_id);
		
		// Service를 통한 신고테이블의 reported의 데이터를 바꿔준다.
		try{
			reportService.updateReport(article);
			reportService.insertReportArticle(report);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		// 값의 변경된 reported 데이터 확인
		logger.debug("reported=" + article.getReported());
		
		/** (8) 저장 완료 후 읽기 페이지로 이동하기 */
		String url = "%s/community/article_list.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, "신고 접수가 완료 되었습니다.");
		
		return null;
		
	}
	
}
