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
import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleNoticeUploadOk
 */
@WebServlet("/admin/article_notice_upload_ok.do")
public class ArticleNoticeUploadOk extends BaseController {

	private static final long serialVersionUID = -7896478017795169300L;

	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	ReportService reportService;
	RegexHelper regex;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		regex = RegexHelper.getInstance();
		

		String admin_subject = web.getString("admin_subject");
		String admin_content = web.getString("admin_content");
		String ip_address = web.getClientIP();
		String user_nickname = null;
		int member_id = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo != null){
			member_id = loginInfo.getId();
			user_nickname = loginInfo.getNick_name();
		}
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("admin_subject=" + admin_subject);
		logger.debug("admin_content=" + admin_content);
		logger.debug("user_nickname=" + user_nickname);
		logger.debug("memberId=" + member_id);
		
		Article article = new Article();
		article.setMember_id(member_id);
		article.setSubject(admin_subject);
		article.setContent(admin_content);
		article.setUser_nickname(user_nickname);
		article.setIp_address(ip_address);
		logger.debug("admin_article >> " + article.toString());
		
		try{
			reportService.insertNoticeArticle(article);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		String url = "%s/community/article_read.do?category=%s&article_id=%d";
		url = String.format(url, web.getRootPath(), article.getCategory(), article.getId());
		web.redirect(url, null);
		
		return null;
	}
	
	

}
