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
import study.jsp.helper.PageHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/comment_manage.do")
public class AdminCommentManage extends BaseController{

	private static final long serialVersionUID = -9033692086146336452L;

	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	ReportService reportService; 
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		Member LoginInfo = (Member) web.getSession("loginInfo");
		
		String member_level = null;
		
		if(LoginInfo != null) {
			member_level = LoginInfo.getMember_level();
		}
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정
		

		
		int page = web.getInt("page", 1);
		int totalCount = 0;
		
		Report report = new Report();
		
		List<Report> list = new ArrayList<>();
		
		try{
			totalCount = reportService.selectCommentReportCount();
			
			logger.debug("totalCount --------------> " + totalCount);
			
			// 나머지 페이지 번호 계산하기
			// --> 현제 페이지, 전체 게시물 수, 한페이지의 목록수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 5, 5);
						
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			report.setLimitStart(pageHelper.getLimit_start());
			report.setListCount(pageHelper.getList_count());
			
			list = reportService.selectCommentReportList(report);
			
			
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
		request.setAttribute("pageHelper", pageHelper);

		
		String view = "admin/admin_comment_manage";
		
		return view;
	}

}
