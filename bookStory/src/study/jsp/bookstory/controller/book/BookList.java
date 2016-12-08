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
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
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
		
		/** (3) 로그인 여부 검사*/
		
		
		
		
		
		
		/** (4) 파라미터 받기 */
		int book_id = web.getInt("book_id");
		
		//전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("book_id ------> " + book_id);
		
		
		
		//입력받은 파라미터를 Beans로 묶기
		Book bookItem = new Book();
		bookItem.setId(book_id);
		
		
		Book getBookItem = new Book();		//작품 정보 조회
		
		
		Episode episode = new Episode();	//에피소드 리스트 조회
		episode.setBook_id(book_id);
		
		List<Episode> episodeList = new ArrayList<Episode>();
		episodeList = null;
		try{
			
			//작품 정보 조회
			getBookItem = bookService.selectOneBookItem(bookItem);
			
			//에피소드 리스트 조회
			episodeList = episodeService.selectEpisdoeListAllByBook(episode);
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		
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
		
		
		
		request.setAttribute("bookitem", getBookItem);
		request.setAttribute("episodeList", episodeList);
		
		return view;
	}

}
