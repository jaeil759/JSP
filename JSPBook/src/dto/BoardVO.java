package dto;

public class BoardVO {
	private String bo_id;		// 게시판 아이디
	private String bo_title;	// 게시판 제목
	private String bo_content;	// 게시판 내용
	private String bo_writer;	// 게시판 작성자
	private String bo_date;		// 게시판 작성일
	private String bo_hit;		// 게시판 조회수
	
	
	
	public BoardVO() {
		
	}
	
	public String getBo_id() {
		return bo_id;
	}
	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
	public String getBo_date() {
		return bo_date;
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}
	public String getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(String bo_hit) {
		this.bo_hit = bo_hit;
	}
}
