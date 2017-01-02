package study.jsp.bookstory.controller.episodecomment;

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

@WebServlet("/episodecomment/episode_comment_reported.do")
public class EpisodeCommentReported extends BaseController{
	private static final long serialVersionUID = 7427661135694768630L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		
		int comment_id = web.getInt("comment_id");
		int member_id = 0;
		Member loginInfo = (Member) web.getSession("loginInfo");
		
		if(loginInfo != null){
			member_id = loginInfo.getId();
		}
		
		// 파라미터를 Beans로 묶기
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		logger.debug("comment_id -------------> " + comment_id);
		logger.debug("memmberId -------------> " + member_id);
		
		comment.setMember_id(member_id);
		
		/** (4) 덧글 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 덧글이 저장될 객체
		Comment readComment = null;
		
		int result = 0;
		
		try{
			result = commentService.selectCommentCountByMemberId(comment);
			if(result!=0){
				throw new Exception();
			}
			readComment = commentService.selectComment(comment);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("comment", readComment);
		
		
		return "episodecomment/episode_comment_report";
	}

}
