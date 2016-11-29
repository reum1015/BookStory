package study.jsp.bookstory.model;

public class Member {
	
	private int id;						// 회원번호
	private String nick_name;		// 닉네임
	private String birth_date;		// 생일
	private String name;				// 이름
	private String user_id; 			// 아이디
	private String user_pw;			// 패스워드
	private String email;				// 이메일
	private String gender;			// 성별
	private String tel;				// 전화번호
	private int point;					// 포인트
	private String reg_date;		// 가입일자
	private String edit_date;		// 변경일자
	
	
	// fig
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", nick_name=" + nick_name + ", birth_date=" + birth_date + ", name=" + name
				+ ", user_id=" + user_id + ", user_pw=" + user_pw + ", email=" + email + ", gender=" + gender + ", tel="
				+ tel + ", point=" + point + ", reg_date=" + reg_date + ", edit_date=" + edit_date + "]";
	}

}
