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
import study.jsp.bookstory.model.RecentEpisode;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.RecentEpisodeService;
import study.jsp.bookstory.service.impl.RecentEpisodeServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class RecentNovelList
 */
@WebServlet("/mymenu/recentepisode_list.do")
public class RecentEpisodeList extends BaseController {

	private static final long serialVersionUID = 6192089085748485155L;
	
/** (1) 사용하고자 하는 Helper 객체 선언 */
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RecentEpisodeService recentepisodeService;
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
		recentepisodeService = new RecentEpisodeServiceImpl(sqlSession, logger);		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		
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
		
		int member_id = member.getId(); 
		
		/** (4) 조회할 정보에 대한 Beans 생성 */
		RecentEpisode recentepisode = new RecentEpisode();
		recentepisode.setMember_id(member_id);
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		
		/** (5) 게시글 목록 조회 */
		int totalCount = 0;
		List<RecentEpisode> recentepisodeList = null;
			
	
		try {
			// 전체 게시물 수
			totalCount = recentepisodeService.selectRecentEpisodeCount(recentepisode);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수 , 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 12, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을  Beans에 추가 
			recentepisode.setLimitStart(pageHelper.getLimit_start());
			recentepisode.setListCount(pageHelper.getList_count());			
			
			recentepisodeList = recentepisodeService.selectRecentEpisodeList(recentepisode);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		System.out.println("************************************");
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
		if (recentepisodeList !=null) {
			for ( int i = 0; i < recentepisodeList.size(); i++) {
				RecentEpisode item = recentepisodeList.get(i);
				String imagePath = item.getImagePath();
				
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 150, 118, true);
					// 글 목록 컬렉션 내의 Beans 객체가갖는 이미지경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + item.getImagePath());
				}
			}
		}
		
		request.setAttribute("member_level", member_level);
		/** (6) 조회 결과를 View에 전달 */
		request.setAttribute("recentepisode_list", recentepisodeList);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		// 갤러리 종류라면 View의 이름을 다르게 설정한다.
				String view = "mymenu/recentepisode_list";
				
		return view;
	}	
}
