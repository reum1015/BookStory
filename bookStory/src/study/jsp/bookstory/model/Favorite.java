package study.jsp.bookstory.model;

public class Favorite {

	int id;		// 선호작품 번호

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Favorite [id=" + id + "]";
	}
	
}
