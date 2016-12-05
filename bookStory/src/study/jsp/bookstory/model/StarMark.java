package study.jsp.bookstory.model;

public class StarMark {
	
	private int member_id;
	private int episode_id;
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
		return "StarMarked [member_id=" + member_id + ", episode_id=" + episode_id + "]";
	}
	
	

}
