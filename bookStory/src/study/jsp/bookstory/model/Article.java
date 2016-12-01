package study.jsp.bookstory.model;

public class Article {

	private int id;					// 게시글 번호
	private String category;	// 카테고리(공지)
	private String subject;		// 글제목
	private String content;			// 글내용
	private int hit;				// 조회수
	private String reg_date;	// 작성일자
	private String edit_date;	// 수정일자
	private String ip_address;	// 아이피 주소
	private int reported;		// 신고상태 유무
	private int member_id;
	
	// 페이지 구현을 위해서 추가된 값
	private int limit_start;
	private int list_count;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	public int getReported() {
		return reported;
	}
	public void setReported(int reported) {
		this.reported = reported;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getLimit_start() {
		return limit_start;
	}
	public void setLimit_start(int limit_start) {
		this.limit_start = limit_start;
	}
	public int getList_count() {
		return list_count;
	}
	public void setList_count(int list_count) {
		this.list_count = list_count;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", category=" + category + ", subject=" + subject + ", content=" + content
				+ ", hit=" + hit + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", ip_address=" + ip_address
				+ ", reported=" + reported + ", member_id=" + member_id + ", limit_start=" + limit_start
				+ ", list_count=" + list_count + "]";
	}
	
	
	
	
	
}
