package study.jsp.bookstory.controller.novellist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/novellist/novel_list.do")
public class NovelList extends BaseController{

	private static final long serialVersionUID = -139261038411073866L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request, response);
		
		String member_level = "AA";
		
		if(web.getSession("loginInfo") != null){
			Member LoginInfo = (Member) web.getSession("loginInfo");
			member_level = LoginInfo.getMember_level();
		}
		
		request.setAttribute("member_level", member_level);
		
		String view = "novellist/novel_list";
	
		
		return view;
	}

}
