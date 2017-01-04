package study.jsp.bookstory.controller.episodecomment;

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
import study.jsp.bookstory.model.Comment;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.service.CommentService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;


@WebServlet("/episodecomment/episode_comment_report_ok.do")
public class EpisodeCommentReportedOk extends BaseController{
	private static final long serialVersionUID = 3111873065525615406L;
	
	
	Logger logger;
	SqlSession sqlSession;
	CommentService commentService;
	MemberService memberService;
	ReportService reportService;
	WebHelper web;
	
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(sqlSession, logger);
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		
		//신고자 회원 아이디값
		int member_id = web.getInt("member_id");
		//신고당하는 댓글 아이디값
		int comment_id = web.getInt("comment_id");
		//신고당하는 글 쓴 회원 아이디 값
		int comment_memberId = web.getInt("comment_memberId");
		//신고당하는 댓글 내용
		String comment_content = web.getString("comment_content");
		//신고 사유
		String report_reason = web.getString("report_reason");
		
		//신고당하는 유저 닉네임
		String user_nickname = web.getString("user_nickname");
		
		Member member = (Member)web.getSession("loginInfo");
		
		
		String nick_name = member.getNick_name();
		
		logger.debug("member_id - ---> " + member_id);
		logger.debug("comment_id ----> " + comment_id);
		logger.debug("comment_memberId ----> " + comment_memberId);
		logger.debug("comment_content ----> " + comment_content);
		logger.debug("report_reason ----> " + report_reason);
		logger.debug("user_nickname ----> " + user_nickname);
		logger.debug("nick_name ----> " + nick_name);
		
		Report report = new Report();
		
		report.setComment_content(comment_content);
		report.setComment_id(comment_id);
		report.setMember_id(member_id);
		report.setNick_name(nick_name);
		report.setUser_nickname(user_nickname);
		report.setTarget_member_id(comment_memberId);
		report.setReport_content(report_reason);
		
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		
		
		try{
			reportService.insertCommentReport(report);
			//commentService.updateCommentIsBlind(comment);
		}catch (Exception e) {
			sqlSession.close();
			web.printJsonRt("덧글 내용 신고에 실패했습니다.");
			return null;
		}finally {
			sqlSession.close();
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		return null;
		
		
		
	}

}
