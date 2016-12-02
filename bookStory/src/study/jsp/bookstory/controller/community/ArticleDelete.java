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
import study.jsp.bookstory.service.ArticleService;
import study.jsp.bookstory.service.impl.ArticleserviceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;
import study.jsp.bookstory.model.Member;

/**
 * Servlet implementation class ArticleDelete
 */
@WebServlet("/community/article_delete.do")
public class ArticleDelete extends BaseController {

	private static final long serialVersionUID = 9034956175853454802L;
	
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
		
		/** (3) 게시글 번호 받기 */
		int article_id = web.getInt("article_id");
		if(article_id==0){
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Article article = new Article();
		article.setId(article_id);
		
		// 로그인 한 경우 현재 회원의 일련번호를 추가한다. (비로그인 시 0으로 설정됨)
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			article.setMember_id(loginInfo.getId());
		}else{
			web.redirect(web.getRootPath() + "/community/article_read.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		
		/** (4) 게시물 일련번호를 사용한 데이터 조회 */
		int articleCount = 0;
		try{
			articleCount = articleService.selectArticleCountByMemberId(article);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (5) 자신의 글에 대한 요청인지에 대한 여부를 view에 전달 */
		boolean myArticle = articleCount > 0;
		request.setAttribute("myArticle", myArticle);
		
		// 상태 유지를 위하여 게시글 일련번호를 View에 전달
		request.setAttribute("article_id", article_id);
		
		return "/community/article_delete";
	}

}
