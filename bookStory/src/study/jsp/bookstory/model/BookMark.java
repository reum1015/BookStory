package study.jsp.bookstory.model;

public class BookMark {

	private int id; 	// 북마크 번호
	private int member_id;   // 회원번호
	private int episode_id;    // 회차번호
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getEpisode_id() {
		return episode_id;
	}
	public void setEpisode_id(int episode_id) {
		this.episode_id = episode_id;
	}
	@Override
	public String toString() {
		return "BookMark [id=" + id + ", member_id=" + member_id + ", episode_id=" + episode_id + "]";
	}
	
	
	
	
	

	
}
