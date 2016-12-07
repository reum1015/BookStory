package study.jsp.bookstory.controller.comment;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class CommentList
 */
@WebServlet("/comment/comment_list.do")
public class CommentList extends BaseController {

	private static final long serialVersionUID = -2718633942218878804L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		int article_id = web.getInt("article_id");
		String nick_name = web.getString("nick_name");
		logger.debug("nick_name=" + nick_name);
		logger.debug("article_id=" + article_id);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		// 덧글이 소속될 게시물의 일련번호
		if(article_id==0){
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		Member member = new Member();
		member.setNick_name(nick_name);
		comment.setArticle_id(article_id);
		
		/** (6) Service를 통한 덧글 목록 조회 */
		// 작성 결과를 저장할 객체
		List<Comment> item = null;
		try{
			item = commentService.selectCommentList(comment);
		}catch(Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리
		for(int i=0; i<item.size(); i++){
			Comment temp = item.get(i);
			temp.setContent(web.convertHtmlTag(temp.getContent()));
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		
		
		return null;
	}
	
}
