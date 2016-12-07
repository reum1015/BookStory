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
		int report_content = web.getInt("select1");
		
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("member_id=" + member_id);
		logger.debug("target_member_id=" + target_member_id);
		logger.debug("select1=" + report_content);
		
		
		// beans로 묶기
		Report report = new Report();
		
		
		
		// Service로 인한 Report 테이블에 저장
		
		
		
		
		
		
		return null;
	}
	
	
	
}
