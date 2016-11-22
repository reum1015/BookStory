package study.jsp.bookstory.controller.todaynovel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

@WebServlet("/todaynovel/today_novel.do")
public class TodayNovel extends BaseController{

	private static final long serialVersionUID = -6892988006698404928L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view="todaynovel/today_novel";
		
		return view;
	}

}
