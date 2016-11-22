package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class InfoChangeSuccess
 */
@WebServlet("/mymenu/info_change_success.do")
public class InfoChangeSuccess extends BaseController {

	private static final long serialVersionUID = 9133064732547319017L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "mymenu/info_change_success";
	}
	

}
