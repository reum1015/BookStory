package study.jsp.bookstory.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleReport
 */
@WebServlet("/community/article_report.do")
public class ArticleReport extends BaseController {

	private static final long serialVersionUID = 7290700034441742557L;

	WebHelper web;
	SqlSession sqlSession;
	ReportService reportService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		int member_id = web.getInt("member_id");
		String subject = web.getString("subject");
		int article_id = web.getInt("article_id");
		String nick_name = web.getString("nick_name");
		String user_nickname = web.getString("user_nickname");
		
		/** (3) 로그인 여부 검사 */
		// 로그인중인 회원 정보 가져오기
		Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if(loginInfo==null){
			web.redirect(null, "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		// 신고자 id값을 가져온다.
		int id = loginInfo.getId();
		
		// 이미 신고된 게시글인지 검사
		Report report = new Report();
		report.setArticle_id(article_id);
		
		int count = 0;
		
		try{
			count = reportService.selectReportArticle(report);
		
			System.out.println("count ***********************************" + count );
			
			if(count > 0) {
				web.redirect(null, "이미 신고접수된 게시물입니다.");
				return null;
			}
		} catch(Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + article_id);
		logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + member_id);
		
		request.setAttribute("article_id", article_id);			//게시판 번호
		request.setAttribute("member_id", member_id);		//게시자 id
		request.setAttribute("subject", subject);				//글제목
		request.setAttribute("id", id);								//회원 id값
		request.setAttribute("nick_name", nick_name);
		request.setAttribute("user_nickname", user_nickname);
		
		String view = "community/article_report";
		
		return view;
	}
	
}
