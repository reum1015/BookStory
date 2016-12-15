package study.jsp.bookstory.controller.mainAjax;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import study.jsp.helper.BaseController;

@WebServlet("/main/genreList.do")
public class MainGenreRecommand extends BaseController{

	private static final long serialVersionUID = -4787805624782434151L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");

		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
