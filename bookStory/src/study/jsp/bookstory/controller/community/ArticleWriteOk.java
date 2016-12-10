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
import study.jsp.bookstory.service.ArticleService;
import study.jsp.bookstory.service.impl.ArticleserviceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;
import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Member;

/**
 * Servlet implementation class ArticleWriteOk
 */
@WebServlet("/community/article_write_ok.do")
public class ArticleWriteOk extends BaseController {

	private static final long serialVersionUID = -5279200659167830177L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	ArticleService articleService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		articleService = new ArticleserviceImpl(sqlSession, logger);
		
		/** (4) 텍스트 형식의 값을 추출 */
		String category = web.getString("category");
		String subject = web.getString("subject");
		String content = web.getString("content");
		String user_nickname = web.getString("user_nickname");
		// 작성자 아이피 주소 가져오기
		String ip_address = web.getClientIP();
		// 회원 일련번호 --> 비 로그인인 경우 0
		int member_id = 0;
		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			member_id = loginInfo.getId();
			user_nickname = loginInfo.getNick_name();
		}
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("category=" + category);
		logger.debug("subject=" + subject);
		logger.debug("content=" + content);
		logger.debug("ipAddress=" + ip_address);
		logger.debug("user_nickname=" + user_nickname);
		logger.debug("memberId=" + member_id);
		
		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
		// 제목 및 내용 검사
		if(!regex.isValue(subject)){
			sqlSession.close();
			web.redirect(null, "글 제목을 입력하세요.");
			return null;
		}
				
		if(!regex.isValue(content)){
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}
		
		/** (6) 입력 받은 파라미터를 Beans로 묶기*/
		Article article = new Article();
		article.setCategory(category);
		article.setSubject(subject);
		article.setContent(content);
		article.setIp_address(ip_address);
		article.setUser_nickname(user_nickname);
		article.setMember_id(member_id);
		logger.debug("article >> " + article.toString());
		
		/** (7) Service를 통한 게시물 저장 */
		try{
			articleService.insertArticle(article);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (8) 저장 완료 후 읽기 페이지로 이동하기 */
		String url = "%s/community/article_read.do?category=%s&article_id=%d";
		url = String.format(url, web.getRootPath(), article.getCategory(), article.getId());
		web.redirect(url, null);
		return null;

	}
	

}
