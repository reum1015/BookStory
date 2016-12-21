package study.jsp.bookstory.controller.buyandrent;

import java.io.IOException;

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

@WebServlet("/book/totalRentBook.do")
public class TotalRentBook extends BaseController{
	private static final long serialVersionUID = 727751844468217704L;

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
				int totalEpisodeCount = web.getInt("totalEpisodeCount");		//작품의 총에피소드 권수
				int buyEpisodeCount = web.getInt("buyEpisodeCount");			//구매한 작품의 에피소드 권수
				
				Member member = (Member)web.getSession("loginInfo");
				//회원 포인트 저장 변수
				int memberPoint = 0;
				
				if(member != null){
					//회원 포인트 저장
					memberPoint = member.getPoint();
				}
				
				logger.debug("book_id ------------------------> " + book_id);
				logger.debug("totalEpisodeCount ---------------> " + totalEpisodeCount);
				logger.debug("memberPoint ---------------> " + memberPoint);
				logger.debug("buyEpisodeCount ---------------> " + buyEpisodeCount);
			
				//구매 테이블의 작품의 구매정보
				//작품의 에피소드 수와 구매한 에피소드의 수가 같으면 대여 불가(작품의 모든 에피소드를 구매중)
				if(totalEpisodeCount == buyEpisodeCount){
					web.redirect(null, "모든 작품이 구매중입니다.");
				}
				
				
				
				Book episodeForBuy = new Book();
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				String view = "booklist/totalRentBook";
				return view;
	}

}
