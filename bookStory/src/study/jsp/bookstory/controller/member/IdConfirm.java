package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class IdConfirm
 */
@WebServlet("/login/id_confirm.do")
public class IdConfirm extends BaseController {

	
	private static final long serialVersionUID = 4910746500645978195L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String view="login/id_confirm";
			
			
			return view;
	}

}
