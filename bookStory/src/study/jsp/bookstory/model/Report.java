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
	
	@Override
	public String toString() {
		return "Report [reg_date=" + reg_date + ", blind=" + blind + ", member_id=" + member_id + ", target_member_id="
				+ target_member_id + ", report_subject=" + report_subject + ", report_content=" + report_content
				+ ", article_id=" + article_id + ", comment_id=" + comment_id + "]";
	}
	
}
