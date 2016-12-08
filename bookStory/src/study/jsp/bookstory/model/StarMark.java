package study.jsp.bookstory.model;

public class StarMark {
	
	private int member_id;
	private int episode_id;
	private int book_id;
	private int star_point;
	
	private double episode_star_avg;	//에피소드 별점 평균
	private double book_star_avg;		//작품 별점 평균
	private int star_count;				//에피소드 별점 등록 총 회원수
	
	
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
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getStar_point() {
		return star_point;
	}
	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}
	public double getEpisode_star_avg() {
		return episode_star_avg;
	}
	public void setEpisode_star_avg(double episode_star_avg) {
		this.episode_star_avg = episode_star_avg;
	}
	public double getBook_star_avg() {
		return book_star_avg;
	}
	public void setBook_star_avg(double book_star_avg) {
		this.book_star_avg = book_star_avg;
	}
	public int getStar_count() {
		return star_count;
	}
	public void setStar_count(int star_count) {
		this.star_count = star_count;
	}
	@Override
	public String toString() {
		return "StarMark [member_id=" + member_id + ", episode_id=" + episode_id + ", book_id=" + book_id
				+ ", star_point=" + star_point + ", episode_star_avg=" + episode_star_avg + ", book_star_avg="
				+ book_star_avg + ", star_count=" + star_count + "]";
	}
	
	
	
	
	

	
	

}
