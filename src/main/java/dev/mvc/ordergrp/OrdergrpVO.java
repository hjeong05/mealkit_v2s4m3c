package dev.mvc.ordergrp;

public class OrdergrpVO {
/**
CREATE TABLE order_pay_grp(
    order_pay_grpNO NUMBER(10) NOT NULL PRIMARY KEY,
    order_payPostName VARCHAR(100) NOT NULL,
    order_payPostTel VARCHAR(100) NOT NULL,
    order_payPostAddress1 VARCHAR(100) NOT NULL,
    order_payPostAddress2 VARCHAR(100) NOT NULL,
    order_payGetName VARCHAR(100) NOT NULL,
    order_payGetTel VARCHAR(100) NOT NULL,
    order_payGetAddress1 VARCHAR(100) NOT NULL,
    order_payGetAddress2 VARCHAR(100) NOT NULL,
    order_payGetRequest VARCHAR(100) NOT NULL,
    order_pay_grpMethod VARCHAR(100) NOT NULL,
    order_pay_grpStatus VARCHAR(100) NOT NULL,
    order_pay_grpDate DATE NOT NULL
);
 */
  /**주문 번호*/
  private int order_pay_grpNO;
  /**주문자 이름*/
  private String order_payPostName;
  /**주문자 전화번호*/
  private String order_payPostTel;
  /**주문자 주소1*/
  private String order_payPostAddress1;
  /**주문자 주소2*/
  private String order_payPostAddress2;
  /**수령자 이름*/
  private String order_payGetName;
  /**수령자 전화번호*/
  private String order_payGetTel;
  /**수령자 주소1*/
  private String order_payGetAddress1;
  /**수령자 주소2*/
  private String order_payGetAddress2;
  /**요청사항*/
  private String order_payGetRequest;
  /**결제 방법*/
  private String order_pay_grpMethod;
  /**결제일*/
  private String order_pay_grpStatus;
  /**결제 상태*/
  private String order_pay_grpDate;
  public int getOrder_pay_grpNO() {
    return order_pay_grpNO;
  }
  public void setOrder_pay_grpNO(int order_pay_grpNO) {
    this.order_pay_grpNO = order_pay_grpNO;
  }
  public String getOrder_payPostName() {
    return order_payPostName;
  }
  public void setOrder_payPostName(String order_payPostName) {
    this.order_payPostName = order_payPostName;
  }
  public String getOrder_payPostTel() {
    return order_payPostTel;
  }
  public void setOrder_payPostTel(String order_payPostTel) {
    this.order_payPostTel = order_payPostTel;
  }
  public String getOrder_payPostAddress1() {
    return order_payPostAddress1;
  }
  public void setOrder_payPostAddress1(String order_payPostAddress1) {
    this.order_payPostAddress1 = order_payPostAddress1;
  }
  public String getOrder_payPostAddress2() {
    return order_payPostAddress2;
  }
  public void setOrder_payPostAddress2(String order_payPostAddress2) {
    this.order_payPostAddress2 = order_payPostAddress2;
  }
  public String getOrder_payGetName() {
    return order_payGetName;
  }
  public void setOrder_payGetName(String order_payGetName) {
    this.order_payGetName = order_payGetName;
  }
  public String getOrder_payGetTel() {
    return order_payGetTel;
  }
  public void setOrder_payGetTel(String order_payGetTel) {
    this.order_payGetTel = order_payGetTel;
  }
  public String getOrder_payGetAddress1() {
    return order_payGetAddress1;
  }
  public void setOrder_payGetAddress1(String order_payGetAddress1) {
    this.order_payGetAddress1 = order_payGetAddress1;
  }
  public String getOrder_payGetAddress2() {
    return order_payGetAddress2;
  }
  public void setOrder_payGetAddress2(String order_payGetAddress2) {
    this.order_payGetAddress2 = order_payGetAddress2;
  }
  public String getOrder_payGetRequest() {
    return order_payGetRequest;
  }
  public void setOrder_payGetRequest(String order_payGetRequest) {
    this.order_payGetRequest = order_payGetRequest;
  }
  public String getOrder_pay_grpMethod() {
    return order_pay_grpMethod;
  }
  public void setOrder_pay_grpMethod(String order_pay_grpMethod) {
    this.order_pay_grpMethod = order_pay_grpMethod;
  }
  public String getOrder_pay_grpStatus() {
    return order_pay_grpStatus;
  }
  public void setOrder_pay_grpStatus(String order_pay_grpStatus) {
    this.order_pay_grpStatus = order_pay_grpStatus;
  }
  public String getOrder_pay_grpDate() {
    return order_pay_grpDate;
  }
  public void setOrder_pay_grpDate(String order_pay_grpDate) {
    this.order_pay_grpDate = order_pay_grpDate;
  }
  
  
}
