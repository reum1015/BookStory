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
import study.jsp.bookstory.model.Comment;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.ArticleService;
import study.jsp.bookstory.service.CommentService;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ArticleserviceImpl;
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleDeleteOk
 */
@WebServlet("/community/article_delete_ok.do")
public class ArticleDeleteOk extends BaseController {

	private static final long serialVersionUID = -5376399125122400687L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ArticleService articleService;
	CommentService commentService;
	ReportService reportService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		articleService = new ArticleserviceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		/** (3) 게시글 번호 받기 */
		int article_id = web.getInt("article_id");
		String member_level = web.getString("member_level");
		int report_delete = web.getInt("report_delete");
		int member_idd = web.getInt("member_id");
		
		logger.debug("article_id=" + article_id);
		
		if(article_id==0){
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		/** (4) 파라미터를 Beans로 묶기 */
		Article article = new Article();
		article.setId(article_id);
		article.setMember_id(member_idd);
		
		// 게시물에 속한 덧글 삭제를 위해서 생성
		Comment comment = new Comment();
		comment.setArticle_id(article_id);
		
		// 게시물을 강제 삭제하기위한 사전 report게시물 삭제
		Report report = new Report();
		report.setArticle_id(article_id);
		
		/** (5) 데이터 삭제 처리 */
		// 로그인 한 경우만 삭제 활성화 비로그인 인 경우 로그인 메시지 출력
		if(member_level.equals("AA")) {
			Member loginInfo = (Member) web.getSession("loginInfo");
			if(loginInfo!=null){
				article.setMember_id(loginInfo.getId());
			}else{
				web.redirect(web.getRootPath() + "/community/article_read.do", "로그인 후에 이용 가능합니다.");
				return null;
			}
		}
		
		
		int Count1 = 0;
		int Count2 = 0;
		
		if(member_level.equals("BB")){
			try{
				if(report_delete == 1) {
					reportService.deleteReportArticle(report);
					reportService.updateArticleReported(article);
				} else {
					Count1 = reportService.selectCommentCount(comment);
						if(Count1 > 0) {
							reportService.deleteAdminComment(comment);
						}
					Count2 = reportService.selectReportCountArticle(report);
						if(Count2 > 0) {						
							reportService.deleteReportArticle(report);
						}
				reportService.deleteAdminArticle(article);
				}
			}catch(Exception e){
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally{
				sqlSession.close();
			}
		} else {
			try{
				articleService.selectArticleCountByMemberId(article);
				commentService.deleteCommentAll(comment);
				articleService.deleteArticle(article);
			}catch(Exception e){
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally{
				sqlSession.close();
			}
		}
		
		/** (8) 삭제완료후 리스트 페이지로 이동하기 */
		String url2 = "%s/admin/article_manage.do";
		url2 = String.format(url2, web.getRootPath());
		String url1 = "%s/community/article_list.do?category=%s&article_id=%d";
		url1 = String.format(url1, web.getRootPath(), article.getCategory(), article.getId());
		
		if(member_level.equals("BB")){
			web.redirect(url2, "삭제되었습니다.");	
		} else {
			web.redirect(url1, "삭제되었습니다.");			
		}
		
		return null;
	}
	
}
