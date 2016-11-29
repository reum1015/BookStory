package study.jsp.bookstory.service;

import study.jsp.bookstory.model.ImageFile;

public interface ImageFileService {

	/**
	 * 파일 정보를 저장한다
	 * @param file - 파일 데이터
	 * @throws Exception
	 */
	public void insertBookFile(ImageFile file)throws Exception;
}
