package dev.mvc.cart;

public class CartVO {

  /**
    CREATE TABLE cart(
    cartno INTEGER NOT NULL  PRIMARY KEY,
    cartgrpno INT NOT NULL,
    productno INTEGER NOT NULL,
    orderID VARCHAR(100) NOT NULL,
    productCount INTEGER DEFAULT 0 NOT NULL,
    rdate DATE NOT NULL,
    FOREIGN KEY (cartgrpno) REFERENCES cartgrp (cartgrpno),
    FOREIGN KEY (productno) REFERENCES MKproduct (productno),
    FOREIGN KEY (orderID) REFERENCES MKmember (memberID)
    );
   */
  
  /**장바구니 넘버*/
  private int cartno;
  /**카테고리 넘버*/
  private int cartgrpno;
  /**상품 번호*/
  private int productno;
  /**주문자 아이디*/
  private String orderID;
  /**상품 수 */
  private int productCount;
  /**등록 일자*/
  private String rdate;
  public int getCartno() {
    return cartno;
  }
  public void setCartno(int cartno) {
    this.cartno = cartno;
  }
  public int getCartgrpno() {
    return cartgrpno;
  }
  public void setCartgrpno(int cartgrpno) {
    this.cartgrpno = cartgrpno;
  }
  public int getProductno() {
    return productno;
  }
  public void setProductno(int productno) {
    this.productno = productno;
  }
  public String getOrderID() {
    return orderID;
  }
  public void setOrderID(String orderID) {
    this.orderID = orderID;
  }
  public int getProductCount() {
    return productCount;
  }
  public void setProductCount(int productCount) {
    this.productCount = productCount;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  

}
