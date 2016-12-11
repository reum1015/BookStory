package study.jsp.bookstory.dao.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.dao.MybatisConnectionFactory;
import study.jsp.bookstory.model.StarMark;
import study.jsp.bookstory.service.StarMarkService;
import study.jsp.bookstory.service.impl.StarMarkServiceImpl;
import study.jsp.helper.BaseController;


public class StarmarkTest{



	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger(StarmarkTest.class.getName());
		
		StarMarkService test = new StarMarkServiceImpl(sqlSession, logger);
		
		
		StarMark s = new StarMark();
		
		s.setEpisode_id(2);
		
		
		StarMark s1 = new StarMark();
		s1.setBook_id(2);
		
		double aa= 0;
		int bb = 0;
		double cc=0;
		
		try {

			
			cc= test.selectStarAvgBook(s1);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(aa);
		System.out.println(bb);
		System.out.println(cc);
		
		
	}




}
