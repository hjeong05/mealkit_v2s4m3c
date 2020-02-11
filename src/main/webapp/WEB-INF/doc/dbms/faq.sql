/**********************************/
/* Table Name: 자주하는질문 */
/**********************************/
/*내용*/
INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 1, 1, 'Q. 출고 전 수령자 정보 수정은 어떻게 하나요?', '입금 전, 상품 준비중 상태에서는 고객님께서 직접 수령자 정보(성함/연락처/주소/배송메시지) 변경이 가능합니다.
※ 배송 준비중 이후 상태에서는 상품 출고를 준비하고 있어 정보 변경이 어려운 점 참고 부탁드립니다. :)',' ',sysdate);

INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 1, 2, 'Q. 한가지 이상 상품을 주문할 경우, 한 번에 구매할 수 있나요?', '장바구니를 이용하시면 구매 원하시는 상품은 한꺼번에 구매하실 수 있습니다.

다만, 구매하신 상품이 출고지가 다를 경우, 묶음 배송은 어려운 점 안내해 드립니다. :)', '묶음,상품,구매',sysdate);

INSERT INTO faq(faqno, memberno, faq_cateno, seqno, title, content, word, rdate)
VALUES((SELECT NVL(MAX(faqno), 0) + 1 as faqno FROM faq),
             1, 2, 2, ' Q. 배송 기간은 얼마나 걸리나요?', '출고 및 배송 기간에 대한 안내는 각 상품마다 상이하며, 상품 페이지 하단의 배송 정보란에서 확인이 가능합니다.

결제 시간에 따라 당일 출고는 가능하나 당일 배송 완료는 어려운 점 양해 부탁드립니다. :)', '배송,기간',sysdate);

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

