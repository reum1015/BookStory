package study.jsp.bookstory.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import study.jsp.bookstory.model.ImageFile;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.FileInfo;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/episode_upload_ok.do")
public class AdminEpisodeUpload_Ok extends BaseController{

	private static final long serialVersionUID = 2812256679398036208L;
	
	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	EpisodeService episodeService;
	RegexHelper regex;
	ImageFileService imageFileService;
	BookService bookService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2)사용하고자 하는 Helper + Serive 객체 선언*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		
		
		/** (3) 로그인 여부 검사*/
		
		
		
		/** (4) 파일이 포함된 POST 파라미터 받기 */
				//<form>태그 안에 <input type="file">요소가 포함되어 있고
				//<form>태그에 enctype="multipart/form-data"가 정의 되어있는 경우
				//webHelper의 getString() | getInt() 메서드는 더이상 사용할 수없게 된다.
		
		try{
			upload.multipartRequest(request);
		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.close();
			web.redirect(null, "multiPart 데이터가 아닙니다.");
			return null;
		}
		
		//UploadHelper에서 텍스트 형식의 파라미터를 분류한 Map을 리턴 받아서 값을 추출한다.
		Map<String, String> paramMap = upload.getParamMap();
		
		String book_name = paramMap.get("book_title");
		String genre = paramMap.get("genre");
		String daily_date = paramMap.get("daily_date");
		
		String episode_name_temp = paramMap.get("episode_name");
		String content_temp = paramMap.get("content");
		String author_comment_temp = paramMap.get("author_comment");
		String bookId = paramMap.get("book_id");
		
		String episode_name = episode_name_temp.trim();
		String content = content_temp.trim();
		String author_comment = author_comment_temp.trim();
	
		
		//전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("episode_title  -------> " + episode_name);
		logger.debug("content  -----> " + content);
		logger.debug("author_comment  ------> " + author_comment);
		logger.debug("book_id  -----------> " + bookId);
		
		/** (5) 입력값의 유효성 검사 */
		if(!regex.isValue(genre)){
			sqlSession.close();
			web.redirect(null, "장르를 선택해 주세요");
			return null;
		}
		
		if(!regex.isValue(daily_date)){
			sqlSession.close();
			web.redirect(null, "요일을 선택해 주세요");
			return null;
		}
		
		if(!regex.isValue(book_name)){
			sqlSession.close();
			web.redirect(null, "작품 제목을 입력해 주세요");
			return null;
		}
		
		if(!regex.isValue(episode_name)){
			sqlSession.close();
			web.redirect(null, "에피소드 이름을 입력해 주세요");
			return null;
		}
		
		if(!regex.isValue(content)){
			sqlSession.close();
			web.redirect(null, "내용을 입력해 주세요");
			return null;
		}
		
		if(!regex.isValue(author_comment)){
			sqlSession.close();
			web.redirect(null, "작가 코멘트를 입력해 주세요");
			return null;
		}
		//에피소드 content 쌍따옴표 처리
		//String tempContent = content.replace("\'", "\''").replace("\"", "\\\"");
		
		//book_id int타입으로 변환
		int book_id = Integer.parseInt(bookId);
		
		//작품의 총 구매 포인트와 렌트 포인트 등록을 위한 파라미터 셋팅
		Book book = new Book();
		book.setId(book_id);
		
		
		//입력받은 파라미터를 Beans로 묶기
		Episode episode = new Episode();
		episode.setAuthor_comment(author_comment);
		episode.setBook_id(book_id);
		episode.setContent(content);
		episode.setEpisode_name(episode_name);
		
		//작품의 총 에피소드 수 구하기
		//총에피소드 수가 0 이면 1 아니면 총에피소드수 + 1으로 셋팅
		int resut = 0;
		
		try{
			resut = episodeService.countTotalEpisodeByBookId(episode);
			resut = resut + 1;
			
		}catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
			
		episode.setEpisode_order(resut);
		
		//에피소드 제목 공백 처리
		//작품 제목의 공백처리
		String temp_episodeName = episode.getEpisode_name();
		temp_episodeName.trim();
		String resultEpisodeName = temp_episodeName.replaceAll(" ", "");
				
		
		//공백이 제거된 작품제목 
		Episode episode_title = new Episode();
		episode_title.setEpisode_name(resultEpisodeName);
		
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		

		try{
			
			//같은 에피소드의 제목이 있는지 검사
			episodeService.countEqualEpisodeName(episode_title);
			
			
			//없다면 에피소드 등록
			episodeService.insertEpisode(episode);
			
			//작품의 총 구매포인트와 렌트 포인트 업데이트
			bookService.updateTotalBuyAndRentPointForBook(book);
			

		}catch (Exception e) {
			// TODO: handle exception
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (6) 업로드 된 파일 정보 추출(첨부 파일 목록 처리) */
		List<FileInfo> fileList = upload.getFileList();
		
		//업로드 된 프로필 사진 경로가 저장될 변수 
		
		//업로드 된 파일이 존재할 경우만 변수값을 할당한다.
		try{
			for(int i = 0; i <fileList.size(); i++){
				//업로드 된 정보 하나 추출하여 데이터베이스에 저장하기위한 형태로 가공해야 한다.
				FileInfo info = fileList.get(i);
				
				//DB에 저장하기 위한 항목 생성
				ImageFile file = new ImageFile();
				
				//몇번 작품에 속한 파일인지 지정한다.
				file.setEpisode_id(episode.getId());
				file.setBook_id(book_id);
				
				// 데이터 복사
				file.setOrigin_name(info.getOrginName());
				file.setFile_dir(info.getFileDir());
				file.setFile_name(info.getFileName());
				file.setContent_type(info.getContentType());
				file.setFile_size(info.getFileSize());
				file.setImage_type(info.getFieldName());
				
				
				//저장처리
				imageFileService.insertEpisodeFile(file);
			}
			
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		
		/** (9) 업로드가 완료되었으면 어드민 메인페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/admin/admin_main.do", "업로드가 완성되었습니다.");
		//web.getRootPath() + "/admin/admin_main.do"
		return null;
		
		
	}

}
