package study.jsp.bookstory.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

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
import study.jsp.bookstory.service.ReportService;
import study.jsp.bookstory.service.impl.ReportServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

/**
 * Servlet implementation class AdminMemberDeleteOk
 */
@WebServlet("/admin/admin_member_delete_Ok.do")
public class AdminMemberDeleteOk extends BaseController {

	private static final long serialVersionUID = 1225987002522917890L;
	
	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	ReportService reportService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MybatisConnectionFactory.getSqlSession();
		reportService = new ReportServiceImpl(sqlSession, logger);
		
		int memberId = web.getInt("memberId");
		
		logger.debug("memberId + " + memberId);
		
		int articleNull = 0;
		int commentNull = 0;
		int buyNull = 0;
		int rentNull = 0;
		int reportNull = 0;
		int recentepisodeNull = 0;
		int favoriteNull = 0;
		int bookmarkNull = 0;
		int starmarkNull = 0;
		
		Article article = new Article();
		article.setMember_id(memberId);
		
		Comment comment = new Comment();
		comment.setMember_id(memberId);
		
		Buy buy = new Buy();
		buy.setMember_id(memberId);
		
		Rent rent = new Rent();
		rent.setMember_id(memberId);
		
		Report report = new Report();
		report.setMember_id(memberId);
		report.setTarget_member_id(memberId);
		
		RecentEpisode recentEpisode = new RecentEpisode();
		recentEpisode.setMember_id(memberId);
		
		Favorite favorite = new Favorite();
		favorite.setMember_id(memberId);
		
		BookMark bookMark = new BookMark();
		bookMark.setMember_id(memberId);
		
		StarMark starMark = new StarMark();
		starMark.setMember_id(memberId);
		
		Member member = new Member();
		member.setId(memberId);
		
		try{
			articleNull = reportService.selectAdminCountArticle(article);
			if(articleNull > 0) {
				reportService.updateAdminArticle(article);
			}
			commentNull = reportService.selectAdminCountCommment(comment);
			if(commentNull > 0) {
				reportService.updateAdminComment(comment);
			}
			buyNull = reportService.selectAdminCountBuy(buy);
			if(buyNull > 0) {
				reportService.deleteAdminBuy(buy);
			}
			rentNull = reportService.selectAdminCountRent(rent);
			if(rentNull > 0) {
				reportService.deleteAdminRent(rent);
			}
			reportNull = reportService.selectAdminCountReport(report);
			if(reportNull > 0) {
				reportService.deleteAdminReport(report);
			}
			recentepisodeNull = reportService.selectAdminCountRecentEpisode(recentEpisode);
			if(recentepisodeNull > 0) {
				reportService.deleteAdminRecentEpisode(recentEpisode);
			}
			favoriteNull = reportService.selectAdminCountFavorite(favorite);
			if(favoriteNull > 0) {
				reportService.deleteAdminFavorite(favorite);
			}
			bookmarkNull = reportService.selectAdminCountBookMark(bookMark);
			if(bookmarkNull > 0) {
				reportService.deleteAdminBookMark(bookMark);
			}
			starmarkNull = reportService.selectAdminCountStarMark(starMark);
			if(starmarkNull > 0) {
				reportService.deleteAdminStarMark(starMark);
			}
			reportService.deleteMemberId(member);
		}catch(Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		

		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("memberId", memberId);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		
		return null;
	}
	
	
	
}
