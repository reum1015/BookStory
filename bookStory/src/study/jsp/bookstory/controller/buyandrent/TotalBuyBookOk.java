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
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.service.BookMarkService;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.BuyService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.impl.BookMarkServiceImpl;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.BuyServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/book/totalBuyBookOk.do")
public class TotalBuyBookOk extends BaseController{
	private static final long serialVersionUID = -7082662247073200513L;

	/** (1)사용하고자 하는 Helper + Serive 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookMarkService bookmarkService;
	BookService bookService;
	EpisodeService episodeService;
	MemberService memberService;
	BuyService buyService;
	
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
		buyService = new BuyServiceImpl(sqlSession, logger);
		
		int book_id = web.getInt("book_id");
		int memberPoint = web.getInt("memberPoint");
		int totalBuyPointFromBook = web.getInt("totalBuyPointFromBook");
		
		logger.debug("book_id -----------> " + book_id);
		logger.debug("memberPoint -----------> " + memberPoint);
		logger.debug("totalBuyPointFromBook -----------> " + totalBuyPointFromBook);
		
		Member memberInfo = (Member)web.getSession("loginInfo");
		
		int member_id= 0;
		
		if(memberInfo != null){
			member_id = memberInfo.getId();
		}
		
		logger.debug("member_id -----------------> " + member_id);
		
		
		List<Buy> buyList = new ArrayList<>();
		
		//에피소드에게 넘겨줄 작품번호 셋팅(book_id에관한 전체 에피소드)
		Episode episode = new Episode();
		episode.setBook_id(book_id);
		 
		List<Episode> allEpisodeInfo = new ArrayList<>();

		try{
		//작품의 모든 에피소드 정보 가져오기
		allEpisodeInfo = episodeService.selectEpisdoeListByBookForBuy(episode);
		
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
		
		buyService.insertEpisodeAllBuy(map);
		
		//회원의 포인트 차감
		int memPoint = memberPoint - totalBuyPointFromBook;
		
		Member mem = new Member();
		mem.setId(member_id);
		mem.setPoint(memPoint);
		
		//회원 포인트 갱신
		memberService.updateMyPointByBuyBook(mem);
	}catch(Exception e){
		web.redirect(null, e.getLocalizedMessage());
		return null;
	}finally{
		sqlSession.close();
	}
		/** (11) 저장 완료 후 읽기 페이지로 이동하기  */

		web.redirect(web.getRootPath() + "/booklist/book_list.do?book_id=" + book_id, "모든 작품이 구매 완료 되었습니다.");
		
		return null;
	}

}
