package study.jsp.bookstory.controller.agreement;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import study.jsp.helper.BaseController;


@WebServlet("/agreement/agreement3.do")
public class agreement3 extends BaseController{
	/**
	 *  시리얼 재발급 
	 */
	private static final long serialVersionUID = -2715156977810660808L;
	
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		return "agreement/agreement3";
	}

}
