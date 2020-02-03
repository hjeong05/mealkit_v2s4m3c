/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE cart;

CREATE TABLE cart(
    cartno NUMBER(10) NOT NULL  PRIMARY KEY,
		cartgrpno NUMBER(10) NOT NULL,
		productno NUMBER(10) NOT NULL,
		orderID VARCHAR(100) NOT NULL,
		productCount NUMBER(10) DEFAULT 0 NOT NULL,
		rdate DATE NOT NULL,
		FOREIGN KEY (cartgrpno) REFERENCES cartgrp (cartgrpno),
		FOREIGN KEY (productno) REFERENCES pdcontents (pdcontentsno),
		FOREIGN KEY (orderID) REFERENCES mkmember (id)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니 번호';
COMMENT ON COLUMN cart.cartgrpno is '장바구니 그룹 번호';
COMMENT ON COLUMN cart.productno is '상품 번호';
COMMENT ON COLUMN cart.orderID is '주문자 id';
COMMENT ON COLUMN cart.productCount is '상품 갯수';
COMMENT ON COLUMN cart.rdate is '장바구니 추가일';

SELECT * FROM cart
ORDER BY cartno ASC;
SELECT * FROM cartgrp;

 SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart;

 -- 등록
 INSERT INTO cart(cartno, cartgrpno, productno, orderID,
                              productCount, rdate)
 VALUES((SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart),
             1, 1, 'user1', 1, sysdate);      
 INSERT INTO cart(cartno, cartgrpno, productno, orderID,
                              productCount, rdate)
 VALUES((SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart),
             1, 2, 'user1', 1, sysdate); 
 INSERT INTO cart(cartno, cartgrpno, productno, orderID,
                              productCount, rdate)
 VALUES((SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart),
             1, 3, 'user1', 1, sysdate); 
             
 CARTNO CARTGRPNO PRODUCTNO ORDERID PRODUCTCOUNT RDATE
 ------ --------- --------- ------- ------------ ---------------------
      1         1         1 user1              1 2019-12-13 18:13:40.0
      2         1         2 user1              1 2019-12-13 18:13:41.0
      3         1         3 user1              1 2019-12-13 18:13:42.0

 -- 조회
 SELECT cartno, cartgrpno, productno, orderID, productCount, rdate
 FROM cart
 WHERE cartno=1;
 
 SELECT cartno, cartgrpno, productno, orderID, productCount, rdate
 FROM cart
 WHERE orderID='user1';

 CARTNO CARTGRPNO PRODUCTNO ORDERID PRODUCTCOUNT RDATE
 ------ --------- --------- ------- ------------ ---------------------
      1         1         1 user1              1 2019-12-13 18:13:40.0

      
 -- 상품 수정
UPDATE cart
SET productno=1, productCount=10
WHERE cartno=1;

 -- 그룹 수정
UPDATE cart
SET cartgrpno=3, rdate = sysdate
WHERE cartno=1;

 -- 삭제
 DELETE FROM cart 
 WHERE cartgrpno=1 and cartno=2;

 -- 전체 레코드 수
 SELECT COUNT(*) as cnt
 FROM cart;
 
  CNT
 ---
   5
 
 -- cartgrpno별 레코드 수
 SELECT COUNT(*) as cnt
 FROM cart
 WHERE cartgrpno=2;

  CNT
 ---
   2

   
 -- 상품 + 카트 목록
 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate, p.pdcontentsno, p.title, p.thumb, p.price
 FROM cart c INNER JOIN pdcontents p
 ON c.productno = p.pdcontentsno 
 WHERE cartgrpno = 1 AND orderID='user1'
 ORDER BY cartno ASC;
 
 CARTNO CARTGRPNO PRODUCTNO ORDERID PRODUCTCOUNT PDCONTENTSNO TITLE THUMB         RDATE                 PRICE
 ------ --------- --------- ------- ------------ ------------ ----- ------------- --------------------- -----
      1         1         1 user1              1            1 비빔밥   bibmbap_t.jpg 2019-12-20 17:06:04.0  6500
      
 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate, p.pdcontentsno, p.title, p.thumb, p.price
 FROM cart c INNER JOIN pdcontents p
 ON c.productno = p.pdcontentsno 
 WHERE cartno = 5;

 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate, p.pdcontentsno, p.title, p.thumb, p.price
 FROM cart c INNER JOIN pdcontents p
 ON c.productno = p.pdcontentsno 
 ORDER BY cartno ASC;
 
 DELETE FROM cart;