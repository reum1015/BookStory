package study.jsp.bookstory.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/comment_blind.do")
public class AdminCommentBlind extends BaseController{
	private static final long serialVersionUID = 1645548380510576515L;
	
	WebHelper web;
	SqlSession sqlSession;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		
		int comment_id = web.getInt("comment_id");
		
		if(comment_id == 0){
			sqlSession.close();
			web.redirect(null, "댓글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		request.setAttribute("comment_id", comment_id);
		
		
		return "comment/comment_blind";
	}

}
