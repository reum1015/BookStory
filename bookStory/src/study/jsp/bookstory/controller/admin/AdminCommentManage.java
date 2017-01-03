package study.jsp.bookstory.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/comment_manage.do")
public class AdminCommentManage extends BaseController{

	private static final long serialVersionUID = -9033692086146336452L;

	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	ReportService reportService; 
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		Member LoginInfo = (Member) web.getSession("loginInfo");
		
		String member_level = null;
		
		if(LoginInfo != null) {
			member_level = LoginInfo.getMember_level();
		}
		
		
		List<Report> list = new ArrayList<>();
		
		try{
			list = reportService.selectCommentReportList(null);
		}catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		logger.debug("commentLists --- >" + list.toString());
		
		
		request.setAttribute("member_level", member_level);
		request.setAttribute("commentLists", list);
		
		
		String view = "admin/admin_comment_manage";
		
		return view;
	}

}
