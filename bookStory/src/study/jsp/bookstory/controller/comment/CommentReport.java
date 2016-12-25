package study.jsp.bookstory.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class CommentReport
 */
@WebServlet("/comment_report.do")
public class CommentReport extends BaseController {

	private static final long serialVersionUID = -3954573292307009832L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ReportService reportService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		
		
		return "comment/comment_report";
	}

}
