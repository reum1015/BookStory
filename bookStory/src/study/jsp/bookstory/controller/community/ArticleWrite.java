package study.jsp.bookstory.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class ArticleWriter
 */
@WebServlet("/community/article_write.do")
public class ArticleWrite extends BaseController {

	private static final long serialVersionUID = 6432088999141497765L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		view = "/community/article_write";
		
		return view;
	}
	
	
	
}
