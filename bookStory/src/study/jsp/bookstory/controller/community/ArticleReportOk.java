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
		int member_id = web.getInt("member_id1");
		int target_member_id = web.getInt("member_id2");
		String report_content = web.getString("select1");
		int article_id = web.getInt("member_id");
		String reported = "Y";
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("member_id=" + member_id);
		logger.debug("target_member_id=" + target_member_id);
		logger.debug("select1=" + report_content);
		logger.debug("reported=" + reported);
		
		
		// beans로 묶기
		Report report = new Report();
		report.setMember_id(target_member_id);
		report.setTarget_member_id(target_member_id);
		report.setReport_content(report_content);
		
		Article article = new Article();
		article.setReported(reported);
		
		// Service를 통한 신고테이블의 reported의 데이터를 바꿔준다.
		try{
			reportService.updateReport(article);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		// Service를 통한 신고 데이터 저장
		try{
			reportService.insertReportArticle(report);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (8) 저장 완료 후 읽기 페이지로 이동하기 */
		String url = "%s/community/article_read.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, "신고 접수가 완료 되었습니다.");
		
		return null;
		
	}
	
}
