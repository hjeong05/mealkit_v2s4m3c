package dev.mvc.notice_cate;

public class Notice_cateVO {
	/**공지사항 번호*/
	private int cateno;
	/**  카테고리 제목 */
	private String title;
	/** 출력 순서 */
	private int seqno;
	/** 출력 모드 */
	private String visible;
	/** 등록일 */
	private String rdate;
	/** 등록된 글수*/
	private int cnt;
	
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
