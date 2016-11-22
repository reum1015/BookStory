package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class BookmarkList
 */
@WebServlet("/myMenu/bookmark_list.do")
public class BookmarkList extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5596613023239957023L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/bookmark_list";
	}
	

}
