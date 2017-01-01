package study.jsp.bookstory.model;

public class Book {
	
	private int id;										// 책번호
	private String book_name;				// 책이름
	private String book_author;			// 작가이름
	private String daily_date;				// 작품의 요일별 데이터
	private int total_hit;							// 합 조회수
	private String intro;							// 책 소개글
	private String genre;						// 장르
	private String reg_date;					// 등록일자
	private String edit_date;					// 변경일자
	private int total_point;					// 총가격
	private int rent_point;						// 총대여가격
	private double total_star;					// 별점 평균
	private int total_favorite;					// 총 관심등록 
	private String book_end;						// 작품 완결 여부
	private String totalEpisodeCount;
	private String order;
	
	
	
	//이미지 구현을 위해서 추가된 값
	private String imagePath;
	private String imagePathCarousel;
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
	public double getTotal_star() {
		return total_star;
	}
	public void setTotal_star(double total_star) {
		this.total_star = total_star;
	}
	public int getTotal_favorite() {
		return total_favorite;
	}
	public void setTotal_favorite(int total_favorite) {
		this.total_favorite = total_favorite;
	}
	public String getBook_end() {
		return book_end;
	}
	public void setBook_end(String book_end) {
		this.book_end = book_end;
	}
	public String getTotalEpisodeCount() {
		return totalEpisodeCount;
	}
	public void setTotalEpisodeCount(String totalEpisodeCount) {
		this.totalEpisodeCount = totalEpisodeCount;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImagePathCarousel() {
		return imagePathCarousel;
	}
	public void setImagePathCarousel(String imagePathCarousel) {
		this.imagePathCarousel = imagePathCarousel;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", book_name=" + book_name + ", book_author=" + book_author + ", daily_date="
				+ daily_date + ", total_hit=" + total_hit + ", intro=" + intro + ", genre=" + genre + ", reg_date="
				+ reg_date + ", edit_date=" + edit_date + ", total_point=" + total_point + ", rent_point=" + rent_point
				+ ", total_star=" + total_star + ", total_favorite=" + total_favorite + ", book_end=" + book_end
				+ ", totalEpisodeCount=" + totalEpisodeCount + ", order=" + order + ", imagePath=" + imagePath
				+ ", imagePathCarousel=" + imagePathCarousel + "]";
	}
	
	
	
	
	
	


	

}
