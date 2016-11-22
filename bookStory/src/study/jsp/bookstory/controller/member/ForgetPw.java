package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class ForgetPw
 */
@WebServlet("/login/forget_pw.do")
public class ForgetPw extends BaseController {

	
	private static final long serialVersionUID = -5601241717087387097L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view="login/forget_pw";
		
		
		return view;
}


	}
	
	
