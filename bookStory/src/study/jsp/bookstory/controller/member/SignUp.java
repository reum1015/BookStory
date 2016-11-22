package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/login/sign_up.do")
public class SignUp extends BaseController {

	private static final long serialVersionUID = 7220473215694053811L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String view="login/sign_up";
			
			
			return view;
	}
	
}
