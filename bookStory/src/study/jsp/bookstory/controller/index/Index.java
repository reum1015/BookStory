package study.jsp.bookstory.controller.index;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

@WebServlet("/index.do")
public class Index extends BaseController{
	

	/**
	 *  시리얼 재발급 
	 */
	private static final long serialVersionUID = -2715156977810660808L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "";
		view = "index";
		
		return view;
	}

}
