package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class PasswordReset
 */
@WebServlet("/login/password_reset.do")
public class PasswordReset extends BaseController {

	private static final long serialVersionUID = -1509042145755683955L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String view="login/password_reset";		
		
		return view;
	}
	
}
