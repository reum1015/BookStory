package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.Article;



public interface ArticleService {
	
	/**
	 * 게시물을 저장한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void insertArticle(Article article) throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다.
	 * @param document - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return BbsDocument - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public Article selectArticle(Article article) throws Exception;
	
	/**
	 * 현재글을 기준으로 이전글을 읽어들인다.
	 * @param document - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return BbsDocument - 읽어들인 게시물 내용 (없을경우 null
	 * @throws Exception
	 */
	public Article selectPrevArticle(Article article) throws Exception;
	
	/**
	 * 현재글을 기준으로 다음글을 읽어들인다.
	 * @param document - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return BbsDocument - 읽어들인 게시물 내용 없을경우 null
	 * @throws Exception
	 */
	public Article selectNextArticle(Article article) throws Exception;
	
	/**
	 * 조회수를 1 증가시킨다.
	 * @param document - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @throws Exception
	 */
	public void updateArticleHit(Article article) throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document - 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Article> selectArticleList(Article article) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleCount(Article article) throws Exception;
	
	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleCountByMemberId(Article article)throws Exception;
	
	/**
	 * 비밀번호를 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleCountByPw(Article article)throws Exception;
	
	/**
	 * 게시물을 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteArticle(Article article)throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void updateArticle(Article article)throws Exception;
	
	/**
	 * 회원과 게시물의 참조관계를 해제한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
    public void updateArticleMemberOut(Article article) throws Exception;


}
