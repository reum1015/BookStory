package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class ForgetId
 */
@WebServlet("/login/forget_id.do")
public class ForgetId extends BaseController {

	
	private static final long serialVersionUID = 5062050186302500920L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String view="login/forget_id";
		
		
		return view;
	}
	
}
