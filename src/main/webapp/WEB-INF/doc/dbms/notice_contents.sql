/**********************************/
/* Table Name: 공지사항 컨텐츠 */
/**********************************/

CREATE TABLE notice_contents(
		no_contentsno                 		NUMBER(10)		 NOT NULL  PRIMARY KEY,
		no_title                      		VARCHAR2(50)		 NOT NULL,
		no_contents                   		CLOB      		 NOT NULL,
		no_cnt                        		NUMBER(20)		 NOT NULL,
		no_rdate                     		DATE		 NOT NULL,
		no_word                       		VARCHAR2(50)		 NULL ,
		cateno                         		NUMBER(10)		 NOT NULL, 
		memberno                          NUMBER(10)     NOT NULL, 
		
		FOREIGN KEY (cateno) REFERENCES notice_cate (cateno),
		FOREIGN KEY (memberno) REFERENCES mkmember (memberno)
);

COMMENT ON TABLE notice_contents is '공지사항 컨텐츠';
COMMENT ON COLUMN notice_contents.no_contentsno is '공지사항컨텐츠번호';
COMMENT ON COLUMN notice_contents.memberno is '회원번호';
COMMENT ON COLUMN notice_contents.no_title is '제목';
COMMENT ON COLUMN notice_contents.no_contents is '내용';
COMMENT ON COLUMN notice_contents.no_cnt is '조회수';
COMMENT ON COLUMN notice_contents.no_rdate is '등록일';
COMMENT ON COLUMN notice_contents.no_word is '검색어';
COMMENT ON COLUMN notice_contents.cateno is '공지사항 카테고리 번호';

1) 등록
-- PK 생성
SELECT NVL(MAX(no_contentsno), 0) + 1 as no_contentsno FROM notice_contents;                                
 
NO_CONTENTSNO
 -------------
             1

-- categrp 테이블 목록 확인                                
SELECT * 
FROM notice_cate 
ORDER BY seqno ASC;

CATENO TITLE       SEQNO VISIBLE RDATE                 CNT
 ------ ----------- ----- ------- --------------------- ---
      1 개인정보처리방침 안내     1 Y       2019-12-04 16:20:11.0   0
      2 회원등급 기준 안내      2 Y       2019-12-04 16:20:12.0   0
      3 무료배송 기준 안내      3 Y       2019-12-04 16:20:13.0   0

-- 1) contents 등록(member: 1, categrpno: 1),
--     varchar에 '' 등록되면 null이 insert 됨
INSERT INTO notice_contents(no_contentsno, 
                                memberno, cateno, no_title, no_contents, 
                                no_cnt,no_rdate, no_word)
VALUES((SELECT NVL(MAX(no_contentsno), 0) + 1 as no_contentsno FROM notice_contents),
             1, 1, '제목1', '내용1',
             0, sysdate, '');
             
-- 2) 목록 
SELECT no_contentsno,memberno, cateno, no_title, no_contents, no_cnt,no_rdate, no_word
FROM notice_contents
ORDER BY no_contentsno ASC;

 NO_CONTENTSNO MEMBERNO CATENO NO_TITLE NO_CONTENTS NO_CNT NO_RDATE  NO_WORD
 ------------- -------- ------ -------- ----------- ------ --------------------- -------
             1        1      1 제목1      내용1              0 2019-12-11 17:16:07.0 NULL


-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM notice_contents;
             
-- 5) 조회
SELECT no_contentsno,memberno, cateno, no_title, 
          no_contents, no_cnt,no_rdate, no_word
FROM notice_contents
WHERE no_contentsno=1;

SELECT no_contentsno,memberno, cateno, no_title, 
          no_contents, no_cnt,no_rdate, no_word
FROM notice_contents
WHERE cateno=1 AND no_word LIKE '%가을%'
ORDER BY no_contentsno DESC;

-- 6) 수정
UPDATE notice_contents
SET no_title='제목 수정', no_contents='내용 수정', no_word='검색어'
WHERE no_contentsno = 1;

-- 7) 삭제
DELETE FROM notice_contents
WHERE no_contentsno=2;

--------------------------------------------------------------------------------------
-- 8) FK 부모 테이블별 레코드 갯수 산출
SELECT no_contentsno, memberno, cateno
FROM notice_contents
WHERE no_contentsno=1;

 CONTENTSNO MEMBERNO CATEGRPNO TITLE
 ---------- -------- --------- -----------------------
          3          1                6                  12월 객실 예약안내
          5          1                6                  이번주 폭설로 심야 개장합니다.
          7          1                6                  스키장 입구 폭설로 고속도로에서 진입해주세요~

SELECT COUNT(*) as cnt
FROM notice_contents
WHERE no_contentsno=1;

 CNT
 ---
   3             
             
-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM contents
WHERE categrpno=6;
