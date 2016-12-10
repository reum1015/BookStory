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
import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.ArticleService;
import study.jsp.bookstory.service.impl.ArticleserviceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleEditOk
 */
@WebServlet("/community/article_edit_ok.do")
public class ArticleEditOk extends BaseController {

	private static final long serialVersionUID = -4558525401619325042L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	ArticleService articleService;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		articleService = new ArticleserviceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		/** (3) 텍스트 형식의 값을 추출 */
		
		int article_id = web.getInt("article_id");
		
		if(article_id==0){
			web.redirect(null, "글번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		String category = web.getString("category");
		String user_nickname = web.getString("user_nickname");
		String subject = web.getString("subject");
		String content = web.getString("content");
		// 작성자 아이피 주소 가져오기
		String ip_address = web.getClientIP();
		// 회원 일련번호 --> 비 로그인인 경우 0
		int member_id = 0;
		
		/** (7) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. */
		// 소유권 검사 정보
		boolean myArticle = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo != null){
			try{
				Article temp = new Article();
				temp.setCategory(category);
				temp.setId(article_id);
				temp.setMember_id(loginInfo.getId());
				temp.setUser_nickname(loginInfo.getNick_name());
				
				if(articleService.selectArticleCountByMemberId(temp)>0){
					// 소유권을 의미하는 변수 변경
					myArticle = true;
					// 입력되지 않은 정보들 갱신
					user_nickname = loginInfo.getNick_name();
					member_id = loginInfo.getId();
				}
			}catch(Exception e){
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("article_id=" + article_id);
		logger.debug("category=" + category);
		logger.debug("user_nickname=" + user_nickname);
		logger.debug("subject=" + subject);
		logger.debug("content=" + content);
		logger.debug("ipAddress=" + ip_address);
		logger.debug("memberId=" + member_id);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
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
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기*/
		Article article = new Article();
		article.setId(article_id);
		article.setCategory(category);
		article.setSubject(subject);
		article.setContent(content);
		article.setIp_address(ip_address);
		article.setUser_nickname(user_nickname);
		article.setMember_id(member_id);
		logger.debug("article >> " + article.toString());
		
		/** (6) Service를 통한 게시물 저장 */
		try{
			if(!myArticle){
				articleService.selectArticleCountByPw(article);
			}
			articleService.updateArticle(article);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (7) 저장 완료 후 읽기 페이지로 이동하기 */
		String url = "%s/community/article_read.do?category=%s&article_id=%d";
		url = String.format(url, web.getRootPath(), article.getCategory(), article.getId());
		web.redirect(url, null);
		return null;
	}
}
	


