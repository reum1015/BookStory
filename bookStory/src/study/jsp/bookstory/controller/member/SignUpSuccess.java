package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class SignUpSuccess
 */
@WebServlet("/login/sign_up_success.do")
public class SignUpSuccess extends BaseController {

	
	private static final long serialVersionUID = 5602480707235926069L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String view="login/sign_up_success";
			
			
			return view;
	}
	
}
