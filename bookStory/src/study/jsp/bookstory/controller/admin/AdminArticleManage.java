package study.jsp.bookstory.controller.admin;

import java.io.IOException;
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

@WebServlet("/admin/article_manage.do")
public class AdminArticleManage extends BaseController{

	private static final long serialVersionUID = -3896402210992402739L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ReportService reportService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		reportService = new ReportServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		//session에서 id값 가져오기
		Member member = (Member)web.getSession("loginInfo");
			
		String member_level=null;
		int member_id = 0;
		
		if(member != null){
			 member_id = member.getId();
			 member_level = member.getMember_level();
				 if(member_id == 0 && member_level.equals("AA")){
						web.redirect(null, "접근이 제한된 페이지 입니다.");
					}
				 
		}else if(member == null){
			web.redirect(null, "접근이 제한된 페이지 입니다.");
		}
		
		
		Report report = new Report();
		
		int page = web.getInt("page", 1);
		
		int totalCount = 0;
		List<Report> reportList = null;
		
		try{
			
			totalCount = reportService.selectReportCount(report);
			
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			report.setLimitStart(pageHelper.getLimit_start());
			report.setListCount(pageHelper.getList_count());
			
			reportList = reportService.selectReport(report);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("member_level", member_level);
		request.setAttribute("reportList", reportList);
		request.setAttribute("pageHelper", pageHelper);
		
		String view = "admin/admin_article_manage";
		
		return view;
	}

}
