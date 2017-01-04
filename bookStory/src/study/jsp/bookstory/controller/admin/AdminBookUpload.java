package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/novel_upload.do")
public class AdminBookUpload extends BaseController{

	private static final long serialVersionUID = 6585786554545935433L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request, response);
		
		// 관리자에게만 admin버튼 활성화
		String member_levelV = "AA";
				
		if(web.getSession("loginInfo") != null){
			Member LoginInfo = (Member) web.getSession("loginInfo");
			member_levelV = LoginInfo.getMember_level();
		}
		
		//session에서 id값 가져오기
		Member loginInfo = null;
		String member_level=null;
		int member_id = 0;
				
				loginInfo = (Member) web.getSession("loginInfo");
				
				if(loginInfo == null){
					web.redirect(null,"접근이 제한된 페이지 입니다.");
					return null;
				} 
				if(loginInfo != null){	
					loginInfo = (Member)web.getSession("loginInfo");
					member_id = loginInfo.getId();
					member_level = loginInfo.getMember_level();
					if(member_id == 0 || member_level.equals("AA")){
						web.redirect(null, "접근이 제한된 페이지 입니다.");
						return null;
					}
				}
		
		request.setAttribute("member_level", member_levelV);
		
		String view = "admin/admin_book_upload";
		
		return view;
	}

}
