package study.jsp.bookstory.controller.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Favorite;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.FavoriteService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.FavoriteServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.PageHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;



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
		
		Episode episode = new Episode();		//에피소드 리스트 담을 빈즈
		episode.setBook_id(book_id);				//작품정보 빈즈에 셋팅
		
		
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
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		boolean isFavoriteState = favoriteCount > 0;
		
		logger.debug("favoriteCount ------->" + favoriteCount);
		logger.debug("episode List -----> " + episodeList);
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체(작품 메인)
		if (getBookItem != null) {
			String imagePath = getBookItem.getImagePath();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 320, 220, false);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					getBookItem.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + getBookItem.getImagePath());
					}
					
			}
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
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
		
		//페이지 번호 계산 결과 View에 전달
		request.setAttribute("pageHelper",pageHelper);		
				
		
		
		request.setAttribute("isFavoriteState", isFavoriteState);
		request.setAttribute("favoriteCount", favoriteCount);
		request.setAttribute("member_id", member_id);
		request.setAttribute("bookitem", getBookItem);
		request.setAttribute("firstEpisode", firstEpisode);
		request.setAttribute("episodeList", episodeList);
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValueAsString(data);
		
		
		return view;
	}

}
