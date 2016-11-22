package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

/**
 * Servlet implementation class FavorNovelList
 */
@WebServlet("/myMenu/favor_novel_list.do")
public class FavorNovelList extends BaseController {

	private static final long serialVersionUID = 4396098289263241945L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "myMenu/favor_novel_list";
	}
	

}
