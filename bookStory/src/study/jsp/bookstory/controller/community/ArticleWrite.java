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
 * Servlet implementation class ArticleWriter
 */
@WebServlet("/community/article_write.do")
public class ArticleWrite extends BaseController {

	private static final long serialVersionUID = 6432088999141497765L;
	WebHelper web;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		
		/** (3) 로그인 여부 검사 */
		// 로그인중인 회원 정보 가져오기
		Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if(loginInfo==null){
			web.redirect(web.getRootPath() + "/community/article_list.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		
		return "/community/article_write";
	}
	
	
	
}
