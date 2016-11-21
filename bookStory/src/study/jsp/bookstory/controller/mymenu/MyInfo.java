package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

/**
 * Servlet implementation class MyInfo
 */
@WebServlet("/myMenu/my_info.do")
public class MyInfo extends BaseController {

	private static final long serialVersionUID = -8967475611264973313L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/my_info";
	}
	
}
