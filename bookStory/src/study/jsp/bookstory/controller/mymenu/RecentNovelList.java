package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class RecentNovelList
 */
@WebServlet("/myMenu/recent_novel_list.do")
public class RecentNovelList extends BaseController {

	private static final long serialVersionUID = 6192089085748485155L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/recent_novel_list";
	}
	
}
