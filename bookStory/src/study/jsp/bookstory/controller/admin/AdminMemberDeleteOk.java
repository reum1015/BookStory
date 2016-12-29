package study.jsp.bookstory.controller.admin;

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
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class AdminMemberDeleteOk
 */
@WebServlet("/admin/admin_member_delete_Ok.do")
public class AdminMemberDeleteOk extends BaseController {

	private static final long serialVersionUID = 1225987002522917890L;
	
	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	ReportService reportService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		int memberId = web.getInt("memberId");
		
		logger.debug("memberId + " + memberId);
		
		
		
		Member member = new Member();
		member.setId(memberId);
		
		try{
			reportService.deleteMemberId(member);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		

		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("memberId", memberId);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		
		return null;
	}
	
	
	
}
