package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class SignUpAgree
 */
@WebServlet("/login/sign_up_agree.do")
public class SignUpAgree extends BaseController {
	
	private static final long serialVersionUID = 5441629001845754982L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String view="login/sign_up_agree";
		
		
		return view;
	}
	

}
