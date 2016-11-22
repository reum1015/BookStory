package study.jsp.bookstory.model;

public class Buy {

	private int id;						// 구매번호
	private String buy_day;			// 구입날짜
	private int buy_point;			// n개의 총구입가격
	private int allbuy_point;			// 책에 해당하는 전체 에피소드 가격
	
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
	
	@Override
	public String toString() {
		return "Buy [id=" + id + ", buy_day=" + buy_day + ", buy_point=" + buy_point + ", allbuy_point=" + allbuy_point
				+ "]";
	}
	
}
