package study.jsp.bookstory.model;

public class Report {

	private String reg_date;
	private String blind;
	private int member_id;
	private int target_member_id;
	private String report_subject;
	private String report_content;
	private int article_id;
	private int comment_id;

	// 페이지 구현을 위해서 추가된 값
	private int limitStart;
	private int listCount;

	// nick_name을 가져오기위한 가상 컬럼
	String nick_name;
	String user_nickname;

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getBlind() {
		return blind;
	}

	public void setBlind(String blind) {
		this.blind = blind;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getTarget_member_id() {
		return target_member_id;
	}

	public void setTarget_member_id(int target_member_id) {
		this.target_member_id = target_member_id;
	}

	public String getReport_subject() {
		return report_subject;
	}

	public void setReport_subject(String report_subject) {
		this.report_subject = report_subject;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "Report [reg_date=" + reg_date + ", blind=" + blind + ", member_id=" + member_id + ", target_member_id="
				+ target_member_id + ", report_subject=" + report_subject + ", report_content=" + report_content
				+ ", article_id=" + article_id + ", comment_id=" + comment_id + ", limitStart=" + limitStart
				+ ", listCount=" + listCount + ", nick_name=" + nick_name + ", user_nickname=" + user_nickname + "]";
	}

}
