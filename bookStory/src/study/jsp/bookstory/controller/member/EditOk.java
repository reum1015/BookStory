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
import study.jsp.helper.WebHelper;
import study.jsp.bookstory.model.Member;

/**
 * Servlet implementation class EditOk
 */
@WebServlet("/member/edit_ok.do")
public class EditOk extends BaseController {

	private static final long serialVersionUID = -4610431188407820511L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if(loginInfo==null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/** (4) 파라미터 받기 */
		String nick_name = web.getString("nick_name");
		String user_pw = web.getString("user_pw");
		String new_user_pw = web.getString("new_user_pw");
		String new_user_pw_re = web.getString("new_user_pw_re");
		String name = web.getString("name");
		String gender = web.getString("gender");
		String birthdate = web.getString("birthdate");
		String email = web.getString("email");
		String tel = web.getString("tel");
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("nick_name=" + nick_name);
		logger.debug("user_pw=" + user_pw);
		logger.debug("new_user_pw=" + new_user_pw);
		logger.debug("new_user_pw_re=" + new_user_pw_re);
		logger.debug("name=" + name);
		logger.debug("gender=" + gender);
		logger.debug("birthdate=" + birthdate);
		logger.debug("email=" + email);
		logger.debug("tel=" + tel);
		
		/** (5) 입력값의 유효성 검사 (아이디 검사 수행안함) */
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
		
		// 현재 비밀번호 검사
		if(!regex.isValue(user_pw)){
			sqlSession.close();
			web.redirect(null, "현재 비밀번호를 입력하세요.");
			return null;
		}
		
		// 신규 비밀번호 검사
		// --> 신규 비밀번호가 입력된 경우는 변경으로 간주하고, 입력하지 않은 경우는
		//     변경하지 않도록 처리한다. 그러므로 입력된 경우만 검사해야 한다.
		if(regex.isValue(new_user_pw)){
			if(!regex.isEngNum(new_user_pw)||new_user_pw.length() > 20){
				sqlSession.close();
				web.redirect(null, "새로운 비밀번호는 숫자외 영문의 조합으로 20자 까지만 가능합니다.");
				return null;
			}
				
			// 비밀번호 확인
			if(!new_user_pw.equals(new_user_pw_re)){
				sqlSession.close();
				web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
				return null;
			}
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
						
		// 생년월일 검사
		if(!regex.isValue(birthdate)){
			sqlSession.close();
			web.redirect(null, "생년월일을 입력하세요.");
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
		
		/** (6) 전달받은 파라미터를 Beans 객체에 담는다. */
		// 아이디는 변경할 수 없으므로 제외한다.
		Member member = new Member();
		// WHERE절에 사용할 회원번호는 세션에서 취득
		member.setId(loginInfo.getId());
		member.setNick_name(nick_name);
		member.setUser_pw(user_pw);
		member.setName(name);
		member.setGender(gender);
		member.setBirthdate(birthdate);
		member.setEmail(email);
		member.setTel(tel);
		// 변경할 신규 비밀번호
		member.setNew_user_pw(new_user_pw);
		
		/** (7) Service를 통한 데이터베이스 저장 처리 */
		// 변경된 정보를 저장하기 위한 객체
		Member editInfo = null;
		try{
			memberService.selectMemberPasswordCount(member);
			memberService.updateMember(member);
			editInfo = memberService.selectMember(member);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (8) 세션, 쿠키 갱신 */
		// 세션을 갱신한다.
		web.removeSession("loginInfo");
		web.setSession("loginInfo", editInfo);
		
		/** (9) 수정이 완료되었으므로 다시 수정페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/index.do", "회원정보가 수정되었습니다.");
		
		
		
		return null;
	}
	

}
