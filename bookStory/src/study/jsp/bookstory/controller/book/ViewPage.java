package study.jsp.bookstory.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

@WebServlet("/novelview/view_page.do")
public class ViewPage extends BaseController{

	private static final long serialVersionUID = 113920651746454564L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = "/novelview/view_page";
		
		return view;
	}

}
