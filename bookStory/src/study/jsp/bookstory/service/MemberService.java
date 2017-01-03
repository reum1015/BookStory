package study.jsp.bookstory.service;

import study.jsp.bookstory.model.Member;

public interface MemberService {
	/**
	 * 아이디 중복검사
	 * @param member - 아이디
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public int selectUserIdCount(Member member)throws Exception;
	
	/**
	 * 이메일 중복검사
	 * @param member - 이메일
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectEmailCount(Member member)throws Exception;
	
	/**
	 * 이메일 중복검사
	 * @param member - 이메일
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectNickNameCount(Member member)throws Exception;
	
	/**
	 * 회원가입(아이디, 이메일 중복검사 후 가입처리)
	 * @param member - 일련번호, 가입일시, 변경일시를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertMember(Member member)throws Exception;
	
	/**
	 * 로그인
	 * @param member- 아이디 비밀번호
	 * @return 회원정보
	 * @throws Exception
	 */
	public Member selectLoginInfo(Member member) throws Exception;
	
	
	/**
	 * 새로운 세션 정보 가져오기
	 * @param member- id
	 * @return 회원정보
	 * @throws Exception
	 */
	public Member selectLoginInfoSessionUp(Member member) throws Exception;
	/**
	 * 비밀번호 변경
	 * @param member - 이메일 주소, 비밀번호
	 * @throws Exception
	 */
	public void updateMemberPasswordByEmail(Member member) throws Exception;
	
	/**
	 * 비밀번호 검사
	 * @param member
	 * @throws Exception
	 */
	public void selectMemberPasswordCount(Member member) throws Exception;
	
	/**
	 * 회원탈퇴
	 * @param member - 회원번호, 비밀번호
	 * @throws Exception
	 */
	public void deleteMember(Member member)throws Exception;
	
	
	/**
	 * 회원정보 수정
	 * @param member
	 * @throws Exception
	 */
	public void updateMember(Member member)throws Exception;
	
	/**
	 * 일련번호에 의한 회원정보 조회
	 * @param member
	 * @throws Exception
	 */
	public Member selectMember(Member member)throws Exception;
	
	/**
	 * 회원의 현재 보유중인 포인트 조회
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public int selectMyPointByMemberId(Member member)throws Exception;
	
	/**
	 * 회원의 포인트 정보 갱신
	 * @param member
	 * @throws Exception
	 */
	public void updateMyPointByBuyBook(Member member)throws Exception;
	
	/**
	 * 회원의 포인트 충전 
	 * @param member
	 * @throws Exception
	 */
	public void updateMyPointByMemberId(Member member)throws Exception;	

	
	/**
	 * 회원의 포인트  환불
	 * @param member
	 * @return 
	 * @throws Exception
	 */
	public void deleteMyPointByMemberId(Member member)throws Exception;	
	
	
	/**
	 * 회원 아이디 찾기
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public Member selectMemberIdByNameAndEmail(Member member)throws Exception;
}
