package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

@WebServlet("/admin/article_manage.do")
public class AdminArticleManage extends BaseController{

	private static final long serialVersionUID = -3896402210992402739L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "admin/admin_article_manage";
		

				
				
				
	
				
		return view;
	}

}
