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
 * Servlet implementation class ArticleRead
 */
@WebServlet("/community/article_read.do")
public class ArticleRead extends BaseController {

	private static final long serialVersionUID = -7043537011325610496L;
	
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
		
		// 세션에서 member_id 가져오기
		Member loginInfo = (Member) web.getSession("loginInfo");
		int mymember_id = loginInfo.getId();
		
		/** (3) 글번호 파라미터 받기 */
		int article_id = web.getInt("article_id");
		logger.debug("articleId="+article_id);
		
		if(article_id==0){
			web.redirect(null, "글번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Article article = new Article();
		article.setId(article_id);
		article.setMember_id(mymember_id);
		
		/** (4) 게시물 일련번호를 사용한 데이터 조회 */
		Article readArticle = null;
		Article prevArticle = null;
		Article nextArticle = null;
		
		/** 조회수 중복 갱신 방지 처리 */
		// 카테고리와 게시물 일련번호를 조합한 문자열을 생성
		// ex) document_notice_15
		String cookieKey = "article_" + article_id;
		// 준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookieKey);
		
		int count = 0;
		
		try{
			// 쿠키 값이 없다면 조회수 갱신
			if(cookieVar==null){
				articleService.updateArticleHit(article);
				// 준비한 문자열에 대한 쿠키를 24시간동안 저장
				web.setCookie(cookieKey, "Y", 60*60*24);
			}
		
			readArticle = articleService.selectArticle(article);
			prevArticle = articleService.selectPrevArticle(article);
			nextArticle = articleService.selectNextArticle(article);
			count = articleService.selectMemberReport(article);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		// 본인 게시글 검사
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + count);

		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("readArticle", readArticle);
		request.setAttribute("prevArticle", prevArticle);
		request.setAttribute("nextArticle", nextArticle);
		request.setAttribute("count", count);
		logger.debug(readArticle.toString());
		
		
		return "/community/article_read";
	}
       
    

}
