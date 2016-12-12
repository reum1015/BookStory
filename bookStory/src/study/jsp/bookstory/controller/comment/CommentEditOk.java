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
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class CommentEditOk
 */
@WebServlet("/comment/comment_edit_ok.do")
public class CommentEditOk extends BaseController {

	private static final long serialVersionUID = -2748379296233203543L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		int comment_id = web.getInt("comment_id");
		String user_nickname = web.getString("user_nickname");
		String content = web.getString("content");
		String ip_address = web.getClientIP();
		int member_id = 0;
		
		logger.debug("comment_id=" + comment_id);
		logger.debug("user_nickname=" + user_nickname);
		logger.debug("content=" + content);
		logger.debug("ip_address=" + ip_address);
		logger.debug("member_id=" + member_id);
		
		/** (4) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. */
		// 소유권 검사 정보
		boolean myComment = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			try{
				Comment temp = new Comment();
				temp.setId(comment_id);
				temp.setMember_id(loginInfo.getId());
				
				if(commentService.selectCommentCountByMemberId(temp)>0){
					myComment = true;
					user_nickname = loginInfo.getNick_name();
					member_id = loginInfo.getId();
				}
			}catch(Exception e){
				sqlSession.close();
				web.printJsonRt(e.getLocalizedMessage());
				return null;
			}
		}
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("comment_id=" + comment_id);
		logger.debug("user_nickname=" + user_nickname);
		logger.debug("content=" + content);
		logger.debug("ip_address=" + ip_address);
		logger.debug("member_id=" + member_id);
		
		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
		if(comment_id == 0){
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}
		
		if(!regex.isValue(content)){
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
		
		/** (6) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setId(comment_id);
		comment.setUser_nickname(user_nickname);
		comment.setContent(content);
		comment.setIp_address(ip_address);
		comment.setMember_id(member_id);
		logger.debug(comment.toString());
		
		/** (7) 덧글 변경을 위한 Service 기능을 호출 */
		Comment item = null;
		try{
			if(!myComment){
				commentService.selectCommentCountByPw(comment);
			}
			commentService.updateComment(comment);
			item = commentService.selectComment(comment);
		}catch(Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (8) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리
		item.setUser_nickname(web.convertHtmlTag(item.getUser_nickname()));
		item.setContent(web.convertHtmlTag(item.getContent()));
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
	
}
