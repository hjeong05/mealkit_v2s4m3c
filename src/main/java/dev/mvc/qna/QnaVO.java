package dev.mvc.qna;

public class QnaVO {
/* qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                    NUMBER(10)     NOT NULL, 
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB     NOT NULL,
    grpno          NUMBER(10)                           NOT NULL,
    indent          NUMBER(10)      DEFAULT 0      NOT NULL,
    ansnum        NUMBER(10)        DEFAULT 0       NOT NULL,    
    rdate                
 * 
 * */
	
	/**qna 컨텐츠 번호*/
	private int qnano;
	
	/**회원 번호*/
	private int memberno;
	
  private int seqno;
  
	/** 제목*/
	private String title;
	
	/**내용*/
	private String content;
	
	private String name;
	
	private String choice;
	
	private int grpno;
	
	private int indent;
	
	private int ansnum;
	
	/** 등록일 */
	private String rdate;

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	
	public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getChoice() {
    return choice;
  }

  public void setChoice(String choice) {
    this.choice = choice;
  }

  public int getGrpno() {
    return grpno;
  }

  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }

  public int getIndent() {
    return indent;
  }

  public void setIndent(int indent) {
    this.indent = indent;
  }

  public int getAnsnum() {
    return ansnum;
  }

  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }

  public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
}
