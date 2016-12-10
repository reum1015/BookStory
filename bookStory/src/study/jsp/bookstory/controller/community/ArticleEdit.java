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
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/community/article_edit.do")
public class ArticleEdit extends BaseController {

	private static final long serialVersionUID = -2227800958721905492L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ArticleService articleService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		articleService = new ArticleserviceImpl(sqlSession, logger);
		
		/** (3) 글번호 파라미터 받기 */
		int article_id = web.getInt("article_id");
		
		
		
		
		
		
		
		
		logger.debug("article_id=" + article_id);
		
		if(article_id == 0){
			web.redirect(null, "글번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Article article = new Article();
		article.setId(article_id);
		
		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		int member_id = 0;
		String user_nickname = null;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		
		if(loginInfo!=null){
			member_id = loginInfo.getId();
			user_nickname = loginInfo.getNick_name();
		}else{
			web.redirect(web.getRootPath() + "/community/article_read.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		logger.debug("memberId=" + member_id);
		logger.debug("userNickname=" + user_nickname);
		
		
		article.setMember_id(member_id);
		
		
		

		/** (4) 게시물 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 게시물이 저장될 객체
		Article readArticle = null;
		
		
		
			int result = 0;
			
			
		try{
			
			result = articleService.selectArticleCountByMemberId(article);
			if(result == 0){
				throw new NullPointerException();
			}
			
			readArticle = articleService.selectArticle(article);
		}catch (NullPointerException ex) {
			// TODO: handle exception
			web.redirect(null,"본인의 글만 수정 가능합니다.");
			return null;
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("readArticle", readArticle);
		
		
		
		
		return "community/article_edit";
	}
	
}
