package study.jsp.bookstory.model;

public class RecentEpisode {
	
	private int id;        					// 최근 본 작품 번호
	private int member_id;     	// 회원번호
	private int episode_id;      	// 에피소드 아이디
	private int book_id;        		// 책 번호
	private String reg_date;    	// 등록 시간
	
	private int episode_order;
	private String episode_name;
	private String book_author;
	private String book_name;
	
	private int oldfordelete;			//최근 본 에피소드 중에서 15개 이상 되면 지워야할 에피소드 작품번호 저장 변수
	
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
		public int getBook_id() {
			return book_id;
		}
		public void setBook_id(int book_id) {
			this.book_id = book_id;
		}
		public String getReg_date() {
			return reg_date;
		}
		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
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
		public int getOldfordelete() {
			return oldfordelete;
		}
		public void setOldfordelete(int oldfordelete) {
			this.oldfordelete = oldfordelete;
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
			return "RecentEpisode [id=" + id + ", member_id=" + member_id + ", episode_id=" + episode_id + ", book_id="
					+ book_id + ", reg_date=" + reg_date + ", episode_order=" + episode_order + ", episode_name="
					+ episode_name + ", book_author=" + book_author + ", book_name=" + book_name + ", oldfordelete="
					+ oldfordelete + ", limitStart=" + limitStart + ", listCount=" + listCount + ", gallery=" + gallery
					+ ", imagePath=" + imagePath + "]";
		}		
		
	
}
