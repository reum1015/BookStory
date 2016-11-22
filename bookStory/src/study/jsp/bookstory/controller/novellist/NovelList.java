package study.jsp.bookstory.controller.novellist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

@WebServlet("/novellist/novel_list.do")
public class NovelList extends BaseController{

	private static final long serialVersionUID = -139261038411073866L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "novellist/novel_list";
	
		
		return view;
	}

}
