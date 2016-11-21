package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

/**
 * Servlet implementation class InfoChange
 */
@WebServlet("/myMenu/info_change.do")
public class InfoChange extends BaseController {

	private static final long serialVersionUID = -1982796924127475707L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/info_change";
	}
	
}
