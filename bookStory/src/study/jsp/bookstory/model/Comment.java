package study.jsp.bookstory.model;

public class Comment {

	private int id;						// 댓글 번호
	private String content;			// 댓글 내용
	private String reg_date;		// 작성 일자
	private String edit_date;		// 변경 일자
	private String ip_address;		// 아이피 주소
	private int reported;			// 신고 상태 유무
	private int blind;					// 블라인드 처리
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getBlind() {
		return blind;
	}
	public void setBlind(int blind) {
		this.blind = blind;
	}
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", reg_date=" + reg_date + ", edit_date=" + edit_date
				+ ", ip_address=" + ip_address + ", reported=" + reported + ", blind=" + blind + "]";
	}
	
}
