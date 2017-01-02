package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/admin_main.do")
public class AdminMain extends BaseController{

	private static final long serialVersionUID = -7293770189858539721L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		web = WebHelper.getInstance(request, response);
		
		Member LoginInfo = (Member) web.getSession("loginInfo");
		
		String member_level = null;
		
		if(LoginInfo != null) {
			member_level = LoginInfo.getMember_level();
		}
		
		request.setAttribute("member_level", member_level);
		
		String view = "admin/admin_main";
		
		return view;
	}

}
