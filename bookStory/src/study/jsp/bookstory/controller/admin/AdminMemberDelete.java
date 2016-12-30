package study.jsp.bookstory.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class AdminMemberDelete
 */
@WebServlet("/admin/admin_member_delete.do")
public class AdminMemberDelete extends BaseController {
	
	private static final long serialVersionUID = -6537087396915085919L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		
		int memberId = web.getInt("Id");
		String nick_name = web.getString("nick_name");
		
		Member member = new Member();
		member.setId(memberId);
		member.setNick_name(nick_name);
		
		request.setAttribute("memberId", memberId);
		request.setAttribute("nick_name", nick_name);
		
		return "member/member_delete";
	}
	

}
