package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login/login.do")
public class Login extends BaseController {

	
	private static final long serialVersionUID = -6758090135462286154L;

	
	
	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web =  WebHelper.getInstance(request, response);
		
		int book_id = web.getInt("book_id");
			
			
		request.setAttribute("book_id", book_id);
			return "login/login";
	}
	
}
