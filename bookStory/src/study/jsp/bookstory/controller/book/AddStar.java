package study.jsp.bookstory.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.service.StarMarkService;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/episode/AddStar.do")
public class AddStar extends BaseController{

	private static final long serialVersionUID = 8204923517558519049L;
	
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	
	StarMarkService starMarkService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
				
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
				
		starMarkService = new StarMarkServiceImpl(sqlSession, logger);
		
		
		
		String view = "/novelview/addStarModal";
		
		
		//파라미터 받기
		int member_id = web.getInt("member_id");
		int book_id = web.getInt("book_id");
		int episode_id = web.getInt("episode_id");
		
		logger.debug("episode_id _-------------------->  " + episode_id);
		logger.debug("book_id _-------------------->  " + book_id);
		logger.debug("member_id _-------------------->  " + member_id);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("book_id", book_id);
		request.setAttribute("episode_id", episode_id);
		
		return view;
	}
	
}
