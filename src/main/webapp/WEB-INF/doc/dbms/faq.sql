/**********************************/
/* Table Name: 자주하는질문 */
/**********************************/
DROP TABLE faq;

CREATE TABLE faq(
    faqno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                    NUMBER(10)     NOT NULL, 
    seqno                          NUMBER(10)     NOT NULL, 
    title                             VARCHAR2(300)    NOT NULL,
    content                        CLOB     NOT NULL,
    word                            VARCHAR2(100)  NULL,
    rdate                             DATE     NOT NULL,
    faq_cateno                      NUMBER(10)     NOT NULL,
    
    FOREIGN KEY (memberno) REFERENCES mkmember (memberno),
    FOREIGN KEY (faq_cateno) REFERENCES faq_cate(faq_cateno)
);

COMMENT ON TABLE faq is 'faq';
COMMENT ON COLUMN faq.faqno is 'faq번호';
COMMENT ON COLUMN faq.seqno is 'faq순서';
COMMENT ON COLUMN faq.title is 'faq 제목';
COMMENT ON COLUMN faq.content is 'faq 내용';

1) 등록
-- PK 생성
SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq;                                
 FAQNO
 ----------
          1

INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 1, 1, '제목1', '내용1',' ',sysdate);
             
-- 2) 목록
SELECT faqno, memberno, faq_cateno, seqno, title, content, word, rdate
FROM faq
ORDER BY faqno DESC;


-- 3) 전체 레코드 수
SELECT COUNT(*) as count
FROM faq;
 
     
-- 4) 조회
SELECT faqno, memberno, faq_cateno, seqno, title, content, word, rdate
FROM faq
WHERE faqno=1;

-- 6) 수정
UPDATE faq
SET title='제목 수정', content='내용 수정'
WHERE faqno = 1;

-- 7) 삭제
DELETE FROM faq;
WHERE faqno = 1;

