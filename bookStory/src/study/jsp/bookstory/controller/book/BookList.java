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
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.BuyService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.FavoriteService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.RentService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.BuyServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.FavoriteServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.bookstory.service.impl.RentServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.CommonUtils;
import study.jsp.helper.PageHelper;
import study.jsp.helper.TextConverter;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

import twitter4j.JSONArray;
import twitter4j.JSONException;
/**
 * Servlet implementation class BookList
 */
@WebServlet("/booklist/book_list.do")
public class BookList extends BaseController {

	private static final long serialVersionUID = -4560960172116157884L;
	
	
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	EpisodeService episodeService;
	UploadHelper upload;
	ImageFileService imageFileService;
	PageHelper pageHelper; 
	FavoriteService favoriteService;
	TextConverter textConverter;
	CommonUtils commonUtils;
	BuyService buyService;
	RentService rentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		view = "/booklist/book_list";
		
		/** (2)사용하고자 하는 Helper + Serive 객체 선언*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);
		textConverter = TextConverter.getInstance();
		commonUtils = CommonUtils.getInstance();
		buyService  = new BuyServiceImpl(sqlSession, logger);
		rentService = new RentServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사*/
		
		
			//session에서 id값 가져오기
		Member member = (Member)web.getSession("loginInfo");
			
		int member_id = 0;
		if(member != null){
				 member_id = member.getId();
		}
		
		logger.debug("member_id -------------------> " + member_id);
		
		/** (4) 파라미터 받기 */
		int book_id = web.getInt("book_id");
		
		
		//전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("book_id ------> " + book_id);
		
		//입력받은 파라미터를 Beans로 묶기, 파라미터로 넘겨줄 데이터
		Book bookItem = new Book();
		bookItem.setId(book_id);
		
		Episode episode = new Episode();			//에피소드 리스트 담을 빈즈
		episode.setBook_id(book_id);					//작품정보 빈즈에 셋팅
		
		//현재 페이지 수 --> 기본값 1페이지
		int page = web.getInt("page",1);
		
		//관심등록 수 저장변수
		//0 ----> 관심등록 X, 1-----> 관심등록 O
		int favoriteCount = 0;
		
		Favorite favorite = new Favorite();
		favorite.setMember_id(member_id);
		favorite.setBook_id(book_id);
		
		//작품의 첫화 저장 변수
		int firstEpisode = 0;
		
		//작품에 해당하는 전체 에피소드 갯수 저장 변수
		int totalCount = 0;
		
		//작품 정보 담을 빈즈
		Book getBookItem = new Book();		
		
		//에피소드 리스트 저장 List
		List<Episode> episodeList = new ArrayList<Episode>();
		episodeList = null;
		
		//회원의 작품 구매 목록 조회
		Buy buy = new Buy();
		buy.setMember_id(member_id);
		List<Buy> buyList = new ArrayList<Buy>();
		
		//회원의 작품에대한 대여 목록 조회
		Rent rent = new Rent();
		rent.setBook_id(book_id);
		List<Rent> rentList = new ArrayList<Rent>();
	
		try{
			
			//관심등록 확인용
			favoriteCount = favoriteService.selectCountFavoriteBookById(favorite);
			
			//작품에 해당하는 전체 에피소드 수
			totalCount = episodeService.countTotalEpisodeByBookId(episode);
	
			//나머지 페이지 번호 계산하기
			//-->현재 페이지, 전체 게시물 수, 한페이지의 목록 수, 그룹 갯수
			pageHelper.pageProcess(page, totalCount, 4, 5);
			
			//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			episode.setLimitStart(pageHelper.getLimit_start());
			episode.setListCount(pageHelper.getList_count());
			
			//작품 정보 조회
			getBookItem = bookService.selectOneBookItem(bookItem);
			
			//에피소드 리스트 조회
			episodeList = episodeService.selectEpisdoeListAllByBook(episode);
			
			//작품의 첫화 에피소드 조회
			firstEpisode = episodeService.selectFirstEpisodeIdByBookId(episode);
			
			//회원의 작품 구매 목록 조회
			buyList = buyService.selectPurchaseEpisodeList(buy);
			
			//회원의 작품에 대한 대여 목록 조회
			rentList = rentService.selectEndRentTermForBook(rent);
			
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		//관심등록 설정 확인
		boolean isFavoriteState = favoriteCount > 0;
		
		logger.debug("favoriteCount ------->" + favoriteCount);
		logger.debug("episode List -----> " + episodeList);
		logger.debug("bookItem ----->" + bookItem.toString());
		logger.debug("buyList ------>" + buyList);
		logger.debug("rentList ----->" + rentList);
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체(작품 메인)
		if (getBookItem != null) {
			String imagePath = getBookItem.getImagePath();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 320, 220, false);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					getBookItem.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + getBookItem.getImagePath());
					}
				String day = getBookItem.getDaily_date();
				if(day != null){
					if(day.equals("MON")){
						day = "월요일";
					}else if(day.equals("TUE")){
						day = "화요일";
					}else if(day.equals("WEN")){
						day = "수요일";
					}else if("THU".equals(day)){
						day = "목요일";
					}else if(day.equals("FRI")){
						day = "금요일";
					}else if(day.equals("SAT")){
						day = "토요일";
					}else if(day.equals("SUN")){
						day = "일요일";
					}
					getBookItem.setDaily_date(day);
					
				}
				
				String genre = textConverter.genreOrDayConverter(getBookItem.getGenre());
				
				
				getBookItem.setGenre(genre);
				
				
			}
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체(에피소드 리스트)
				if (episodeList != null) {
					for (int i=0; i<episodeList.size(); i++) {
						Episode item = episodeList.get(i);
						String imagePath = item.getImagePath();
						if (imagePath != null) {
							String thumbPath = upload.createThumbnail(imagePath, 220, 190, true);
							// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
							item.setImagePath(thumbPath);
							logger.debug("thumbnail create > " + item.getImagePath());
						}
					}
				}
				
		
		JSONArray buyState = new JSONArray();
		JSONArray rentState = new JSONArray();
				
		try {
			buyState = new JSONArray(buyList.toArray());
			rentState = new JSONArray(rentList.toArray());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		//구매,대여 목록 리스트 자바스크립트용
		request.setAttribute("buyState", buyState);
		request.setAttribute("rentState", rentState);
		
		//페이지 번호 계산 결과 View에 전달
		request.setAttribute("pageHelper",pageHelper);		
				
		
		request.setAttribute("totalCount", totalCount);							//작품에 해당하는 전체 에피소드 수
		request.setAttribute("isFavoriteState", isFavoriteState);			//관심등록 설정 확인
		request.setAttribute("favoriteCount", favoriteCount);
		request.setAttribute("member_id", member_id);						
		request.setAttribute("bookitem", getBookItem);						//작품의 정보
		request.setAttribute("firstEpisode", firstEpisode);					//작품의 에피소드 첫화
		request.setAttribute("episodeList", episodeList);					//작품의 에피소드 리스트
		request.setAttribute("buyList", buyList);									//작품 구매목록 리스트
		request.setAttribute("rentList", rentList);
		request.setAttribute("member", member);
		
		return view;
	}

}
