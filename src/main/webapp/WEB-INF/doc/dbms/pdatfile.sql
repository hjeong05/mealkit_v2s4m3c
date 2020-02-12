
/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
DROP TABLE pdatfile;
CREATE TABLE pdatfile(
        pdatfileno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        pdcontentsno                   NUMBER(10)         NULL ,
        fname                             VARCHAR2(100)         NOT NULL,
        fupname                      VARCHAR2(100)         NOT NULL,
        thumb                         VARCHAR2(100)         NULL ,
        fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE     NOT NULL,
  FOREIGN KEY (pdcontentsno) REFERENCES pdcontents (pdcontentsno)
);

COMMENT ON TABLE pdatfile is '첨부파일';
COMMENT ON COLUMN pdatfile.pdatfileno is '첨부파일번호';
COMMENT ON COLUMN pdatfile.pdcontentsno is '상품컨텐츠번호';
COMMENT ON COLUMN pdatfile.fname is '원본 파일명';
COMMENT ON COLUMN pdatfile.fupname is '업로드 파일명';
COMMENT ON COLUMN pdatfile.thumb is 'Thumb 파일';
COMMENT ON COLUMN pdatfile.fsize is '파일 사이즈';
COMMENT ON COLUMN pdatfile.rdate is '등록일';

-- 1) 등록
SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile;
 
 PDATFILENO
 ----------
          1

SELECT *
FROM pdcontents
ORDER BY pdcontentsno ASC;
 
 PDCONTENTSNO PDTHUMBNO PRODUCTCATENO TITLE
 ------------ --------- ------------- -----
            1         1             1 김치볶음밥

            
1) 등록
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             1, 'japchae1.jpg', 'japchae1_0.jpg', 'japchae1_0_t.jpg', 92275, sysdate);
             
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             1, 'japchae2.jpg', 'japchae1_0.jpg', 'japchae1_0_t.jpg', 92275, sysdate);

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             1, 'japchae3.jpg', 'japchae3_0.jpg', 'japchae3_0_t.jpg', 92275, sysdate);
             
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             1, 'japchae4.jpg', 'japchae4_0.jpg', 'japchae4_0_t.jpg', 92275, sysdate);
             
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             1, 'japchae5.jpg', 'japchae5_0.jpg', 'japchae5_0_t.jpg', 92275, sysdate);             
             
 -- 두부전골            
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             6, 'hotpot1.jpg', 'hotpot1.jpg', 'hotpot1_t.jpg', 78724, sysdate);

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             6, 'hotpot2.jpg', 'hotpot2_0.jpg', 'hotpot2_0_t.jpg', 78724, sysdate);             

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             6, 'hotpot3.jpg', 'hotpot3_0.jpg', 'hotpot3_0_t.jpg', 78724, sysdate);             

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             6, 'hotpot4.jpg', 'hotpot4_0.jpg', 'hotpot4_0.jpg', 78724, sysdate);             

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             6, 'hotpot5.jpg', 'hotpot5_0.jpg', 'hotpot5_0_t.jpg', 78724, sysdate);       

-- 코다리
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             5, 'codari1.jpg', 'codari1.jpg', 'codari1_t.jpg', 84244, sysdate);

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             5, 'codari2.jpg', 'codari2_0.jpg', 'codari2_0_t.jpg', 84244, sysdate);         
  
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             5, 'codari3.jpg', 'codari3_0.jpg', 'codari3_0_t.jpg', 84244, sysdate);

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             5, 'codari4.jpg', 'codari4_0.jpg', 'codari4_0_t.jpg', 84244, sysdate);  
             
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             5, 'codari5.jpg', 'codari5_0.jpg', 'codari5_0_t.jpg', 84244, sysdate);  

-- 알탕          
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             4, 'altang1.jpg', 'altang1_1.jpg', 'altang1_1_t.jpg', 74194, sysdate);
             
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             4, 'altang2.jpg', 'altang2_2.jpg', 'altang2_2_t.jpg', 74194, sysdate);      

INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             4, 'altang3.jpg', 'altang3_2.jpg', 'altang3_2_t.jpg', 74194, sysdate);
             
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             4, 'altang4.jpg', 'altang4_2.jpg', 'altang4_2_t.jpg', 74194, sysdate);     
             
                
INSERT INTO pdatfile(pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(pdatfileno), 0) + 1 as pdatfileno FROM pdatfile),
             4, 'altang5.jpg', 'altang5_2.jpg', 'altang5_2_t.jpg', 74194, sysdate);
-- 2) 목록( pdcontentsno 기준 내림 차순, pdattachfileno 기준 오르차순)
SELECT pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate
FROM pdatfile
ORDER BY pdcontentsno DESC,  pdatfileno ASC;
 PDATFILENO PDCONTENTSNO FNAME        FUPNAME        THUMB            FSIZE  RDATE
 ---------- ------------ ------------ -------------- ---------------- ------ ---------------------
          4            6 hotpot1.jpg hotpot1.jpg   hotpot1_t.jpg   128733 2020-02-12 11:37:09.0
          5            6 hotpot2.jpg hotpot2_0.jpg hotpot2_0_t.jpg 104446 2020-02-12 11:37:09.0
          6            6 hotpot3.jpg hotpot3_0.jpg hotpot3_0_t.jpg 126043 2020-02-12 11:37:10.0
          7            6 hotpot4.jpg hotpot4_0.jpg hotpot4_0_t.jpg 125371 2020-02-12 11:37:10.0
          8            6 hotpot5.jpg hotpot5_0.jpg hotpot5_0_t.jpg 102275 2020-02-12 11:37:10.0
          9            5 codari1.jpg codari1.jpg   codari1_t.jpg    75479 2020-02-12 11:38:52.0
         10            5 codari2.jpg codari2_0.jpg codari2_0_t.jpg  59000 2020-02-12 11:38:52.0
         11            5 codari3.jpg codari3_0.jpg codari3_0_t.jpg  86049 2020-02-12 11:38:52.0
         12            5 codari4.jpg codari4_0.jpg codari4_0_t.jpg  69421 2020-02-12 11:38:52.0
         13            5 codari5.jpg codari5_0.jpg codari5_0_t.jpg  70530 2020-02-12 11:38:52.0
         14            4 altang1.jpg altang1_1.jpg altang1_1_t.jpg  75471 2020-02-12 11:39:18.0
         15            4 altang2.jpg altang2_2.jpg altang2_2_t.jpg  67539 2020-02-12 11:39:18.0
         16            4 altang3.jpg altang3_2.jpg altang3_2_t.jpg  62752 2020-02-12 11:39:18.0
         17            4 altang4.jpg altang4_2.jpg altang4_2_t.jpg  98842 2020-02-12 11:39:18.0
         18            4 altang5.jpg altang5_2.jpg altang5_2_t.jpg  82062 2020-02-12 11:39:18.0
           
-- 3) 글별 파일 목록(contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate
FROM pdatfile
WHERE pdcontentsno = 3
ORDER BY fname ASC;

 PDATTACHFILENO PDCONTENTSNO FNAME        FUPNAME        THUMB          FSIZE RDATE
 -------------- ------------ ------------ -------------- -------------- ----- ---------------------
              1            1 samyang.jpg  samyang_1.jpg  samyang_t.jpg   1000 2019-12-11 10:44:42.0
              2            1 samyang2.jpg samyang2_1.jpg samyang2_t.jpg  2000 2019-12-11 10:44:43.0
              3            1 samyang3.jpg samyang3_1.jpg samyang3_t.jpg  3000 2019-12-11 10:44:44.0

-- 4) 하나의 파일 삭제
DELETE FROM pdatfile
WHERE pdatfileno = 1;

-- 5) FK contentsno 부모 테이블별 레코드 갯수 산출
SELECT pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate
FROM pdatfile
WHERE pdcontentsno = 1;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB            FSIZE  RDATE
 ------------ ---------- ------------ -------------- ---------------- ------ ---------------------
            3          1 winter15.jpg winter15.jpg   winter15_t.jpg   443446 2019-12-04 16:00:11.0
            4          1 winter16.jpg winter16.jpg   winter16_t.jpg    99992 2019-12-04 16:00:11.0
            5          1 winter18.jpg winter18.jpg   winter18_t.jpg   120298 2019-12-04 16:00:11.0
            6          1 winter.zip   winter.zip     NULL             770036 2019-12-05 12:13:45.0
            8          1 winter20.jpg winter20.jpg   winter20_t.jpg    75726 2019-12-05 15:46:25.0
            1          1 winter12.jpg winter12_0.jpg winter12_0_t.jpg 395511 2019-12-04 16:00:11.0
            2          1 winter14.jpg winter14.jpg   winter14_t.jpg    84563 2019-12-04 16:00:11.0
            
SELECT COUNT(*) as cnt
FROM pdatfile
WHERE pdcontentsno = 1;

 CNT
 ---
   7   
             
-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM pdatfile
WHERE pdcontentsno = 6;

(3 rows affected)

-- 7) 조회
SELECT pdatfileno, pdcontentsno, fname, fupname, thumb, fsize, rdate
FROM pdatfile
WHERE pdatfileno = 1;