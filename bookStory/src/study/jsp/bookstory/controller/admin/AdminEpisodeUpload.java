package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.bookstory.model.Member;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/episode_upload.do")
public class AdminEpisodeUpload extends BaseController{

	private static final long serialVersionUID = 1875259572629194595L;

	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		web = WebHelper.getInstance(request, response);
		String view="";
		view="admin/admin_episode_upload";
		
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
		
		
		return view;
	}

}
