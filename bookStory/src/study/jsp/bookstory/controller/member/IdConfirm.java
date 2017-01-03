package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class IdConfirm
 */
@WebServlet("/login/id_confirm.do")
public class IdConfirm extends BaseController {
	private static final long serialVersionUID = 4910746500645978195L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String view="login/id_confirm";
			
		 /** (2) 사용하고자 하는 Helper 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		 
		String name = web.getString("name");
		String email = web.getString("email");
		
		Member param = new Member();
		param.setEmail(email);
		param.setName(name);
		
		Member member = new Member();
		
		try{
			member = memberService.selectMemberIdByNameAndEmail(param);
			
		}catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		request.setAttribute("member", member);
		 
		sqlSession.close();
			
		return view;
	}

}
