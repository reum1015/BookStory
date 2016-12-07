package study.jsp.bookstory.model;

public class BookMark {

	private int id; 	// 북마크 번호
	private int member_id;   // 회원번호
	private int episode_id;    // 회차번호
	
	private int episode_order;
	private String episode_name;
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
	public int getEpisode_id() {
		return episode_id;
	}
	public void setEpisode_id(int episode_id) {
		this.episode_id = episode_id;
	}
	public int getEpisode_order() {
		return episode_order;
	}
	public void setEpisode_order(int episode_order) {
		this.episode_order = episode_order;
	}
	public String getEpisode_name() {
		return episode_name;
	}
	public void setEpisode_name(String episode_name) {
		this.episode_name = episode_name;
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
		return "BookMark [id=" + id + ", member_id=" + member_id + ", episode_id=" + episode_id + ", episode_order="
				+ episode_order + ", episode_name=" + episode_name + ", limitStart=" + limitStart + ", listCount="
				+ listCount + ", gallery=" + gallery + ", imagePath=" + imagePath + "]";
	}
	
	
	

}
