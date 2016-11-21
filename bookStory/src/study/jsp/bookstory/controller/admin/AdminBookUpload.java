package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.helper.BaseController;

@WebServlet("/admin/")
public class AdminBookUpload extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6585786554545935433L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "admin/admin_book_upload";
		
		return view;
	}

}
