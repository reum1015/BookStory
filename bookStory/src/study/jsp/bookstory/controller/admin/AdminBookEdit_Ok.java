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

@WebServlet("/admin/admin_book_edit_ok.do")
public class AdminBookEdit_Ok extends BaseController{
	private static final long serialVersionUID = 7754357671954413892L;
	
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
		// TODO Auto-generated method stub
		
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
				
				String book_name_temp = paramMap.get("book_name");
				String book_author_temp = paramMap.get("book_author");
				String daily_date_temp = paramMap.get("daily_date");
				String intro_temp = paramMap.get("intro");
				String genre_temp = paramMap.get("genre");
				String tempBook_id = paramMap.get("book_id");
				
				String book_name = book_name_temp.trim();
				String book_author = book_author_temp.trim();
				String daily_date = daily_date_temp.trim();
				String intro = intro_temp.trim();
				String genre = genre_temp.trim();
				
				int book_id = Integer.parseInt(tempBook_id);
				
				//전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
				logger.debug("book_name  -------> " + book_name);
				logger.debug("book_author  -----> " + book_author);
				logger.debug("daily_date  ------> " + daily_date);
				logger.debug("intro  -----------> " + intro);
				logger.debug("genre  -----------> " + genre);
				logger.debug("book_id  -----------> " + book_id);

				/** (5) 입력값의 유효성 검사 */
				
				if(!regex.isValue(book_author)){
					sqlSession.close();
					web.redirect(null, "작가이름을 입력하세요");
					return null;
				}
				
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
				
				if(!regex.isValue(intro)){
					sqlSession.close();
					web.redirect(null, "시놉시스를 입력하세요");
					return null;
				}
			
				//입력받은 파라미터를 Beans로 묶기
				Book book = new Book();
				book.setId(book_id);
				book.setBook_author(book_author);
				book.setBook_name(book_name);
				book.setDaily_date(daily_date);
				book.setGenre(genre);
				book.setIntro(intro);
				
				try{
					bookService.updateBook(book);
				}catch (Exception e) {
					// TODO: handle exception
					sqlSession.close();
					web.redirect(null, e.getLocalizedMessage());
					return null;
				}
				
				/**  업로드 된 파일 정보 추출(첨부 파일 목록 처리) */
				List<FileInfo> fileList = upload.getFileList();
				
				//업로드 된 파일이 존재할 경우만 변수값을 할당한다.
				if(fileList != null){
					try{
						for(int i = 0; i <fileList.size(); i++){
							//업로드 된 정보 하나 추출하여 데이터베이스에 저장하기위한 형태로 가공해야 한다.
							FileInfo info = fileList.get(i);
							
							//기존에 있던 이미지 파일 삭제
							ImageFile file = new ImageFile();
							
							//기존에 있던 이미지 파일 삭제 파라미터
							file.setBook_id(book_id);
							file.setImage_type(info.getFieldName());
							
							ImageFile item = new ImageFile();
							
							//작품의 실제 파일 삭제
							item = imageFileService.selectBookFile(file);
							upload.removeFile(item.getFile_dir() + "/" + item.getFile_name());
							
							//DB에서 삭제
							imageFileService.deleteBookFile(file);
							
							
							//DB에 저장하기 위한 항목 생성
							ImageFile newfile = new ImageFile();
							
							// 데이터 복사
							newfile.setBook_id(book_id);
							newfile.setOrigin_name(info.getOrginName());
							newfile.setFile_dir(info.getFileDir());
							newfile.setFile_name(info.getFileName());
							newfile.setContent_type(info.getContentType());
							newfile.setFile_size(info.getFileSize());
							newfile.setImage_type(info.getFieldName());
							
							
							//저장처리
							imageFileService.insertBookFile(newfile);
						}//end for
						
					}catch (Exception e) {
						web.redirect(null, e.getLocalizedMessage());
						return null;
					}finally{
						sqlSession.close();
					}//end try ~ catch
				
				}//end if
				
				
				/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
				sqlSession.close();
				String url ="%s/admin/book_manage.do";
				url = String.format(url, web.getRootPath());
				web.redirect(url, "작품 정보 수정이 완료 되었습니다.");
				
				
		return null;
	}

}
