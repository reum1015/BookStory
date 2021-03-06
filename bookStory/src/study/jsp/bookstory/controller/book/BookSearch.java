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
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;

import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;


@WebServlet("/book/BookSearch.do")
public class BookSearch extends BaseController {
	private static final long serialVersionUID = 863818730829314048L;

	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	ImageFileService imageFileService;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		/** (3) 검색어 받기 */
		String keyword = web.getString("keyword");
		
		
		if(keyword == null || keyword == ""){
			web.redirect(null,"검색어를 입력해 주세요");
			return null;
		}
		logger.debug("Keyword ---------> " + keyword);
		
		
		//검색어 공백 제거
		String trimKeyword = keyword.trim();
		String tempKeword = trimKeyword.replaceAll("\\s", "");
		
		//session에서 id값 가져오기
		String member_level=null;
		
		Member member = (Member)web.getSession("loginInfo");
		if(member != null){
			member_level = member.getMember_level();
		}

		/** (4) 파라미터를 Beans로 묶기 */	
		Book book = new Book();
		book.setBook_name(tempKeword);
		
		/** (5) 데이터 검색 처리 */
		List<Book> list = new ArrayList<>();
				
		try{
			list = bookService.searchBookItemList(book);
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		//이미지 경로를 썸네일로 교체
		if(list != null){
			for(int i = 0; i < list.size(); i++){
				Book bookItem  = list.get(i);
				String imagePath = bookItem.getImagePath();
				if(imagePath != null){
					String thumbPath = upload.createThumbnail(imagePath, 150, 118, true);
					bookItem.setImagePath(thumbPath);
					logger.debug("thumbnail create ---------> " + bookItem.getImagePath());
				}
			}
		}
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		
		request.setAttribute("bookitem", list);
		request.setAttribute("member_level", member_level);
		
		String view = "booklist/book_search";
		
		return view;
		
		
		
		
	}


}
