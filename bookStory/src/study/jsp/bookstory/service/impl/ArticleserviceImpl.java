package study.jsp.bookstory.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.Article;
import study.jsp.bookstory.service.ArticleService;

public class ArticleserviceImpl implements ArticleService {
	
	Logger logger;
	SqlSession sqlSession;
	
	public ArticleserviceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertArticle(Article article) throws Exception {
		try{
			int result = sqlSession.insert("ArticleMapper.insertArticle", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("저장된 게시물이 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 정보 등록에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public Article selectArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Article selectPrevArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Article selectNextArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateArticleHit(Article article) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Article> selectArticleList(Article article) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectArticleCount(Article article) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectArticleCountByMemberId(Article article) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectArticleCountByPw(Article article) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateArticleMemberOut(Article article) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
