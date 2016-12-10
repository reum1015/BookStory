package study.jsp.bookstory.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class ArticleReport
 */
@WebServlet("/community/article_report.do")
public class ArticleReport extends BaseController {

	private static final long serialVersionUID = 7290700034441742557L;

	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		
		int member_id = web.getInt("member_id");
		String subject = web.getString("subject");
		int article_id = web.getInt("article_id");
		
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
		
		
		logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + article_id);
		
		request.setAttribute("article_id", article_id);			//게시판 번호
		request.setAttribute("member_id", member_id);		//게시자 id
		request.setAttribute("subject", subject);				//글제목
		request.setAttribute("id", id);								//회원 id값
		
		String view = "community/article_report";
		
		return view;
	}
	
}
