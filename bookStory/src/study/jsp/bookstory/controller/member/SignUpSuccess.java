package study.jsp.bookstory.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;
import study.jsp.bookstory.model.Member;


/**
 * Servlet implementation class SignUpSuccess
 */
@WebServlet("/login/sign_up_success.do")
public class SignUpSuccess extends BaseController {

	
	private static final long serialVersionUID = 5602480707235926069L;
	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	
	SqlSession sqlSession;
	
	WebHelper web;
	
	RegexHelper regex;
	
	UploadHelper upload;
	
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo")!=null){
			web.redirect(web.getRootPath() + "/index.do", "이미 로그인 하셨습니다.");
			return null;
		}
		
		/** (4) 파라미터 받기 */
		
		String user_id = web.getString("user_id");
		String nick_name = web.getString("nick_name");
		String user_pw = web.getString("user_pw");
		String user_pw_re = web.getString("user_pw_re");
		String name = web.getString("name");
		String gender = web.getString("gender");
		String birthdate = web.getString("birthdate");
		String email = web.getString("email");
		String tel = web.getString("tel");
		int point = web.getInt("point");
		String member_level = web.getString("member_level");
		
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("userId=" + user_id);
		logger.debug("nickName=" + nick_name);
		logger.debug("userPw=" + user_pw);
		logger.debug("userPwRe=" + user_pw_re);
		logger.debug("name=" + name);
		logger.debug("gender=" + gender);
		logger.debug("birthdate=" + birthdate);
		logger.debug("email=" + email);
		logger.debug("tel=" + tel);
		logger.debug("point=" + point);
		logger.debug("memberLevel=" + member_level);
		
		/** (5) 입력값의 유효성 검사 */
		// 아이디검사
		if(!regex.isValue(user_id)){
			sqlSession.close();
			web.redirect(null, "아이디를 입력하세요.");
			return null;
		}
		
		if(!regex.isEngNum(user_id)){
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		if(user_id.length()>20){
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		// 닉네임검사
		if(!regex.isValue(nick_name)){
			sqlSession.close();
			web.redirect(null, "닉네임을 입력하세요.");
			return null;
		}
				
		if(!regex.isKorNum(nick_name)){
			sqlSession.close();
			web.redirect(null, "닉네임은 숫자와 한글의 조합으로 20자까지만 가능합니다.");
			return null;
		}
				
		if(nick_name.length()>20){
			sqlSession.close();
			web.redirect(null, "닉네임은 숫자와 한글의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		// 비밀번호 검사
		if(!regex.isValue(user_pw)){
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}
		
		if(!regex.isEngNum(user_pw)){
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
			
		if(user_pw.length()>20){
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		// 비밀번호 확인
		if(!user_pw.equals(user_pw_re)){
			sqlSession.close();
			web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
			return null;
		}
		
		// 이름 검사
		if(!regex.isValue(name)){
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}
		
		if(!regex.isKor(name)){
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}
			
		if(name.length()<2||name.length()>5){
			sqlSession.close();
			web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
			return null;
		}
		
		// 성별 검사
		if(!regex.isValue(gender)){
			sqlSession.close();
			web.redirect(null, "성별을 입력하세요.");
			return null;
		}
				
		if(!gender.equals("M") && !gender.equals("F")){
			sqlSession.close();
			web.redirect(null, "성별이 잘못되었습니다.");
			return null;
		}		
		
		// 생년월일 검사
		if(!regex.isValue(birthdate)){
			sqlSession.close();
			web.redirect(null, "생년월일을 입력하세요.");
			return null;
		}
				

		
		// 이메일 검사
		if(!regex.isValue(email)){
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요.");
			return null;
		}
		
		if(!regex.isEmail(email)){
			sqlSession.close();
			web.redirect(null, "이메일의 형식이 잘못되었습니다.");
			return null;
		}
		
		// 연락처 검사
		if(!regex.isValue(tel)){
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요.");
			return null;
		}
		
		if(!regex.isCellPhone(tel) && !regex.isTel(tel)){
			sqlSession.close();
			web.redirect(null, "연락처의 형식이 잘못되었습니다.");
			return null;
		}
		
		
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setUser_id(user_id);
		member.setNick_name(nick_name);
		member.setUser_pw(user_pw_re);
		member.setName(name);
		member.setGender(gender);
		member.setBirthdate(birthdate);
		member.setEmail(email);
		member.setTel(tel);
		member.setPoint(point);
		member.setMember_level(member_level);
		
		System.out.println("1111111**************************************");
		
		
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try{
			
			
			
				
			
			
				memberService.insertMember(member);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		System.out.println("22222222**************************************");
		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/index.do", "회원가입이 완료되었습니다. 보너스 1000포인트 지급되었습니다.");
			
		return null;
	}
	
}
