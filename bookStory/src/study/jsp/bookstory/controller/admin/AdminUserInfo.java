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

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		//session에서 id값 가져오기
				Member loginInfo = null;
				String member_level=null;
				int member_id = 0;
				
				loginInfo = (Member) web.getSession("loginInfo");
				
				if(loginInfo == null){
					web.redirect(null,"접근이 제한된 페이지 입니다.");
					return null;
				} 
				if(loginInfo != null){	
					loginInfo = (Member)web.getSession("loginInfo");
					member_id = loginInfo.getId();
					member_level = loginInfo.getMember_level();
					if(member_id == 0 || member_level.equals("AA")){
						web.redirect(null, "접근이 제한된 페이지 입니다.");
						return null;
					}
				}
		
		List<Member> memberlist = new ArrayList<Member>();
		
		try{
			memberlist = reportService.selectMemberList(null);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		// 회원가입된 리스트 출력
		request.setAttribute("member_level", member_level);
		request.setAttribute("memberlist", memberlist);
		
		String view = "admin/admin_userInfo";
		
		return view;
	}

}
