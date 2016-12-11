package study.jsp.bookstory.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/novelview/addstarRating.do")
public class AddStarRating extends BaseController{

	private static final long serialVersionUID = 8204923517558519049L;
	
	
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		return null;
	}
	
}
