package study.jsp.bookstory.controller.buyandrent;

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

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Book;
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookMarkService;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.BookMarkServiceImpl;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/book/totalBuyBook.do")
public class TotalBuyBook extends BaseController{
	private static final long serialVersionUID = 5439488949380495937L;

	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookMarkService bookmarkService;
	BookService bookService;
	EpisodeService episodeService;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
				
		web = WebHelper.getInstance(request, response);
				
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);	
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		int book_id = web.getInt("book_id");
		
		Member member = (Member)web.getSession("loginInfo");
		
		int member_id = 0;
		//회원 포인트 저장 변수
		int memberPoint = 0;
		
		if(member != null){
			member_id = member.getId();
			//회원 포인트 저장
			memberPoint = member.getPoint();
		}
		
		//작품의 포인트와 회원의 포인트 조회를 위한 파라미터 셋팅
		Book book = new Book();
		book.setId(book_id);
				
		//작품의 포인트 저장할 변수(총 구매포인트, 총 렌트포인트 두개 불러옴)
		Book bookPoint = new Book();
		
		
		//회원이 모든 에피소드 구매가능한지 저장 변수
		boolean isBuyAllBook;
		
		
		//구매 가능하다면 작품의 모든 에피소드 정보 가져올 변수
		List<Episode> allEpisodeInfo = new ArrayList<>();
		
		//에피소드에게 넘겨줄 작품번호 셋팅
		Episode episode = new Episode();
		episode.setBook_id(book_id);
		
		try{
						
			//작품의 총 포인트와 렌트 포인트 조회()
			bookPoint = bookService.selectTotalPointFromBook(book);
			
			//작품의 총 구매 포인트만 추출
			int totalBuyPointFromBook = bookPoint.getTotal_point();
			
			//회원이 작품의 모든 에피소를 구매 하능한지 확인여부
			isBuyAllBook = memberPoint < totalBuyPointFromBook;
			
			//회원의 포인트가 작품의 모든 에피소드 총 합의 포인트보다 적다면
			if(isBuyAllBook){
				web.redirect(null, "포인트가 부족합니다.포인트를 충전해 주세요");
				return null;
			}else{
				
				List<Buy> buyList = new ArrayList<>();
				
				//회원 모든 작품을 구매 가능 하다면
				//작품의 모든 에피소드 정보 가져오기
				allEpisodeInfo = episodeService.selectEpisdoeListAllByBook(episode);
				
					if(allEpisodeInfo != null){
						for(int i = 0 ; i<allEpisodeInfo.size();i++){
						
							Buy buyItem = new Buy();
							Episode item = new Episode();
							
							//에피소드 하나에서
							item = allEpisodeInfo.get(i);
							
							//에피소드 id와 에피소드 한회의 구매 비용 추출
							int epiosde_id = item.getId();
							int episode_buy = item.getEpisode_buy();
							
							//buy테이블에 insert 할 값들
							buyItem.setMember_id(member_id);
							buyItem.setEpisode_id(epiosde_id);
							buyItem.setBuy_point(episode_buy);
							
							buyList.add(buyItem);
						}//end For
					}//end if
				
				//buy 테이블에 등록
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", buyList);
				
				//회원의 포인트 차감
				int memPoint = memberPoint - totalBuyPointFromBook;
				
				Member mem = new Member();
				mem.setId(member_id);
				mem.setPoint(memPoint);
				
				//회원 포인트 갱신
				memberService.updateMyPointByBuyBook(member);
			}
		
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		return "booklist/totalBuyBook";
	}

}
