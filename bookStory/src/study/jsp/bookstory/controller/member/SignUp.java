package study.jsp.bookstory.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/login/sign_up.do")
public class SignUp extends BaseController {

	private static final long serialVersionUID = 7220473215694053811L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		web = WebHelper.getInstance(request, response);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo")!=null){
			web.redirect(web.getRootPath() + "/index.do", "이미 로그인 하셨습니다.");
			return null;
		}
		
		return "login/sign_up";
	}
	
}
