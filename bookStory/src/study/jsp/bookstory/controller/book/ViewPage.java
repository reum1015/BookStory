package study.jsp.bookstory.controller.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.model.BookMark;
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.RecentEpisode;
import study.jsp.bookstory.model.Rent;
import study.jsp.bookstory.model.StarMark;
import study.jsp.bookstory.service.BookMarkService;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.BuyService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.RecentEpisodeService;
import study.jsp.bookstory.service.RentService;
import study.jsp.bookstory.service.StarMarkService;
import study.jsp.bookstory.service.impl.BookMarkServiceImpl;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.BuyServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.RecentEpisodeServiceImpl;
import study.jsp.bookstory.service.impl.RentServiceImpl;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;

import study.jsp.helper.WebHelper;

@WebServlet("/novelview/view_page.do")
public class ViewPage extends BaseController{

	private static final long serialVersionUID = 113920651746454564L;
	
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	EpisodeService episodeService;
	PageHelper pageHelper;
	StarMarkService starMarkService;
	BookMarkService bookmarkService;
	BuyService buyService;
	RentService rentService;
	RecentEpisodeService recentEpisodeService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = "novelview/view_page";
		
        /** (2)사용하고자 하는 Helper + Serive 객체 선언*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		starMarkService = new StarMarkServiceImpl(sqlSession, logger);
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		buyService = new BuyServiceImpl(sqlSession, logger);
		rentService = new RentServiceImpl(sqlSession, logger);
		recentEpisodeService = new RecentEpisodeServiceImpl(sqlSession, logger);
		
		/** (3)파라미터 받기 */
		
		int episode_id = web.getInt("episode_id");
		int book_id = web.getInt("book_id");
		
		logger.debug("episode_id ------------------> " + episode_id);
		logger.debug("book_id ------------------> " + book_id);
		
		if (episode_id == 0) {
			sqlSession.close();
			web.redirect(null, "에피소드 번호가 지정되지 않았습니다.");
			return null;
		}

		/** 로그인 여부 검사 */
		int member_id = 0;
		
		Member loginInfo = new Member();
		loginInfo = (Member)web.getSession("loginInfo");
		logger.debug("loginInfo-------------------------------------->" + loginInfo);
		
		if(loginInfo != null){
			member_id = loginInfo.getId();
		}else{
			web.redirect(null, "로그인이 필요한 서비스 입니다.");
			sqlSession.close();
			return null;
		}
		
		logger.debug("member_id -----------------------------------> " + member_id);
		
		/** 구매 여부와 대여 여부 확인 */
		Buy paramBuy = new Buy();
		Rent paramRent = new Rent();
		
		paramBuy.setMember_id(member_id);
		paramBuy.setEpisode_id(episode_id);
		
		paramRent.setMember_id(member_id);
		paramRent.setEpisode_id(episode_id);
		
		//회원의 렌트 여부와 대여 기간 저장 변수
		List<Rent> rentItem = new ArrayList<>();
		what : try{
			//회원의 작품의 구매여부 확인
			int buyCount = buyService.selectBuyCountByMemberId(paramBuy);
			logger.debug("buyCount ------------>" + buyCount);
			
			boolean isBuyed = buyCount > 0;
			
			
			//구매 한 회원
			if(isBuyed){
				break what;
			}
		
			rentItem = rentService.selectRentCountByMemberId(paramRent);
			boolean isRented = (rentItem.size() > 0);
			
			logger.debug("isBuyed -----------------------------> " + isBuyed);
			logger.debug("isRented ----------------------------> " + isRented);
			logger.debug("rentItem ----------------------------> " + rentItem);
			
			
			//대여나 구매를 하지 않았다면
			if(!isBuyed && !isRented){
				web.redirect(null, "작품을 볼 권한이 없습니다.");
				sqlSession.close();
				return null;
			}
			
			logger.debug("**********************************************");
			
			if(isRented){
				
				String temp_date;
				int rent_term = 0;
				for(int i = 0; i < 1; i++){
					temp_date = rentItem.get(i).getRent_term();
					rent_term = Integer.parseInt(temp_date);
				}
				
				logger.debug("rent_term ----------------> " + rent_term);
				
					if(rent_term <= 0){
						web.redirect(null, "작품을 볼 권한이 없습니다.");
						sqlSession.close();
						return null;
					}
			}
		}catch (Exception e) {
			web.redirect(null, "에피소드 번호가 지정되지 않았습니다 - 1.");
			sqlSession.close();
			return null;
		}
		
		/** 파라미터 Beans로 묶기 */
		Episode episode = new Episode();
		episode.setId(episode_id);
		episode.setBook_id(book_id);
		
		Book book = new Book();
		book.setId(book_id);
		
		// 북마크 저장변수
		int bookmarkCount = 0;
		
        BookMark bookmark = new BookMark();
        bookmark.setMember_id(member_id);
        bookmark.setEpisode_id(episode_id);
		
     // 작품 정보 담을 빈즈
		Episode episodeItem = new Episode();
		Book bookItem = new Book();		
		
		/** 별점 등록 확인 여부 */ 
		int resultaddStarCount = 0;
		
		//
		StarMark star = new StarMark();
		star.setMember_id(member_id);
		star.setEpisode_id(episode_id);
		
		List<Episode> episodeTitleList = null;		//에피소드 제목 리스트 저장 변수
		
		//최근 본 작품 Insert용 파라미터
		RecentEpisode recent = new RecentEpisode();
		recent.setMember_id(member_id);
		recent.setBook_id(book_id);
		recent.setEpisode_id(episode_id);
		
		//작품 아이디와 에피소드 아이드를 조합한 문자열 생성
		String cookieKey = "episode_" + book_id + "_" + episode_id;
		//준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookieKey);
		
		try{
			//쿠키값이 없다면 조회수 갱신
			if(cookieVar == null){
				episodeService.updateEpisodeHit(episode); 	//에피소드 조회수 +1
				bookService.updateBookHit(book); 					//작품 +1
				
				//준비한 문자열에 대한 쿠키를 24시간동안 저장
				web.setCookie(cookieKey, "Y", 60*60*24);
			}
			
			// 북마크 확인용
			bookmarkCount = bookmarkService.selectCountBookMarkById(bookmark);
			
			/** 별점 참여 여부 검사 */ 
			resultaddStarCount = starMarkService.selectCountAddStarById(star);
			
			/** 한개의 에피소드 가져오기 */
			episodeItem = episodeService.selectOneEpisodeItem(episode);
			
			/** 한개의 작품 정보 가져오기 */
			bookItem = bookService.selectOneBookItem(book);
			
			/** 한개의 작품속에 있는 에피소드의 제목과 ID*/
			episodeTitleList = episodeService.selectAllEpisodeTitle(episode);
			
			//최근 본 작품이 존재 하지 않다면 RecenteEpisode 테이블에 insert
			int result = recentEpisodeService.selectRecentEpisodeIsCount(recent);
			if(result <= 0){
				/** 최근 본작품 테이블에 Insert*/
				recentEpisodeService.insertAddRecentEpisode(recent);
			}
		}catch (Exception e) {
			web.redirect(null, "에피소드 번호가 지정되지 않았습니다 - 2.");
			return null;
		}finally{
			sqlSession.close();
		}
		
		boolean isBookMarkState = bookmarkCount > 0;
		
		boolean isStarAdd = false;
		if(resultaddStarCount > 0){
			isStarAdd = true;
		}
		
		logger.debug("bookmarkCount ------->" + bookmarkCount);
		logger.debug("isStarAdd -----------------------------------------> " + isStarAdd);
		
		request.setAttribute("isStarAdd", isStarAdd);
		request.setAttribute("episodeTitleList", episodeTitleList);
		request.setAttribute("episode", episodeItem);
		request.setAttribute("book", bookItem);
		request.setAttribute("isBookMarkState", isBookMarkState);
        request.setAttribute("bookmarkCount", bookmarkCount);
		request.setAttribute("member_id", member_id);
		request.setAttribute("book_id", book_id);
		
		return view;
	}

}
