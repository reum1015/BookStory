package study.jsp.bookstory.controller.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.ImageFileService;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.ImageFileServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;

public class AdminEpisodeEdit_Ok extends BaseController{
	private static final long serialVersionUID = 3245717943018114302L;
	
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
		
		String episode_name_temp = paramMap.get("episode_name");
		String content_temp = paramMap.get("content");
		String author_comment_temp = paramMap.get("author_comment");

		String episode_name = episode_name_temp.trim();
		String content = content_temp.trim();
		String author_comment = author_comment_temp.trim();
	
		String tempEpisode_id = web.getString("episode_id");
		String tempBook_id = web.getString("book_id");
		String tempEpisode_Rent = web.getString("episode_rent");
		String tempEpisode_Buy = web.getString("episode_buy");
		
		int episdoe_id = Integer.parseInt(tempEpisode_id);
		int book_id = Integer.parseInt(tempBook_id);
		int episode_rent = Integer.parseInt(tempEpisode_Rent);
		int episode_buy = Integer.parseInt(tempEpisode_Buy);
		
		//전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("episode_title  -------> " + episode_name);
		logger.debug("content  -------------> " + content);
		logger.debug("author_comment  ------> " + author_comment);
		logger.debug("book_id  -------------> " + book_id);
		logger.debug("episdoe_id  ----------> " + episdoe_id);
		logger.debug("episode_rent  --------> " + episode_rent);
		logger.debug("episode_buy  ---------> " + episode_buy);
		
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
		
		if(!regex.isValue(tempEpisode_Rent)){
			sqlSession.close();
			web.redirect(null, "대여 가격을 입력해 주세요");
			return null;
		}
		
		if(!regex.isValue(tempEpisode_Buy)){
			sqlSession.close();
			web.redirect(null, "구매 가격을 입력해 주세요");
			return null;
		}
		
		/** 입력 받은 파라미터를 Beans로 묶기 */
		Episode param = new Episode();
		param.setBook_id(book_id);
		param.setAuthor_comment(author_comment);
		param.setContent(content);
		param.setEpisode_buy(episode_buy);
		param.setEpisode_name(episode_name);
		param.setEpisode_rent(episode_rent);
		param.setId(episdoe_id);
		
		logger.debug(param.toString());
		
		/** 게시물 변경을 위한 Service 기능을 호출 */
		try{
			episodeService.updateEpisodeItem(param);
			
		}catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		String delFile = paramMap.get("del_file");
		
		
		

		
		return null;
	}

}
