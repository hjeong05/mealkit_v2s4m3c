/**********************************/
/* Table Name: 자주하는질문 분류 카테고리*/
/**********************************/
-- 1)삭제
DROP TABLE faq_cate;

-- 2)생성
CREATE TABLE faq_cate(
  faq_cateno NUMBER(10) NOT NULL, 
  title VARCHAR(50) NOT NULL,
  seqno NUMBER(10) DEFAULT 0 NOT NULL,
  rdate DATE NOT NULL,
  cnt NUMBER(10) DEFAULT 0 NOT NULL,
  PRIMARY KEY(faq_cateno)
);

COMMENT ON TABLE faq_cate is '자주하는질문 카테고리 그룹';
COMMENT ON COLUMN faq_cate.faq_cateno is '자주하는질문 번호';
COMMENT ON COLUMN faq_cate.title is '자주하는질문 제목';
COMMENT ON COLUMN faq_cate.seqno is '출력 순서';
COMMENT ON COLUMN faq_cate.rdate is '등록일';
COMMENT ON COLUMN faq_cate.cnt is '자주하는질문 등록 개수';

-- 3)등록
INSERT INTO faq_cate(faq_cateno, title, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(faq_cateno), 0) + 1 as faq_cateno FROM faq_cate),
                '주문 결제', 1, sysdate, 0);
INSERT INTO faq_cate(faq_cateno, title, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(faq_cateno), 0) + 1 as faq_cateno FROM faq_cate),
                '배송 안내', 2, sysdate, 0);
INSERT INTO faq_cate(faq_cateno, title, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(faq_cateno), 0) + 1 as faq_cateno FROM faq_cate),
                '상품 관련', 3, sysdate, 0);
            
-- 4)목록            
SELECT * FROM faq_cate ORDER BY seqno ASC;

DELETE FROM faq_cate;

-- 5)조회
SELECT faq_cateno, title, seqno, rdate, cnt
FROM faq_cate
WHERE faq_cateno=1;

-- 6)수정
UPDATE notice_cate
SET title='기타사항', seqno=5, visible='Y'
WHERE cateno=4;

-- 7)삭제
DELETE FROM notice_cate
WHERE cateno=4;
