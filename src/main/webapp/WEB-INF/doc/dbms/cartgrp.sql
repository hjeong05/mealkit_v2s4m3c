/**********************************/
/*  Table Name: 장바구니 그룹*/ 
/**********************************/
DROP TABLE cartgrp;
  
CREATE TABLE cartgrp(
    cartgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL,
    cnt                                NUMBER(7)    DEFAULT 0     NOT NULL    
);

COMMENT ON TABLE cartgrp is '장바구니 그룹';
COMMENT ON COLUMN cartgrp.cartgrpno is '장바구니 그룹 번호';
COMMENT ON COLUMN cartgrp.name is '이름';
COMMENT ON COLUMN cartgrp.seqno is '출력 순서';
COMMENT ON COLUMN cartgrp.visible is '출력 모드';
COMMENT ON COLUMN cartgrp.rdate is '그룹 생성일';
COMMENT ON COLUMN cartgrp.cnt is '등록된 상품수';

-- 등록
INSERT INTO cartgrp(cartgrpno, name, seqno, visible, rdate, cnt)
VALUES(1, '일반 배송', 1, 'Y', sysdate, 0);
 
INSERT INTO cartgrp(cartgrpno, name, seqno, visible, rdate, cnt)
VALUES(2, '정기 배송', 2, 'Y', sysdate, 0);

INSERT INTO cartgrp(cartgrpno, name, seqno, visible, rdate, cnt)
VALUES(3, '수정/삭제 예시용', 3, 'Y', sysdate, 0);

 CARTGRPNO NAME      SEQNO VISIBLE RDATE                 CNT
 --------- --------- ----- ------- --------------------- ---
         1 일반 배송         1 Y       2019-12-10 17:57:01.0   0
         2 정기 배송         2 Y       2019-12-10 17:57:06.0   0
         3 수정/삭제 예시용     3 Y       2019-12-12 17:52:25.0   0
         
SELECT *
FROM cartgrp;

 -- 조회
 SELECT cartgrpno, name, seqno, visible, rdate, cnt
 FROM cartgrp
 WHERE cartgrpno=1;
 
  CARTGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ----- ----- ------- --------------------- ---
         1 일반 배송     1 Y       2019-12-10 17:57:01.0   0

 -- 수정
UPDATE cartgrp
SET name='카테고리 이름', seqno='2', visible='N'
WHERE cartgrpno=3;

 CARTGRPNO NAME    SEQNO VISIBLE RDATE                 CNT
 --------- ------- ----- ------- --------------------- ---
         3 카테고리 이름     2 N       2019-12-12 17:52:25.0   0

 -- 삭제
 DELETE FROM cartgrp 
 WHERE cartgrpno=3;
 
 CARTGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ----- ----- ------- --------------------- ---
         1 일반 배송     1 Y       2019-12-10 17:57:01.0   0
         2 정기 배송     2 Y       2019-12-10 17:57:06.0   0
         
         
 -- 출력 순서 상향, 10 -> 1
 UPDATE cartgrp
 SET seqno = seqno - 1
 WHERE cartgrpno=1;
 
 
 -- 출력순서 하향, 1 -> 10
 UPDATE cartgrp
 SET seqno = seqno + 1
 WHERE cartgrpno=1;     
 
 
 -- contents 추가에따른 등록된 글수의 증가
UPDATE cartgrp 
SET cnt = cnt + 1 
WHERE cartgrpno=1;
 

 -- contents 삭제에따른 등록된 글수의 감소
 UPDATE cartgrp 
 SET cnt = cnt - 1 
 WHERE cartgrpno=1;

DELETE FROM cartgrp;