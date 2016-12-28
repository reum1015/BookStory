package study.jsp.bookstory.controller;

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
import study.jsp.helper.CommonUtils;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;


public class Main extends BaseController{
	private static final long serialVersionUID = 3971889981166604106L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
	ImageFileService imageFileService;
	UploadHelper upload;
	CommonUtils commonUtils;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = "";
		view = "index";
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		commonUtils = CommonUtils.getInstance();
		
		// 관리자에게만 admin버튼 활성화
		String member_level = "AA";
		
		if(web.getSession("loginInfo") != null){
			Member LoginInfo = (Member) web.getSession("loginInfo");
			member_level = LoginInfo.getMember_level();
		}
		
		//메인 케러셀용 작품 리스트(랜덤 3개)
		List<Book> carouselList = new ArrayList<>();
		
		//메인 장르별 추천작 4개
		List<Book> mainGenrelList = new ArrayList<>();
		
		int randomNumber = commonUtils.random(0, 4);
		
		String[] genreList = {"Romance","SF&Fantasy","Heroism","Mystery","Fusion"};
		String selectGenre = genreList[randomNumber];
		
		
		//메인 장블별 추천작 장르 파라미터 셋팅
		Book book = new Book();
		book.setGenre(selectGenre);
		
		//메인 남여별 인기작(여성)
		List<Book> femaleList = new ArrayList<>();
		
		//메인 남여별 인기작(남성)
		List<Book> maleList = new ArrayList<>();
		
		try{
			
			//메인 케러셀용 작품 리스트(랜덤 3개)
			carouselList = bookService.selectMainCarouselByRandomThree();
			
			//메인 장르별 추천작 4개
			mainGenrelList = bookService.selectListMainByGenre(book);
			
			//메인 남여별 인기작(여성)
			femaleList = bookService.selectListForMainByGenderFemale(null);
			
			//메인 남여별 인기작(남성)
			maleList =  bookService.selectListForMainByGenderMale(null);
			
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
		}finally {
			sqlSession.close();
		}
		
		logger.debug("mainGenrelList -------> " + mainGenrelList.toString());
		
		//메인 장르별 추천작 텍스트 변환(ex.. MON --> 월요일, Romance --> 로맨스)
		if(mainGenrelList != null){
		
			Book temp = new Book();
			
			for(int i = 0 ; i < mainGenrelList.size(); i++){
				temp = mainGenrelList.get(i);
				
				String tempDay = temp.getDaily_date();
				String tempGenre = temp.getGenre();
				
				String day = commonUtils.genreOrDayConverter(tempDay);
				String genre = commonUtils.genreOrDayConverter(tempGenre);
				
				temp.setDaily_date(day);
				temp.setGenre(genre);
			}
			
		}
		
		//메인 캐러셀 텍스트 변환(ex.. MON --> 월요일, Romance --> 로맨스)
				if(carouselList != null){
					Book temp = new Book();
					
					for(int i = 0 ; i < carouselList.size(); i++){
						temp = carouselList.get(i);
						
						String tempDay = temp.getDaily_date();
						String tempGenre = temp.getGenre();
						String imagePath = temp.getImagePath();
						
						if(imagePath != null){
							String thumbPath = upload.createThumbnail(imagePath, 1160, 413, false);
							temp.setImagePath(thumbPath);
							logger.debug("thumbnail create ---------> " + temp.getImagePath());
						}
						
						String day = commonUtils.genreOrDayConverter(tempDay);
						String genre = commonUtils.genreOrDayConverter(tempGenre);
						
						temp.setDaily_date(day);
						temp.setGenre(genre);
					}
					
				}
				
				//메인 남 여 인기작 이미지 썸네일로 교체
				if(femaleList != null){
					for(int i = 0; i < femaleList.size(); i++){
						Book bookItem  = femaleList.get(i);
						String imagePath = bookItem.getImagePath();
						if(imagePath != null){
							String thumbPath = upload.createThumbnail(imagePath, 248, 240, true);
							bookItem.setImagePath(thumbPath);
							logger.debug("thumbnail create ---------> " + bookItem.getImagePath());
						}
					}
				}		
				
				if(maleList != null){
					for(int i = 0; i < maleList.size(); i++){
						Book bookItem  = maleList.get(i);
						String imagePath = bookItem.getImagePath();
						if(imagePath != null){
							String thumbPath = upload.createThumbnail(imagePath, 248, 240, true);
							bookItem.setImagePath(thumbPath);
							logger.debug("thumbnail create ---------> " + bookItem.getImagePath());
						}
					}
				}		
				
		request.setAttribute("member_level", member_level);
		request.setAttribute("selectGenre", selectGenre);
		request.setAttribute("mainGenrelList", mainGenrelList);
		request.setAttribute("carouselList", carouselList);
		
		request.setAttribute("femaleList", femaleList);
		request.setAttribute("maleList", maleList);
		
		return view;
	}


}
