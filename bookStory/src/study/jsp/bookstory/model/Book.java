package study.jsp.bookstory.model;

public class Book {
	
	private int id;										// 책번호
	private String book_name;				// 책이름
	private String book_author;			// 작가이름
	private String daily_date;				// 작품의 요일별 데이터
	private double totalstar_rate;		// 합별점
	private int total_hit;							// 합조회수
	private String intro;							// 책소개글
	private String genre;						// 장르
	private String reg_date;					// 등록일자
	private String edit_date;					// 변경일자
	private int total_point;					// 총가격
	private int rent_point;						// 총대여가격
	
	//이미지 구현을 위해서 추가된 값
	private String imagePath;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getDaily_date() {
		return daily_date;
	}

	public void setDaily_date(String daily_date) {
		this.daily_date = daily_date;
	}

	public double getTotalstar_rate() {
		return totalstar_rate;
	}

	public void setTotalstar_rate(double totalstar_rate) {
		this.totalstar_rate = totalstar_rate;
	}

	public int getTotal_hit() {
		return total_hit;
	}

	public void setTotal_hit(int total_hit) {
		this.total_hit = total_hit;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
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

	public int getTotal_point() {
		return total_point;
	}

	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}

	public int getRent_point() {
		return rent_point;
	}

	public void setRent_point(int rent_point) {
		this.rent_point = rent_point;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", book_name=" + book_name + ", book_author=" + book_author + ", daily_date="
				+ daily_date + ", totalstar_rate=" + totalstar_rate + ", total_hit=" + total_hit + ", intro=" + intro
				+ ", genre=" + genre + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", total_point="
				+ total_point + ", rent_point=" + rent_point + ", imagePath=" + imagePath + "]";
	}
	
	
	
	
}
