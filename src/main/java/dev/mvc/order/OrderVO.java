package dev.mvc.order;

public class OrderVO {
/**
CREATE TABLE order_pay(
    order_payNo NUMBER(10) NOT NULL PRIMARY KEY,
    cartNo NUMBER(10) NOT NULL,
    order_pay_grpNO NUMBER(10) NOT NULL,
    FOREIGN KEY (cartNo) REFERENCES cart (cartNo),
    FOREIGN KEY (order_pay_grpNO) REFERENCES order_pay_grp (order_pay_grpNO)
);
 */
  /**주문 번호*/
  private int order_payNo;
  /**장바구니 넘버*/
  private int cartNo;
  /**주문 그룹 번호*/
  private int order_pay_grpNO;
  
  
  public int getOrder_payNo() {
    return order_payNo;
  }
  public void setOrder_payNo(int order_payNo) {
    this.order_payNo = order_payNo;
  }
  public int getCartNo() {
    return cartNo;
  }
  public void setCartNo(int cartNo) {
    this.cartNo = cartNo;
  }
  public int getOrder_pay_grpNO() {
    return order_pay_grpNO;
  }
  public void setOrder_pay_grpNO(int order_pay_grpNO) {
    this.order_pay_grpNO = order_pay_grpNO;
  }
  
}
