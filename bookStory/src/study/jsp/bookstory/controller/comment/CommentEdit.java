package study.jsp.bookstory.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Comment;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.CommentService;
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class CommentEdit
 */
@WebServlet("/comment/comment_edit.do")
public class CommentEdit extends BaseController {

	private static final long serialVersionUID = -4989420516892789023L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 글 번호 파라미터 받기 */
		int comment_id = web.getInt("comment_id");
		if(comment_id==0){
			sqlSession.close();
			web.redirect(null, "덧글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		int member_id = 0;
		String user_nickname = null;
		
        Member loginInfo = (Member) web.getSession("loginInfo");
		
		if(loginInfo!=null){
			member_id = loginInfo.getId();
			user_nickname = loginInfo.getNick_name();
		}else{
			web.redirect(null, "로그인 후에 이용 가능합니다.");
			return null;
		}
		logger.debug("memberId=" + member_id);
		logger.debug("userNickname=" + user_nickname);
		
		comment.setMember_id(member_id);
		
		/** (4) 덧글 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 덧글이 저장될 객체
		Comment readComment = null;
		
		int result = 0;
		
		try{
			result = commentService.selectCommentCountByMemberId(comment);
			if(result==0){
				throw new NullPointerException();
			}
			readComment = commentService.selectComment(comment);
		}catch(NullPointerException e){
			web.redirect(null, "본인글만 수정 가능합니다.");
			return null;
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("comment", readComment);
		
		
		return "comment/comment_edit";
	}
	
}
