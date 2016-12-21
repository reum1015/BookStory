package study.jsp.bookstory.controller.mymenu;

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


import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class MyPoint
 */
@WebServlet("/mymenu/my_point.do")
public class MyPoint extends BaseController {
	private static final long serialVersionUID = 999332364233759918L;
	
/** (1) 사용하고자 하는 Helper 객체 선언 */
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	MemberService memberService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);		
		
		
		
		
		/** (3) 비로그인 여부 검사 */
		// 로그인중인 회원 정보 가져오기
		Member member = (Member) web.getSession("loginInfo");
		// 비로그인 중이라면 이페이지를 동작시켜서는 안된다.
		int point = 0;
		int member_id=0;
		
		
		if(member != null){		
			member_id=member.getId();
		}
			
		
		Member mem = new Member();
		mem.setId(member_id);
		
		try{
			point = memberService.selectMyPointByMemberId(mem);
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (6) 조회 결과를 View에 전달 */
		request.setAttribute("point", point);
		request.setAttribute("member_id", member_id);
		String view = "mymenu/my_point";
		
		return view;
	}
	
}
