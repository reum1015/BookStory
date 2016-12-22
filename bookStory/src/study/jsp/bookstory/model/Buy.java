package study.jsp.bookstory.model;

public class Buy {

	private int id;						// 구매번호
	private String buy_day;			// 구입날짜
	private int buy_point;			// n개의 총구입가격
	private int allbuy_point;			// 책에 해당하는 전체 에피소드 가격
	private String reg_date;
	private int member_id;
	private int episode_id;
	private int book_id;
	private String episode_name;	
	
	// 페이지 구현을 위해서 추가된값
	private int limitStart;
	private int listCount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBuy_day() {
		return buy_day;
	}
	public void setBuy_day(String buy_day) {
		this.buy_day = buy_day;
	}
	public int getBuy_point() {
		return buy_point;
	}
	public void setBuy_point(int buy_point) {
		this.buy_point = buy_point;
	}
	public int getAllbuy_point() {
		return allbuy_point;
	}
	public void setAllbuy_point(int allbuy_point) {
		this.allbuy_point = allbuy_point;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getEpisode_name() {
		return episode_name;
	}
	public void setEpisode_name(String episode_name) {
		this.episode_name = episode_name;
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
		return "Buy [id=" + id + ", buy_day=" + buy_day + ", buy_point=" + buy_point + ", allbuy_point=" + allbuy_point
				+ ", reg_date=" + reg_date + ", member_id=" + member_id + ", episode_id=" + episode_id + ", book_id="
				+ book_id + ", episode_name=" + episode_name + ", limitStart=" + limitStart + ", listCount=" + listCount
				+ "]";
	}
	
	
}
