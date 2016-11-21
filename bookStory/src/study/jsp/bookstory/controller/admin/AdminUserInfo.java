package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

@WebServlet("/admin/admin_userInfo.do")
public class AdminUserInfo extends BaseController{


	/**
	 * 
	 */
	private static final long serialVersionUID = -8435966275594212677L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "admin/admin_userInfo";
		
		return view;
	}

}
