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
import study.jsp.bookstory.service.CommentService;
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;
import study.jsp.bookstory.model.Member;

/**
 * Servlet implementation class CommentDeleteOk
 */
@WebServlet("/comment/comment_delete_ok.do")
public class CommentDeleteOk extends BaseController {

	private static final long serialVersionUID = -3558234059980021025L;
	
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
		
		/** (3) 덧글 번호와 비밀번호 받기 */
		int comment_id = web.getInt("comment_id");
		
		logger.debug("comment_id=" + comment_id);
		
		if(comment_id==0){
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}
		
		/** (4) 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		/** (5) 데이터 삭제 처리 */
		// 로그인 중이라면 회원 일련번호를 Beans에 추가한다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			comment.setMember_id(loginInfo.getId());
		}
		
		try{
			commentService.selectCommentCountByMemberId(comment);
			commentService.deleteComment(comment);
		}catch(Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();	
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("commentId", comment_id);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		
		return null;
	}
	
}
