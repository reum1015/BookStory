package study.jsp.bookstory.model;

public class Comment {

	private int id;						// 댓글 번호
	private String content;			// 댓글 내용
	private String reg_date;		// 작성 일자
	private String edit_date;		// 변경 일자
	private String ip_address;		// 아이피 주소
	private int reported;			// 신고 상태 유무
	private int blind;					// 블라인드 처리
	private int member_id;
	private int article_id;
	private int episode_id;
	private String user_nickname;
	
	
	public int getEpisode_id() {
		return episode_id;
	}
	public void setEpisode_id(int episode_id) {
		this.episode_id = episode_id;
	}
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
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", reg_date=" + reg_date + ", edit_date=" + edit_date
				+ ", ip_address=" + ip_address + ", reported=" + reported + ", blind=" + blind + ", member_id="
				+ member_id + ", article_id=" + article_id + ", episode_id=" + episode_id + ", user_nickname="
				+ user_nickname + "]";
	}
	
	
	
}
