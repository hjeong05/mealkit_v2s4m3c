package dev.mvc.faq_cate;

public class Faq_cateVO {
	/**공지사항 번호*/
	private int faq_cateno;
	/**  카테고리 제목 */
	private String title;
	/** 출력 순서 */
	private int seqno;
	/** 등록일 */
	private String rdate;
	/** 등록된 글수*/
	private int cnt;
	
	
	public int getFaq_cateno() {
    return faq_cateno;
  }
  public void setFaq_cateno(int faq_cateno) {
    this.faq_cateno = faq_cateno;
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
