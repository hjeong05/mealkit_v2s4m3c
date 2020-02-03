package dev.mvc.cartgrp;

public class CartgrpVO {

  /**
   * CREATE TABLE cartgrp(
    cartgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL,
    cnt                                NUMBER(7)    DEFAULT 0     NOT NULL    
);
   */
  
  /**카테고리 넘버*/
  private int cartgrpno;
  /**카테고리 이름*/
  private String name;
  /**출력 순서*/
  private int seqno;
  /**출력 타입*/
  private String visible;
  /**등록 일자*/
  private String rdate;
  /** 등록된 자료 수 */
  private int cnt;
  
  public int getCartgrpno() {
    return cartgrpno;
  }
  public void setCartgrpno(int cartgrpno) {
    this.cartgrpno = cartgrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
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
  public void setCnt(int cnt) {
  this.cnt = cnt;
  }  
  public int getCnt() {
    return cnt;
  }
}
