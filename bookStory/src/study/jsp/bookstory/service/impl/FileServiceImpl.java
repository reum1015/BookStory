package study.jsp.bookstory.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.bookstory.model.File;
import study.jsp.bookstory.service.FileService;

public class FileServiceImpl implements FileService{

	/** 처리 결과를 위한 Log4J객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public FileServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	
	/**
	 * 북 이미지 한개저장
	 * 캐러셀, 메인 각각 호출
	 */
	@Override
	public void insertBookFile(File file) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlSession.insert("FileMapper.insertBookFile",file);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 파일 정보가 없습니다.");
		}catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일정보 등록에 실패 했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

}
