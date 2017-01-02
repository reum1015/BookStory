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
 * Servlet implementation class CommentDelete
 */
@WebServlet("/comment/comment_delete.do")
public class CommentDelete extends BaseController {

	private static final long serialVersionUID = 4946599261057081843L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		int comment_id = web.getInt("comment_id");
		if(comment_id==0){
			sqlSession.close();
			web.redirect(null, "덧글 번호가 없습니다.");
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			comment.setMember_id(loginInfo.getId());
		}else{
			web.redirect(null, "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/** (6) 게시물 일련번호를 사용한 데이터 조회 */
		// 회원번호가 일치하는 게시물 수 조회하기
		int commentCount = 0;
		try{
			commentCount = commentService.selectCommentCountByMemberId(comment);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (7) 자신의 글에 대한 요청인지에 대한 여부를 view에 전달 */
		boolean myComment = commentCount > 0;
		logger.debug("myComment", myComment);
		request.setAttribute("myComment", myComment);
		
		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("comment_id", comment_id);
		
		return "comment/comment_delete";
	}
	
}
