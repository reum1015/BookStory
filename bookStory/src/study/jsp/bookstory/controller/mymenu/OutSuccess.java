package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

/**
 * Servlet implementation class OutSuccess
 */
@WebServlet("/myMenu/out_success.do")
public class OutSuccess extends BaseController {

	private static final long serialVersionUID = -1821869838946189084L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/out_success";
	}

}
