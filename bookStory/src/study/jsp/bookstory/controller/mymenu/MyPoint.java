package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class MyPoint
 */
@WebServlet("/mymenu/my_point.do")
public class MyPoint extends BaseController {

	private static final long serialVersionUID = 999332364233759918L;
	
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request,response);
		
		Member member = (Member)web.getSession("loginInfo");
		
		int point = 0;
		
		if(member != null){
			point = member.getPoint();
		}
		
		request.setAttribute("point",point);
		
		
		return "mymenu/my_point";
	}
	
}
