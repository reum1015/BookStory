package study.jsp.bookstory.controller.buyandrent;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.converters.IntegerArrayConverter;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.Buy;
import study.jsp.bookstory.model.Episode;
import study.jsp.bookstory.model.Member;
import study.jsp.bookstory.model.Rent;
import study.jsp.bookstory.service.BookMarkService;
import study.jsp.bookstory.service.BookService;
import study.jsp.bookstory.service.BuyService;
import study.jsp.bookstory.service.EpisodeService;
import study.jsp.bookstory.service.MemberService;
import study.jsp.bookstory.service.RentService;
import study.jsp.bookstory.service.impl.BookMarkServiceImpl;
import study.jsp.bookstory.service.impl.BookServiceImpl;
import study.jsp.bookstory.service.impl.BuyServiceImpl;
import study.jsp.bookstory.service.impl.EpisodeServiceImpl;
import study.jsp.bookstory.service.impl.MemberServiceImpl;
import study.jsp.bookstory.service.impl.RentServiceImpl;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/buyandrent/rentEpisode.do")
public class RentEpisode extends BaseController {
	private static final long serialVersionUID = 8657252824775400694L;

	/** (1)사용하고자 하는 Helper + Serive 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookMarkService bookmarkService;
	BookService bookService;
	EpisodeService episodeService;
	MemberService memberService;
	RentService rentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// --> import org.apache.logging.log4j.LogManager;
		response.setContentType("application/json");

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		episodeService = new EpisodeServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(sqlSession, logger);
		rentService = new RentServiceImpl(sqlSession, logger);

		// 파라미터 받기
		int book_id = web.getInt("book_id"); // 작품 번호
		int member_id = web.getInt("member_id"); // 회원 번호
		String[] buyItem = web.getStringArray("total[]"); // 구매할 에피소드 아이디(배열)

		logger.debug("member_id ----------------->" + member_id);
		logger.debug("book_id ----------------->" + book_id);
		logger.debug("buyItem --------------------->" + Arrays.toString(buyItem));

		// 회원의 현재 포인트 조회
		Member member = new Member();
		member.setId(member_id);
		
		// 회원 포인트 저장 변수
		int memberPoint = 0;
		
		
		try{
			memberPoint = memberService.selectMyPointByMemberId(member);
			logger.debug("memberPoint -------------------------> " + memberPoint);
		}catch (Exception e) {
			// TODO: handle exception
			web.printJsonRt(e.getLocalizedMessage());
			sqlSession.close();
			return null;
		}
		/** 회원이 선택한 에피소드의 총 가격 조회 */
		// 받은 파라미터 int로 변환
		int[] rentEpisodeItem = null;
		if (buyItem != null) {
			rentEpisodeItem = (int[]) new IntegerArrayConverter().convert(null, buyItem);
			logger.debug("String ---> int : rentEpisodeItem ------->" + Arrays.toString(rentEpisodeItem));
		}
		
		// 파라미터 셋팅
		Map hm = new HashMap<>();
		int episodeRentPrice = 0;
		hm.put("buyEpisodeItem", rentEpisodeItem);
		/** 회원이 선택한 에피소드의 총 대여 가격 조회 */

		/** 각 에피소드의 대여 가격 조회 */
			//선택한 에피소드 리스트에 담기(파라미터 용)
		List<Integer> episodeId = new ArrayList<>();
		for (int i = 0; i > rentEpisodeItem.length; i++) {
			int id = rentEpisodeItem[i];

			episodeId.add(id);
		}
		
		
		List<Rent> endEpisodeList = new ArrayList<>(); //회원이 대여한 에피소드 남은시간 저장 변수

		/** 각 에피소드의 대여 가격 조회 */
		try{
			episodeRentPrice = episodeService.selectTotalRentPointByEpisodeIds(hm);
			logger.debug("episodeRentPrice  -------------> " + episodeRentPrice);
			if(episodeRentPrice > memberPoint){
				web.printJsonRt("포인트가 부족합니다. 충전해 주세요");
				return null;
			}
			
			//각 에피소드의 가격과 id조회
			List<Episode> priceList = null;
			
			priceList = episodeService.selectEachRentPointByEpisodeIds(hm);
			logger.debug("priceList --------> " + priceList);
		
			//구매한 책 등록(Buy테이블에 INSERT)
			//작품 정보여러건을 Map에 담아서 파라미터로 전달
				//각 에피소드 정보 Buy테이블에 저장
			List<Rent> rentList = new ArrayList<>();
				if(priceList != null){
				
					for(int i = 0 ; i < priceList.size(); i++){
						Rent buyItems = new Rent();
						Episode item = new Episode();
						
						//에피소드 하나에서
						item = priceList.get(i);
						
						//에피소드 id와 에피소드 한회의 구매 비용 추출
						int episode_id = item.getId();
						int episode_rent = item.getEpisode_rent();
						
						
						//buy테이블에 insert 할 값들
						buyItems.setMember_id(member_id);
						buyItems.setEpisode_id(episode_id);
						buyItems.setRent_point(episode_rent);
						buyItems.setBook_id(book_id);
						
						rentList.add(buyItems);
					}//end For
				}//end if
			
				logger.debug("rentList -------------> " + rentList.toString());
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", rentList);
				
				//rent테이블에 등록
				rentService.insertEpisodeAllRent(map);
				
				//차감된 회원 포인트 업데이트
				Member mem = new Member();
				mem.setId(member_id);
				mem.setPoint(memberPoint-episodeRentPrice);
				memberService.updateMyPointByBuyBook(mem);
				
				//회원 세션 갱신
				Member newSession = memberService.selectLoginInfoSessionUp(mem);
				web.removeSession("loginInfo");
				
				web.setSession("loginInfo", newSession);
				logger.debug("세션 갱신");
				
				//남은 구매시간 가져오기
				endEpisodeList = rentService.selectEndRentTerm(hm);
				
				
				logger.debug("endEpisodeList -------------------> " + endEpisodeList);
				
				
				
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("endEpisodeList",endEpisodeList);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}
