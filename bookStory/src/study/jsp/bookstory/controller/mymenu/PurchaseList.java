package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

/**
 * Servlet implementation class PurchaseList
 */
@WebServlet("/myMenu/purchase_list.do")
public class PurchaseList extends BaseController {

	private static final long serialVersionUID = -7585088852121539087L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/purchase_list";
	}
	
}
