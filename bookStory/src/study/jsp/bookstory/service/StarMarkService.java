package study.jsp.bookstory.service;

import study.jsp.bookstory.model.StarMark;

public interface StarMarkService {
	
	/**
	 * 별첨 추가
	 * @param star
	 * @throws Exception
	 */
	public void insertAddStar(StarMark star)throws Exception;

}
