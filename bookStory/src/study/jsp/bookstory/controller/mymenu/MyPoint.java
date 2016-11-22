package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class MyPoint
 */
@WebServlet("/mymenu/my_point.do")
public class MyPoint extends BaseController {

	private static final long serialVersionUID = 999332364233759918L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "mymenu/my_point";
	}
	
}
