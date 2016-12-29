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
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/admin_userInfo.do")
public class AdminUserInfo extends BaseController{

	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	ReportService reportService;
	
	private static final long serialVersionUID = -8435966275594212677L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURL());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		List<Member> memberlist = new ArrayList<Member>();
		
		try{
			memberlist = reportService.selectMemberList(null);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		request.setAttribute("memberlist", memberlist);
		
		String view = "admin/admin_userInfo";
		
		return view;
	}

}
