package study.jsp.bookstory.model;

public class BookMark {

	private int id; 	// 북마크 번호

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "BookMark [id=" + id + "]";
	}
	
}
