package study.jsp.bookstory.service;

import java.util.List;

import study.jsp.bookstory.model.ImageFile;

public interface ImageFileService {

	/**
	 * 작품 이미지 정보 등록
	 * @param file - 파일 데이터
	 * @throws Exception
	 */
	public void insertBookFile(ImageFile file)throws Exception;
	
	
	
	/**
	 * 에피소드 이미지 정보 등록
	 * @param file - 파일 데이터
	 * @throws Exception
	 */
	public void insertEpisodeFile(ImageFile file)throws Exception;
	
	/**
	 * 작품 메인 이미지 조회
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public List<ImageFile> selectBookMainImage(ImageFile file)throws Exception;
	
	/**
	 * 하나의 파일 조회(에피소드)
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public ImageFile selectEpisodeFile(ImageFile file)throws Exception;
	
	/**
	 * 하나의 파일 삭제 에피소드
	 * @param file
	 * @throws Exception
	 */
	public void deleteEpisodeFile(ImageFile file)throws Exception;
	
	/**
	 * 하나의 파일 조회(작품)
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public ImageFile selectBookFile(ImageFile file)throws Exception;
	
	/**
	 * 하나의 파일 삭제 작품
	 * @param file
	 * @throws Exception
	 */
	public void deleteBookFile(ImageFile file)throws Exception;
	
	
	
	
}

	
