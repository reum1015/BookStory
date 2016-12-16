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
import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.model.BookMark;
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Comment;
import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.RecentEpisode;
import study.jsp.bookstory.model.Rent;
import study.jsp.bookstory.model.Report;
import study.jsp.bookstory.model.StarMark;
import study.jsp.bookstory.service.ArticleService;
import study.jsp.bookstory.service.BookMarkService;
import study.jsp.bookstory.service.BuyService;
import study.jsp.bookstory.service.CommentService;
import study.jsp.bookstory.service.FavoriteService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.RecentEpisodeService;
import study.jsp.bookstory.service.RentService;
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.StarMarkService;
import study.jsp.bookstory.service.impl.ArticleserviceImpl;
import study.jsp.bookstory.service.impl.BookMarkServiceImpl;
import study.jsp.bookstory.service.impl.BuyServiceImpl;
import study.jsp.bookstory.service.impl.CommentServiceImpl;
import study.jsp.bookstory.service.impl.FavoriteServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.bookstory.service.impl.RecentEpisodeServiceImpl;
import study.jsp.bookstory.service.impl.RentServiceImpl;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class OutOk
 */
@WebServlet("/member/out_ok.do")
public class OutOk extends BaseController {

	private static final long serialVersionUID = -6396706094893661281L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	ArticleService articleService;
	CommentService commentService;
	BookMarkService bookmarkService;
	BuyService buyService;
	FavoriteService favoriteService;
	RecentEpisodeService recentepisodeService;
	RentService rentService;
	ReportService reportService;
	StarMarkService starmarkService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		articleService = new ArticleserviceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		buyService = new BuyServiceImpl(sqlSession, logger);
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);
		recentepisodeService = new RecentEpisodeServiceImpl(sqlSession, logger);
		rentService = new RentServiceImpl(sqlSession, logger);
		reportService = new ReportServiceImpl(sqlSession, logger);
		starmarkService = new StarMarkServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		if(web.getSession("loginInfo")==null){
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
				
		/** (4) 파라미터 받기 */
		String user_pw = web.getString("user_pw");
		logger.debug("user_pw=" + user_pw);
		
		if(user_pw == null){
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}
		
		/** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다 */
		// 회원번호는 세션을 통해서 획득한 로그인 정보에서 취득
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUser_pw(user_pw);
		
		// 게시판과의 참조 관계 해제를 위한 조건값 설정
		Article article = new Article();
		article.setMember_id(loginInfo.getId());
		
		// 덧글과의 참조 관계 해제를 위한 조건값 설정
		Comment comment = new Comment();
		comment.setMember_id(loginInfo.getId());
		
		BookMark bookmark = new BookMark();
		bookmark.setMember_id(loginInfo.getId());
		
		Buy buy = new Buy();
		buy.setMember_id(loginInfo.getId());
		
		Favorite favorite = new Favorite();
		favorite.setMember_id(loginInfo.getId());
		
		RecentEpisode recentepisode = new RecentEpisode();
		recentepisode.setMember_id(loginInfo.getId());
		
		Rent rent = new Rent();
		rent.setMember_id(loginInfo.getId());
		
		Report report = new Report();
		report.setMember_id(loginInfo.getId());
		
		StarMark starmark = new StarMark();
		starmark.setMember_id(loginInfo.getId());
		
		/** (6) Service를 통한 탈퇴 시도 */
		try{
			articleService.updateArticleMemberOut(article);
			commentService.updateCommentMemberOut(comment);
			bookmarkService.deleteBookMarkAll(bookmark);
			buyService.deleteBuyAll(buy);
			favoriteService.deleteFavoriteAll(favorite);
			recentepisodeService.deleteRecentEpisodeAll(recentepisode);
			rentService.deleteRentAll(rent);
			reportService.updateReportMemberOut(report);
			starmarkService.deleteStarMarkAll(starmark);
			memberService.selectMemberPasswordCount(member);
			memberService.deleteMember(member);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/** (7) 정상적으로 탈퇴된 겅우 강제 로그아웃 및 페이지 이동 */
		web.removeAllSession();
		web.redirect(web.getRootPath() + "/index.do", "탈퇴되었습니다.");
		
		return null;
	}
	

}
