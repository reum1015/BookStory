package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.CommonUtils;
import study.jsp.helper.WebHelper;

@WebServlet("/mymenu/my_point_oK.do")
public class MyPointOk extends BaseController{

	private static final long serialVersionUID = 7586741037786534499L;
	
	
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	BookService bookService;
	CommonUtils commonUtils;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		int addPoint = web.getInt("point");
		String name = web.getString("name");
		
			
		//회원의 현재 포인트 조회,멤머 Id조회
		Member member = (Member)web.getSession("loginInfo");
		
		
		int member_id = 0;
		int curPoint = 0;
		String nickName = "";
		if(member != null){
			member_id = member.getId();
			nickName = member.getNick_name();
		}
		
		logger.debug("member_id ---------->" + member_id);
		logger.debug("change Point ---------> " + curPoint);
		logger.debug("addPoint ---------> " + addPoint);
		
		//파라미터 셋팅
		Member mem = new Member();
		mem.setId(member_id);
		
		Member memPointGet = new Member();
		memPointGet.setId(member_id);
		
		try{
			
			curPoint = memberService.selectMyPointByMemberId(memPointGet);
			
			curPoint = curPoint + addPoint;
			mem.setPoint(curPoint);
			
			logger.debug("curPoint + addPoint --------------> " + curPoint);
			
			memberService.updateMyPointByMemberId(mem);
			
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("curPoint", curPoint);
		data.put("nickName", nickName);
		
		
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
