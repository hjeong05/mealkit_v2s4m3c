/**********************************/
/* Table Name: qna */
/**********************************/
DROP TABLE qna;

CREATE TABLE qna(
    qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                    NUMBER(10)     NOT NULL, 
    seqno                           NUMBER(10)     NOT NULL, 
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB     NOT NULL,
    name                           VARCHAR2(20)    NOT NULL,
    choice         VARCHAR2(50)  NOT NULL,
    grpno          NUMBER(10)                           NOT NULL,
    indent          NUMBER(10)      DEFAULT 0      NOT NULL,
    ansnum        NUMBER(10)        DEFAULT 0       NOT NULL,    
    rdate                             DATE     NOT NULL,
 
    FOREIGN KEY (memberno) REFERENCES mkmember (memberno)
);

COMMENT ON TABLE qna is 'qna';
COMMENT ON COLUMN qna.qnano is 'qna��ȣ';
COMMENT ON COLUMN qna.seqno is 'qna����';
COMMENT ON COLUMN qna.title is 'qna ����';
COMMENT ON COLUMN qna.content is 'qna ����';
COMMENT ON COLUMN qna.grpno is '�׷��ȣ';
COMMENT ON COLUMN qna.indent is '�亯����';
COMMENT ON COLUMN qna.ansnum is '�亯����';

1) ���
-- PK ����
SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna;                                
 CONTENTSNO
 ----------
          1

INSERT INTO qna(qnano, memberno, seqno, title, content, 
                              grpno, indent, ansnum, rdate)
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
             1, 1, '����1', '����1',
             0, 0, 0, sysdate);
             
-- 2) ���
SELECT qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate
FROM qna
ORDER BY qnano DESC;


-- 3) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM qna;
 
     
-- 4) ��ȸ
SELECT qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate
FROM qna
WHERE qnano=1;

-- 6) ����
UPDATE qna
SET title='���� ����', content='���� ����'
WHERE qnano = 1;

-- 7) ����
DELETE FROM qna;
WHERE qnano = 1;


�� ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
-- ��� ���� �켱 ������ 1�� ������, 1�� -> 2��
UPDATE qna
SET ansnum = ansnum + 1
WHERE memberno=1 AND grpno = 1 AND ansnum > 0;

-- 2����� �켱 ������ 1�� ������, 2�� -> 3��
UPDATE qna
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 1;
 
�� �亯 ���
INSERT INTO qna(qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate)  
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
            1, 1, '�亯', '����', 1, 1, 1,sysdate);


�� �亯�� ���� ���� ���� ����    
SELECT qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate r
FROM(
         SELECT qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate, rownum as r
         FROM(
                  SELECT qnano, memberno, seqno, title, content, grpno, indent, ansnum, rdate
                  FROM qna
                  ORDER BY grpno DESC, ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;