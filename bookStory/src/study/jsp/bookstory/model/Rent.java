package study.jsp.bookstory.model;

public class Rent {

	private int id;						// 대여번호
	private String rent_day;			// 대여날짜
	private String rent_outday;		// 대여끝나는 날짜
	private int rent_point;			// n개의 총 대여가격
	private int allrent_point;		// 책대여가격
	private int member_id;
	private int episode_id;	
	private String episode_name;	
	private int book_id;
	private String rent_term;		//남은 대여 기간
	
	// 페이지 구현을 위해서 추가된값
	private int limitStart;
	private int listCount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRent_day() {
		return rent_day;
	}
	public void setRent_day(String rent_day) {
		this.rent_day = rent_day;
	}
	public String getRent_outday() {
		return rent_outday;
	}
	public void setRent_outday(String rent_outday) {
		this.rent_outday = rent_outday;
	}
	public int getRent_point() {
		return rent_point;
	}
	public void setRent_point(int rent_point) {
		this.rent_point = rent_point;
	}
	public int getAllrent_point() {
		return allrent_point;
	}
	public void setAllrent_point(int allrent_point) {
		this.allrent_point = allrent_point;
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
	public String getEpisode_name() {
		return episode_name;
	}
	public void setEpisode_name(String episode_name) {
		this.episode_name = episode_name;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getRent_term() {
		return rent_term;
	}
	public void setRent_term(String rent_term) {
		this.rent_term = rent_term;
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
		return "Rent [id=" + id + ", rent_day=" + rent_day + ", rent_outday=" + rent_outday + ", rent_point="
				+ rent_point + ", allrent_point=" + allrent_point + ", member_id=" + member_id + ", episode_id="
				+ episode_id + ", episode_name=" + episode_name + ", book_id=" + book_id + ", rent_term=" + rent_term
				+ ", limitStart=" + limitStart + ", listCount=" + listCount + "]";
	}
	
	
	
	
	
	}
