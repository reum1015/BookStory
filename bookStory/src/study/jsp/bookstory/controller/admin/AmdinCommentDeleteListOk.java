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
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;
import study.jsp.helper.WebHelper;


@WebServlet("/admin/commentDeleteListOk.do")
public class AmdinCommentDeleteListOk extends BaseController{
	private static final long serialVersionUID = 4812298994589789508L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ReportService reportService;
	PageHelper pageHelper;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		reportService = new ReportServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		int comment_id = web.getInt("comment_id");
		
		if(comment_id == 0){
			sqlSession.close();
			web.printJsonRt("댓글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		
		Report report = new Report();
		report.setComment_id(comment_id);
		
		try{
			reportService.deleteReportedCommentOnlyReportList(report);
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("comment_id", comment_id);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
