/**********************************/
/* Table Name: 공지사항 분류 카테고리*/
/**********************************/

-- 3)등록
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '개인정보처리방침 안내', 1, 'Y', sysdate, 0);
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '회원등급 기준 안내', 2, 'Y', sysdate, 0);
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '무료배송 기준 안내', 3, 'Y', sysdate, 0);
                
-- 1)삭제
DROP TABLE notice_cate;

-- 2)생성
CREATE TABLE notice_cate(
  cateno NUMBER(10) NOT NULL, 
  title VARCHAR(50) NOT NULL,
  seqno NUMBER(10) DEFAULT 0 NOT NULL,
  visible CHAR(1) DEFAULT 'Y' NOT NULL,
  rdate DATE NOT NULL,
  cnt NUMBER(10) DEFAULT 0 NOT NULL,
  PRIMARY KEY(cateno)
);

COMMENT ON TABLE notice_cate is '공지사항 카테고리 그룹';
COMMENT ON COLUMN notice_cate.cateno is '공지사항 번호';
COMMENT ON COLUMN notice_cate.title is '공지사항 제목';
COMMENT ON COLUMN notice_cate.seqno is '출력 순서';
COMMENT ON COLUMN notice_cate.visible is '출력 모드';
COMMENT ON COLUMN notice_cate.rdate is '등록일';
COMMENT ON COLUMN notice_cate.cnt is '공지사항 등록 개수';

-- 3)등록
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '개인정보처리방침 안내', 1, 'Y', sysdate, 0);
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '회원등급 기준 안내', 2, 'Y', sysdate, 0);
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '무료배송 기준 안내', 3, 'Y', sysdate, 0);
            
-- 4)목록            
SELECT * FROM notice_cate ORDER BY seqno ASC;

DELETE FROM notice_cate;

-- 5)조회
SELECT cateno, title, seqno, visible, rdate, cnt
FROM notice_cate
WHERE cateno=1;

-- 6)수정
UPDATE notice_cate
SET cateno=1
WHERE cateno=4;

-- 7)삭제
DELETE FROM notice_cate
WHERE cateno=4;
