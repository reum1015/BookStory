package study.jsp.bookstory.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.StarMark;
import study.jsp.bookstory.service.StarMarkService;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/book/addStar.do")
public class AddStarOk extends BaseController{

	private static final long serialVersionUID = -5686895178885874355L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	
	StarMarkService starMarkService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
		
		starMarkService = new StarMarkServiceImpl(sqlSession, logger);
		
		//별점 점수 받기
		String tempStar = web.getString("star_rate");
		
		//점수 정수형으로 변환
		int star_rate = Integer.parseInt(tempStar);
		
		logger.debug("star_rate ----------------->" + star_rate);
		
		//만약 점수가 0이면 되돌림
		if(star_rate == 0){
			sqlSession.close();
			web.printJsonRt("0점 이상만 등록 가능합니다.");
			return null;
		}
		
		//에피소드 Id 받기
		int episode_id = web.getInt("id");
		
		
		//파라미터를 Beans로 묶기
		StarMark starMark = new StarMark();
	
		//회원일련번호를 Beans에 추가
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo != null){
			
		}
		
		
		
		
		
		
		
		return null;
	}

}
