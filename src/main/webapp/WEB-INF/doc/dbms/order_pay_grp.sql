DROP TABLE order_pay_grp;

/**********************************/
/*  Table Name: 주문 및 결제 */ 
/**********************************/
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

COMMENT ON TABLE order_pay_grp is '주문 및 결제 그룹';
COMMENT ON COLUMN order_pay_grp.order_pay_grpNO is '결제 번호';
COMMENT ON COLUMN order_pay_grp.order_payPostName is '주문자 이름';
COMMENT ON COLUMN order_pay_grp.order_payPostTel is '주문자 전화번호';
COMMENT ON COLUMN order_pay_grp.order_payPostAddress1 is '주문자 주소1';
COMMENT ON COLUMN order_pay_grp.order_payPostAddress2 is '주문자 주소2';
COMMENT ON COLUMN order_pay_grp.order_payGetName is '수령자 이름';
COMMENT ON COLUMN order_pay_grp.order_payGetTel is '수령자 전화번호';
COMMENT ON COLUMN order_pay_grp.order_payGetAddress1 is '수령자 주소1';
COMMENT ON COLUMN order_pay_grp.order_payGetAddress2 is '수령자 주소2';
COMMENT ON COLUMN order_pay_grp.order_payGetRequest is '요청사항';
COMMENT ON COLUMN order_pay_grp.order_pay_grpMethod is '결제 방법';
COMMENT ON COLUMN order_pay_grp.order_pay_grpStatus is '결제 상태';
COMMENT ON COLUMN order_pay_grp.order_pay_grpDate is '결제일';


 INSERT INTO order_pay_grp(order_pay_grpNO, order_payPostName, order_payPostTel, order_payPostAddress1, order_payPostAddress2,
                order_payGetName, order_payGetTel, order_payGetAddress1, order_payGetAddress2, order_payGetRequest,
                order_pay_grpMethod, order_pay_grpStatus, order_pay_grpDate)
 VALUES((SELECT NVL(MAX(order_pay_grpNO),0) + 1 as order_pay_grpNO FROM order_pay_grp), 'user1','010-0000-0000', '주소1', '주소2'
            , '받는사람', '010-1111-1111', '주소3', '주소4', '요청사항', '신용카드', '결제 완료', sysdate); 
            
 INSERT INTO order_pay_grp(order_pay_grpNO, order_payPostName, order_payPostTel, order_payPostAddress1, order_payPostAddress2,
                order_payGetName, order_payGetTel, order_payGetAddress1, order_payGetAddress2, order_payGetRequest,
                order_pay_grpMethod, order_pay_grpStatus, order_pay_grpDate)
 VALUES((SELECT NVL(MAX(order_pay_grpNO),0) + 1 as order_pay_grpNO FROM order_pay_grp), 'user2','010-0000-0000', '주소1', '주소2'
            , '받는사람2', '010-1111-1111', '주소3', '주소4', '요청사항', '신용카드', '결제 완료', sysdate); 
            
 -- 현재 order_pay_grpNO 뽑아내기
 SELECT MAX(order_pay_grpNO)
 FROM order_pay_grp;

 SELECT *
 FROM order_pay_grp;
           
 DELETE FROM order_pay_grp;
            