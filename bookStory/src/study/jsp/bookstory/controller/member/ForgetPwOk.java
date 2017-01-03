package study.jsp.bookstory.controller.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.MailHelper;
import study.jsp.helper.Util;
import study.jsp.helper.WebHelper;


/**
 * Servlet implementation class ForgetPwOk
 */
@WebServlet("/login/ForgetPwOk")
public class ForgetPwOk extends BaseController {

	private static final long serialVersionUID = -4300496915449591746L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이페이지를 이용할 수 없다.
		if(web.getSession("loginInfo")!=null){
			web.redirect(web.getRootPath() + "/index.do", "이미 로그인 하셨습니다.");
			return null;
		}
		
		/** (4) 파라미터 받기 */
		// 입력된 메일 주소를 받는다.
		String email = web.getString("email");
		
		logger.debug("emil=" + email);
		
		if(email==null){
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요.");
			return null;
		}
		
		/** (5) 임시 비밀번호 생성하기 */
		String newPassword = Util.getInstance().getRandomPassword();
		
		/** (6) 입력값을 JavaBeans에 저장하기 */
		Member member = new Member();
		member.setEmail(email);
		member.setUser_pw(newPassword);
		
		/** (7) Service를 통한 비밀번호 갱신 */
		try{
			memberService.updateMemberPasswordByEmail(member);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (8) 발급된 비밀번호를 이메일로 발송하기 */
		String sender = "reum1015@gmail.com";
		String subject = "BookStory 비밀번호 변경 안내 입니다.";
		String content = "회원님의 새로운 비밀번호는 <strong>" + newPassword + "</strong>입니다.";
		
		try{
			//사용자가 입력한 메일주소를 수신자로 설정하여 메일 발송하기
			mail.sendMail(sender, email, subject, content);
		}catch(MessagingException e){
			web.redirect(null, "메일 발송에 실패했습니다. 관리자에게 문의 바랍니다.");
			return null;
		}
		
		/** (9) 결과 페이지로 이동 */
		// 여기서는 이전 페이지로 이동함
		web.redirect(null, "새로운 비밀번호가 메일로 발송되었습니다.");
	    
		return null;
	}
	

}
