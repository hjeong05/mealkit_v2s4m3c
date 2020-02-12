/**********************************/
/* Table Name: qna */
/**********************************/
-- qna 는 드랍 하고 새로 테이블 만들고 내용 넣어주세요
DROP TABLE qna;

CREATE TABLE qna(
    qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                    NUMBER(10)     NOT NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    seqno                           NUMBER(10)     NOT NULL, 
    title                             VARCHAR2(300)    NOT NULL,
    name                           VARCHAR2(20)    NOT NULL,
    content                           CLOB     NOT NULL,
    choice         VARCHAR2(50)  NOT NULL,
    grpno          NUMBER(10)                           NOT NULL,
    indent          NUMBER(10)      DEFAULT 0      NOT NULL,
    ansnum        NUMBER(10)        DEFAULT 0       NOT NULL,    
    rdate                             DATE     NOT NULL,
 
    FOREIGN KEY (memberno) REFERENCES mkmember (memberno)
);

-- 질문 등록
INSERT INTO qna(qnano, memberno, seqno, title, content, name, choice,
                              grpno, indent, ansnum, rdate)
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
             1, 1, '배송문의합니다', '일주일 전에 주문했는데 배송 언제오나요?',
             '아로미', '배송', 1, 0,0,sysdate);
             
-- 답변 등록
INSERT INTO qna(qnano, memberno, seqno, title, content, name, choice, grpno, indent, ansnum, rdate)  
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
            1, 1, '답변 드립니다', '주문 폭주로 인해 일주일 안에 도착할 예정입니다 :) 죄송합니다.', '관리자', '배송', 1, 1, 1,sysdate);  
            
COMMENT ON TABLE qna is 'qna';
COMMENT ON COLUMN qna.qnano is 'qna번호';
COMMENT ON COLUMN qna.seqno is 'qna순서';
COMMENT ON COLUMN qna.title is 'qna 제목';
COMMENT ON COLUMN qna.content is 'qna 내용';
COMMENT ON COLUMN qna.grpno is '그룹번호';
COMMENT ON COLUMN qna.indent is '답변차수';
COMMENT ON COLUMN qna.ansnum is '답변순서';


1) 등록
-- PK 생성
SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna;                                
 CONTENTSNO
 ----------
          1
           
             
-- 2) 목록
SELECT qnano, memberno, seqno, title, content, choice, grpno, indent, ansnum, rdate
FROM qna
ORDER BY qnano DESC;


-- 3) 전체 레코드 수
SELECT COUNT(*) as count
FROM qna;
 
     
-- 4) 조회
SELECT qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate
FROM qna;
WHERE qnano=1;

-- 6) 수정
UPDATE qna
SET title='제목 수정', content='내용 수정'
WHERE qnano = 1;

-- 7) 삭제
DELETE FROM qna;
WHERE qnano = 1;


① 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
-- 모든 글의 우선 순위가 1씩 증가됨, 1등 -> 2등
UPDATE qna
SET ansnum = ansnum + 1
WHERE memberno=1 AND grpno = 1 AND ansnum > 0;

-- 2등부터 우선 순위가 1씩 증가됨, 2등 -> 3등
UPDATE qna
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 0;

② 답변 등록
INSERT INTO qna(qnano, memberno, seqno, title, content, choice, grpno, indent, ansnum, rdate)  
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
            1, 1, '답변', '내용', '배송', 1, 1, 1,sysdate);


③ 답변에 따른 정렬 순서 변경    
SELECT qnano, memberno, seqno, title, content, choice, grpno, indent, ansnum, rdate r
FROM(
         SELECT qnano, memberno, seqno, title, content, choice, grpno, indent, ansnum, rdate, rownum as r
         FROM(
                  SELECT qnano, memberno, seqno, title, content, choice, grpno, indent, ansnum, rdate
                  FROM qna
                  ORDER BY grpno DESC, ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;