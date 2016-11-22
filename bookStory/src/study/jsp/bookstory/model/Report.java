package study.jsp.bookstory.model;

public class Report {

	int id;							// 신고번호
	String reg_date;			// 신고당한 날짜
	int target_memberid;		// 신고당한 회원id
	int blind;						// 블라인드 처리 유무
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getTarget_memberid() {
		return target_memberid;
	}
	public void setTarget_memberid(int target_memberid) {
		this.target_memberid = target_memberid;
	}
	public int getBlind() {
		return blind;
	}
	public void setBlind(int blind) {
		this.blind = blind;
	}
	
	@Override
	public String toString() {
		return "Report [id=" + id + ", reg_date=" + reg_date + ", target_memberid=" + target_memberid + ", blind="
				+ blind + "]";
	}
	
}
