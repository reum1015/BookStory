package study.jsp.bookstory.controller.community;

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
import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.ArticleService;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ArticleserviceImpl;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleList
 */
@WebServlet("/community/article_list.do")
public class ArticleList extends BaseController {
	
	private static final long serialVersionUID = 3160510739006671067L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ArticleService articleService;
	ReportService reportService;
	PageHelper pageHelper;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		articleService = new ArticleserviceImpl(sqlSession, logger);
		reportService = new ReportServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		/** (3) 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		
		Article article = new Article();
		
		String member_level = "AA";
		
		if(web.getSession("loginInfo") != null){
			Member LoginInfo = (Member) web.getSession("loginInfo");
			member_level = LoginInfo.getMember_level();
		}
		
		
		
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정
		int page = web.getInt("page", 1);
		
		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값 설정
		article.setSubject(keyword);
		article.setContent(keyword);
		
		/** (4) 게시글 목록 조회 */
		int totalCount = 0;
		List<Article> articleList = null;
		List<Article> adminArticleList = null;
		
		try{
			// 전체 게시물 수
			totalCount = articleService.selectArticleCount(article);
			
			// 나머지 페이지 번호 계산하기
			// --> 현제 페이지, 전체 게시물 수, 한페이지의 목록수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			article.setLimit_start(pageHelper.getLimit_start());
			article.setList_count(pageHelper.getList_count());
			
			articleList = articleService.selectArticleList(article);
			adminArticleList = reportService.selectAdminArticleList(article);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		
		/** (5) 조회 결과를 View에 전달 */
		request.setAttribute("member_level", member_level);
		request.setAttribute("articleList", articleList);
		request.setAttribute("adminArticleList", adminArticleList);
		request.setAttribute("keywrod", keyword);
		request.setAttribute("pageHelper", pageHelper);
		
		
		return "community/article_list";
	}
	

}
