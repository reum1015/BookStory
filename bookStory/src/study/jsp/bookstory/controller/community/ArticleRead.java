package study.jsp.bookstory.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

/**
 * Servlet implementation class ArticleRead
 */
@WebServlet("/community/article_read.do")
public class ArticleRead extends BaseController {

	private static final long serialVersionUID = -7043537011325610496L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		view = "/community/article_read";
		
		return view;
	}
       
    

}
