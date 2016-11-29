package study.jsp.bookstory.model;

public class Favorite {

	private int id;		// 선호작품 번호
	private int member_id;   //회원 번호
	private int book_id;   // 책 번호
	private String gender;   // 순위로 인한 성별
	private String birthdate; // 순위로 인한 생년월일
	
	
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
	@Override
	public String toString() {
		return "Favorite [id=" + id + ", member_id=" + member_id + ", book_id=" + book_id + ", gender=" + gender
				+ ", birthdate=" + birthdate + "]";
	}
	
	
	
	
	
}
