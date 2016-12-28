package study.jsp.bookstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

public class Main extends BaseController{
	private static final long serialVersionUID = 3971889981166604106L;

	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request, response);
		
		web.redirect(web.getRootPath() + "/index.do",null);
		return null;
	}

}
