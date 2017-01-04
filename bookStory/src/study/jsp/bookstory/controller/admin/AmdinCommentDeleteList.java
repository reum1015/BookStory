package study.jsp.bookstory.controller.admin;

import java.io.IOException;

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
import study.jsp.helper.PageHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/comment_deleteList.do")
public class AmdinCommentDeleteList extends BaseController{
	private static final long serialVersionUID = 4933693198607639254L;

	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ReportService reportService;
	PageHelper pageHelper;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		web = WebHelper.getInstance(request, response);
		
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
		
		
		
		
		int comment_id = web.getInt("comment_id");
		
		if(comment_id == 0){
			sqlSession.close();
			web.redirect(null, "댓글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		request.setAttribute("comment_id", comment_id);
		
		
		
		return "comment/comment_delete_reportList";
	}

}
