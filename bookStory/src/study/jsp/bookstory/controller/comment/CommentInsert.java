package study.jsp.bookstory.controller.comment;

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
import study.jsp.bookstory.service.CommentService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class CommentInsert
 */
@WebServlet("/comment/comment_insert.do")
public class CommentInsert extends BaseController {

	private static final long serialVersionUID = -2564267564190361297L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	CommentService commentService;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		commentService = new CommentServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		int article_id = web.getInt("article_id");
		String nick_name = web.getString("nick_name");
		String content = web.getString("content");
		String ip_address = web.getClientIP();
		int member_id = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			nick_name = loginInfo.getNick_name();
			member_id = loginInfo.getId();
		}
		
		logger.debug("article_id=" + article_id);
		logger.debug("nick_name=" + nick_name);
		logger.debug("content=" + content);
		logger.debug("ip_address=" + ip_address);
		logger.debug("member_id=" + member_id);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		// 덧글이 소속될 게시물의 일련번호
		if(article_id==0){
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
		
		// 내용 검사
		if(!regex.isValue(content)){
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		Member member = new Member();
		comment.setArticle_id(article_id);
		member.setNick_name(nick_name);
		comment.setContent(content);
		comment.setIp_address(ip_address);
		comment.setMember_id(member_id);
		logger.debug("comment >> " + comment.toString());
		
		/** (6) Service를 통한 덧글 저장 */
		// 작성 결과를 저장할 객체
		Comment item = null;
		try{
			commentService.insertComment(comment);
			item = commentService.selectComment(comment);
		}catch(Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리
		item.setContent(web.convertHtmlTag(item.getContent()));
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		
		
		
		
		
		return null;
	}
	
}
