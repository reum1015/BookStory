package study.jsp.bookstory.controller.episodecomment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import study.jsp.helper.BaseController;


@WebServlet("/episodecomment/episode_comment_report_ok.do")
public class EpisodeCommentReportedOk extends BaseController{
	private static final long serialVersionUID = 3111873065525615406L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		String st = "성공";
		
		System.out.println("*****************************************");
		
		
		
		
		
		
		
		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("st", st);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		return null;
		
		
		
	}

}
