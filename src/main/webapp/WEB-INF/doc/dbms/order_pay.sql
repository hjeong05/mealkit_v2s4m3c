DROP TABLE order_pay;

/**********************************/
/*  Table Name: 주문 및 결제 */  
/**********************************/
CREATE TABLE order_pay(
    order_payNo NUMBER(10) NOT NULL PRIMARY KEY,
    cartNo NUMBER(10) NOT NULL,
    order_pay_grpNO NUMBER(10) NOT NULL,
    FOREIGN KEY (cartNo) REFERENCES cart (cartNo),
    FOREIGN KEY (order_pay_grpNO) REFERENCES order_pay_grp (order_pay_grpNO)
);

COMMENT ON TABLE order_pay is '주문 및 결제';
COMMENT ON COLUMN order_pay.order_payNo is '주문 번호';
COMMENT ON COLUMN order_pay.cartNo is '장바구니 번호';
COMMENT ON COLUMN order_pay.order_pay_grpNO is '주문 그룹';


SELECT NVL(MAX(orderNo),0) + 1 as orderNo FROM order_pay;

-- 등록
 INSERT INTO order_pay(order_payNo, cartNo, order_pay_grpNO)
 VALUES((SELECT NVL(MAX(order_payNo),0) + 1 as order_payNo FROM order_pay), 1, 1); 
 
 INSERT INTO order_pay(order_payNo, cartNo, order_pay_grpNO)
 VALUES((SELECT NVL(MAX(order_payNo),0) + 1 as order_payNo FROM order_pay), 1, 1); 
 
 
 -- 목록
 SELECT order_payNo, cartNo, order_pay_grpNO
 FROM order_pay;
 
 -- 그룹(한번에 결제한 상품들)별 목록
 SELECT order_payNo, cartNo, order_pay_grpNO
 FROM order_pay
 WHERE order_payNo = 1;

 -- 수정 // 결제 상태 변경 -> 결제완료, 결제 취소, 환불 완료, 재결제
UPDATE order_pay
SET order_payStatus='결제 취소'
WHERE order_payNo=1;
 
  -- order_pay_grp 증가
 UPDATE order_pay
 SET order_pay_grpNO = order_pay_grpNO + 1;
 
 DELETE FROM order_pay;