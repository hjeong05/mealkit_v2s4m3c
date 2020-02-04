package dev.mvc.cart;

public class Cart_ProductVO {
  /**
   * c.cartno, c.cartgrpno, c.productno, c.orderID, p.pdcontentsno, p.title, p.thumb
   */
  
  /**장바구니 넘버*/
  private int cartno;
  /**장바구니 그룹 넘버*/
  private int cartgrpno;
  /**상품 넘버*/
  private int productno;
  /**주문자 아이디*/
  private String orderID;
  /**상품 수 */
  private int productCount;
  /**상품 넘버*/
  private int pdcontentsno;
  /**상품명*/
  private String title;
  /**상품 썸네일 이미지*/
  private String thumb;
  /**상품 가격*/
  private int price;
  /**등록일*/
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
  public int getPdcontentsno() {
    return pdcontentsno;
  }
  public void setPdcontentsno(int pdcontentsno) {
    this.pdcontentsno = pdcontentsno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getThumb() {
    return thumb;
  }
  public void setThumb(String thumb) {
    this.thumb = thumb;
  }
  public int getPrice() {
    return price;
  }
  public void setPrice(int price) {
    this.price = price * this.productCount;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}
