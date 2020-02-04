
/**********************************/
/* Table Name: 공지사항 그룹 */
/**********************************/
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

/**********************************/
/* Table Name: 멤버 */
/**********************************/
DROP TABLE notice_contents;

DROP TABLE memcate;

CREATE TABLE memcate(
        memcateno           NUMBER(10)         NOT NULL         PRIMARY KEY,
        name                    VARCHAR2(50)     NOT NULL,
        seqno                   NUMBER(7)          DEFAULT 0        NOT NULL,
        visible                   CHAR(1)              DEFAULT 'Y'      NOT NULL,
        rdate                     DATE                  NOT NULL,
        cnt                        NUMBER(7)         NULL 
);

COMMENT ON TABLE memcate is '멤버 카테고리 그룹';
COMMENT ON COLUMN memcate.memcateno is '멤버 카테고리 그룹 번호';
COMMENT ON COLUMN memcate.name is '멤버 카테고리 이름';
COMMENT ON COLUMN memcate.seqno is '출력 순서';
COMMENT ON COLUMN memcate.visible is '출력 모드';
COMMENT ON COLUMN memcate.rdate is '그룹 생성일';
COMMENT ON COLUMN memcate.cnt is '등록된 회원수';

CREATE TABLE mkmember(
  memberno       NUMBER(6) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  memcateno     NUMBER(10)     NOT NULL, -- 회원 등급 카테고리 번호
  id           VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  passwd    VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  mname    VARCHAR(20)   NOT NULL, -- 성명, 한글 10자 저장 가능
  tel          VARCHAR(14)   NOT NULL, -- 전화번호
  zipcode   VARCHAR(5)        NULL, -- 우편번호, 12345
  address1  VARCHAR(80)       NULL, -- 주소 1
  address2  VARCHAR(50)       NULL, -- 주소 2
  mdate     DATE             NOT NULL, -- 가입일    
  PRIMARY KEY (memberno),                     -- 한번 등록된 값은 중복 안됨
  FOREIGN KEY (memcateno) REFERENCES memcate (memcateno)
);

COMMENT ON TABLE MKMEMBER is '회원';
COMMENT ON COLUMN MKMEMBER.memberno is '회원 번호';
COMMENT ON COLUMN MKMEMBER.memcateno is '등급 카테고리 번호';
COMMENT ON COLUMN MKMEMBER.ID is '아이디';
COMMENT ON COLUMN MKMEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MKMEMBER.MNAME is '성명';
COMMENT ON COLUMN MKMEMBER.TEL is '전화번호';
COMMENT ON COLUMN MKMEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MKMEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MKMEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MKMEMBER.MDATE is '가입일';

INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'user1', '1234', '왕눈이', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);

INSERT INTO memcate(memcateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(memcateno), 0) + 1 as memcateno FROM memcate), '우수 회원', 1, 'Y', sysdate, 0);

SELECT * FROM mkmember;

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
