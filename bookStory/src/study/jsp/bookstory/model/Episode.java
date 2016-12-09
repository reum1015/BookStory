package study.jsp.bookstory.model;

public class Episode {
	
	private int id;											// 화번호
	private String episode_name;			// 화제목
	private int episode_order;					// 화 회차
	private int hit;										// 조회수
	private String content;						// 내용
	private String reg_date;						// 등록일자
	private String edit_date;						// 변경일자
	private String author_comment;		// 작가의 말
	private int episode_buy;						// 화구매 가격
	private int episode_rent;					// 화랜트 가격
	private int book_id;								// 책 번호
	private int total_starcount;				// 별점 총 회원수 
	private double total_star;					// 별점 평균
	
	//이미지 구현을 위해서 추가된 값
	private String imagePath;

	//페이지 구현을 위해서 추가된 값
	private int limitStart;
	private int listCount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEpisode_name() {
		return episode_name;
	}
	public void setEpisode_name(String episode_name) {
		this.episode_name = episode_name;
	}
	public int getEpisode_order() {
		return episode_order;
	}
	public void setEpisode_order(int episode_order) {
		this.episode_order = episode_order;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getAuthor_comment() {
		return author_comment;
	}
	public void setAuthor_comment(String author_comment) {
		this.author_comment = author_comment;
	}
	public int getEpisode_buy() {
		return episode_buy;
	}
	public void setEpisode_buy(int episode_buy) {
		this.episode_buy = episode_buy;
	}
	public int getEpisode_rent() {
		return episode_rent;
	}
	public void setEpisode_rent(int episode_rent) {
		this.episode_rent = episode_rent;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getTotal_starcount() {
		return total_starcount;
	}
	public void setTotal_starcount(int total_starcount) {
		this.total_starcount = total_starcount;
	}
	public double getTotal_star() {
		return total_star;
	}
	public void setTotal_star(double total_star) {
		this.total_star = total_star;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
		return "Episode [id=" + id + ", episode_name=" + episode_name + ", episode_order=" + episode_order + ", hit="
				+ hit + ", content=" + content + ", reg_date=" + reg_date + ", edit_date=" + edit_date
				+ ", author_comment=" + author_comment + ", episode_buy=" + episode_buy + ", episode_rent="
				+ episode_rent + ", book_id=" + book_id + ", total_starcount=" + total_starcount + ", total_star="
				+ total_star + ", imagePath=" + imagePath + ", limitStart=" + limitStart + ", listCount=" + listCount
				+ "]";
	}
	
	
	
	
	
}
