package study.jsp.bookstory.controller.mymenu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;

import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;


import study.jsp.bookstory.service.RentService;
import study.jsp.bookstory.service.impl.RentServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;

import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class RentList
 */
@WebServlet("/mymenu/rent_list.do")
public class RentList extends BaseController {

	private static final long serialVersionUID = -4077254707514218032L;

	 /** (1) 사용하고자 하는 Helper 객체 선언 */
	
		Logger logger;
		SqlSession sqlSession;
		WebHelper web;
		// --> import study.jsp.helper.RegexHelper;
		
		PageHelper pageHelper;
		RentService rentService;
		
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		rentService = new RentServiceImpl(sqlSession, logger);
		
		// 관리자에게만 admin버튼 활성화
		String member_level = "AA";
				
		if(web.getSession("loginInfo") != null){
			Member LoginInfo = (Member) web.getSession("loginInfo");
			member_level = LoginInfo.getMember_level();
		}
		
		/** (3) 비로그인 여부 검사 */
		// 비로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo") ==null){
			web.redirect(web.getRootPath() + "/login/login.do", " 로그인 후 이용하시기 바랍니다.");
			return null;
		}		
		
		Member member = (Member)web.getSession("loginInfo");
		int member_id = 0;
		if(member != null){
			member_id = member.getId();
		}
		
		Rent rent = new Rent();
		rent.setMember_id(member_id);
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
				int page = web.getInt("page", 1);
				
				/** (5) 게시글 목록 조회 */
				int totalCount = 0;
				List<Rent> rentList = null;		
				
			try {
					// 전체 게시물 수
					totalCount = rentService.selectRentCount(rent);
					
					// 나머지 페이지 번호 계산하기
					// --> 현재 페이지, 전체 게시물 수 , 한 페이지의 목록 수, 그룹갯수
					pageHelper.pageProcess(page, totalCount, 7, 5);
					
					// 페이지 번호 계산 결과에서 Limit절에 필요한 값을  Beans에 추가 
					rent.setLimitStart(pageHelper.getLimit_start());
					rent.setListCount(pageHelper.getList_count());			
					
					rentList = rentService.selectRentList(rent);
				} catch (Exception e) {
					web.redirect(null, e.getLocalizedMessage());
					return null;
				} finally {
					sqlSession.close();
				}
				
				System.out.println("************************************");
				
				/** (6) 조회 결과를 View에 전달 */
				request.setAttribute("member_level", member_level);
				request.setAttribute("rent_list", rentList);
				request.setAttribute("pageHelper", pageHelper);
		
		
		String view = "mymenu/rent_list";
		
		
		return view;
	}
	
    
}
