package study.jsp.bookstory.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class BookList
 */
@WebServlet("/booklist/book_list.do")
public class BookList extends BaseController {

	private static final long serialVersionUID = -4560960172116157884L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		view = "/booklist/book_list";
		
		
		
		
		
		
		
		
		return view;
	}

}
