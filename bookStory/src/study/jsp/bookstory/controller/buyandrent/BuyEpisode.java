package study.jsp.bookstory.controller.buyandrent;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
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

@WebServlet("/buyandrent/buyEpisode.do")
public class BuyEpisode extends BaseController{
	private static final long serialVersionUID = 1073609117458949692L;

	
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
		response.setContentType("application/json");
		
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

		String[] abc;
		abc = web.getStringArray("total[]");
		
		String[ ] arr;
		
		arr=request.getParameterValues("arr[]");
		
		
		if(abc != null){
			for(int i =0; i<abc.length;i++){
				System.out.println(abc[i]);
			}
		}
		
		
		
		logger.debug("book_id ----------------->" + book_id);
		logger.debug("abc --------------------->" + abc);
		logger.debug("arr --------------------->" + arr);
		
		
		
	
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");


		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}

}
