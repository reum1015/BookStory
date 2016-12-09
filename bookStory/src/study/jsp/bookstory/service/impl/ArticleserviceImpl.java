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
		Article result = null;
		try{
			result = sqlSession.selectOne("ArticleMapper.selectArticle", article);
			if(result==null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			throw new Exception("조회된 게시물이 없습니다.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Article selectPrevArticle(Article article) throws Exception {
		Article result = null;
		try{
			// 이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectPrevArticle", article);
			
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Article selectNextArticle(Article article) throws Exception {
		Article result = null;
		try{
			// 다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectNextArticle", article);
			
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateArticleHit(Article article) throws Exception {
		try{
			int result = sqlSession.update("ArticleMapper.updateArticleHit", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("조회수 갱신에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public List<Article> selectArticleList(Article article) throws Exception {
		List<Article> result = null;
		try{
			result = sqlSession.selectList("ArticleMapper.selectArticleList", article);
			if(result==null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			throw new Exception("조회된 글 목록이 없습니다.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 목록 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectArticleCount(Article article) throws Exception {
        int result = 0;
		
		try{
			// 게시물 수가 0건이 ㄴ경우도 있으므로,
			// 결과값이 0인경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectArticleCount", article);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectArticleCountByMemberId(Article article) throws Exception {
        int result = 0;
		
		try{
			// 자신의 게시물이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectArticleCountByMemberId", article);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectArticleCountByPw(Article article) throws Exception {
        int result = 0;
		
		try{
			result = sqlSession.selectOne("ArticleMapper.selectArticleCountByPw", article);
			// 비밀번호가 일치하는 데이터의 수가 0이라면 비밀번호가 잘못된 것으로 간주한다.
			if(result < 1){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호를 확인하세요.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteArticle(Article article) throws Exception {
		try{
			int result = sqlSession.delete("ArticleMapper.deleteArticle", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("귀하의 게시물이 아닙니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public void updateArticle(Article article) throws Exception {
		try{
			int result = sqlSession.update("ArticleMapper.updateArticle", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수정에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public void updateArticleMemberOut(Article article) throws Exception {
		try{
			// 게시글을 작성한 적이 없는 회원도 있을 수 있기 때문에,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.update("ArticleMapper.updateArticleMemberOut", article);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("참조관계 해제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public int selectMemberReport(Article article) throws Exception {
		int result = 0;
		
		try{
			// 자신의 게시물이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectMemberReport", article);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("자신의 게시물의 조회에 실패했습니다.");
		}
		return result;
	}

}
