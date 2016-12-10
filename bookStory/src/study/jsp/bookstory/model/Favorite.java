package study.jsp.bookstory.model;

public class Favorite {

	private int id;		// 선호작품 번호
	private int member_id;   //회원 번호
	private int book_id;   // 책 번호
	private String gender;   // 순위로 인한 성별
	private String birthdate; // 순위로 인한 생년월일
	private String book_author;
	private String book_name;
	
	
	// 페이지 구현을 위해서 추가된값
	private int limitStart;
	private int listCount;
	
	// 갤러리 구현을 위해서 추가된 값
	private boolean gallery;
	private String imagePath;
	
	
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
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
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
	public boolean isGallery() {
		return gallery;
	}
	public void setGallery(boolean gallery) {
		this.gallery = gallery;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "Favorite [id=" + id + ", member_id=" + member_id + ", book_id=" + book_id + ", gender=" + gender
				+ ", birthdate=" + birthdate + ", book_author=" + book_author + ", book_name=" + book_name
				+ ", limitStart=" + limitStart + ", listCount=" + listCount + ", gallery=" + gallery + ", imagePath="
				+ imagePath + "]";
	}
	
	

	
}
