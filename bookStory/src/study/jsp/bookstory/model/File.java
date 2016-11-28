package study.jsp.bookstory.model;

public class File {

	private int id;							// 파일번호
	private String origin_name;				// 파일이름원본
	private String file_dir;				// 업로드 된 폴더 경로
	private String file_name;				// 저장된 파일 이름
	private String content_type;			// 파일형식
	private int file_size;					// 파일크기
	private String reg_date;				// 등록일자
	private String edit_date;				// 변경일자
	private int episode_id;					// 에피소드 아이디
	private int book_id;					// 책 번호
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getFile_dir() {
		return file_dir;
	}
	public void setFile_dir(String file_dir) {
		this.file_dir = file_dir;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
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
	@Override
	public String toString() {
		return "File [id=" + id + ", origin_name=" + origin_name + ", file_dir=" + file_dir + ", file_name=" + file_name
				+ ", content_type=" + content_type + ", file_size=" + file_size + ", reg_date=" + reg_date
				+ ", edit_date=" + edit_date + ", episode_id=" + episode_id + ", book_id=" + book_id + "]";
	}
	
	
	
}
