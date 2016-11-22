package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;

@WebServlet("/admin/new_episode_upload.do")
public class AdminEpisodeUpload extends BaseController{

	private static final long serialVersionUID = 1875259572629194595L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view="";
		view="admin/admin_episode_upload";
		
		
		return view;
	}

}
