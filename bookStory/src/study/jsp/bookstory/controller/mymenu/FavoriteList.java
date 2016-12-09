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
import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.FavoriteService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.FavoriteServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class FavoriteList
 */
@WebServlet("/mymenu/favorite_list.do")
public class FavoriteList extends BaseController {

	private static final long serialVersionUID = 4396098289263241945L;
	
/** (1) 사용하고자 하는 Helper 객체 선언 */
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	FavoriteService favoriteService;
	PageHelper pageHelper;
	
	ImageFileService imagefileSevice;	
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;


	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		
		/** (3) 비로그인 여부 검사 */
		// 비로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo") ==null){
			web.redirect(web.getRootPath() + "/login/login.do", " 로그인 후 이용하시기 바랍니다.");
			return null;
		}		
		
		Member member = (Member)web.getSession("loginInfo");
		
		int member_id = member.getId();
		
		/** (4) 조회할 정보에 대한 Beans 생성 */
		Favorite favorite = new Favorite();
		favorite.setMember_id(member_id);
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		
		
		/** (5) 게시글 목록 조회 */
		int totalCount = 0;
		List<Favorite> favoriteList = null;
			
	
		try {
			// 전체 게시물 수
			totalCount = favoriteService.selectFavoriteCount(favorite);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수 , 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 12, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을  Beans에 추가 
			favorite.setLimitStart(pageHelper.getLimit_start());
			favorite.setListCount(pageHelper.getList_count());			
			
			favoriteList = favoriteService.selectFavoriteList(favorite);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		System.out.println("************************************");
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
		if (favoriteList !=null) {
			for ( int i = 0; i < favoriteList.size(); i++) {
				Favorite item = favoriteList.get(i);
				String imagePath = item.getImagePath();
				
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 150, 118, true);
					// 글 목록 컬렉션 내의 Beans 객체가갖는 이미지경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + item.getImagePath());
				}
			}
		}
				
		/** (6) 조회 결과를 View에 전달 */
		request.setAttribute("favorite_list", favoriteList);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		// 갤러리 종류라면 View의 이름을 다르게 설정한다.
			String view = "mymenu/favorite_list";
				
		
				return view;
	}

}
