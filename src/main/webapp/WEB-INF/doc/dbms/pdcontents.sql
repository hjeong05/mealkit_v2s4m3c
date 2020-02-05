/**********************************/
/* Table Name: pdcontents */
/**********************************/
DROP TABLE pdcontents CASCADE CONSTRAINTS; 

CREATE TABLE pdcontents(
		pdcontentsno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		productcateno                 NUMBER(10)		 NOT NULL,
		title                         		    VARCHAR2(300)		 NOT NULL,
		price                             NUMBER(10)    NOT NULL,
		content                       		CLOB		 NOT NULL,
		recom                         		NUMBER(5,1)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
		fname                            VARCHAR2(100)         NOT NULL,
    fupname                        VARCHAR2(100)         NOT NULL,
    thumb                           VARCHAR2(100)         NULL ,
    fsize                              NUMBER(10)         DEFAULT 0         NOT NULL,
		FOREIGN KEY (productcateno) REFERENCES productcate (productcateno)
);

COMMENT ON TABLE pdcontents is '상품컨텐츠';
COMMENT ON COLUMN pdcontents.productcateno is '상품 카테고리 번호';
COMMENT ON COLUMN pdcontents.title is '상품명';
COMMENT ON COLUMN pdcontents.content is '내용';
COMMENT ON COLUMN pdcontents.price is '가격';
COMMENT ON COLUMN pdcontents.recom is '평점';
COMMENT ON COLUMN pdcontents.cnt is '조회수';
COMMENT ON COLUMN pdcontents.replycnt is '댓글수';
COMMENT ON COLUMN pdcontents.rdate is '등록일';
COMMENT ON COLUMN pdcontents.word is '검색어';
COMMENT ON COLUMN pdcontents.fname is '원본 파일명';
COMMENT ON COLUMN pdcontents.fupname is '업로드 파일명';
COMMENT ON COLUMN pdcontents.thumb is 'Thumb 파일';
COMMENT ON COLUMN pdcontents.fsize is '파일 사이즈';

                              
 -- PK 생성
 SELECT NVL(MAX(pdcontentsno),0) + 1 as pdcontentsno FROM pdcontents;

 PDCONTENTSNO
 ------------
            1

 -- productcate 테이블 목록 확인 
SELECT productcateno, name, seqno, cnt
FROM productcate
ORDER BY seqno ASC; 

-- 1) contents 등록 (member:1, categrpno: 1),
--     varchar에 ''등록되면 null이 insert 됨. 
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '소고기듬뿍 버섯잡채', 19400, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef.jpg" style="width: 755px; height: 1200px;" type="image" />  <p><span style="font-size:36px"><strong>소고기듬뿍 버섯잡채</strong></span></p>    <div style="text-align:left"><span style="font-size:16px">기분 좋은 일이 있는 잔칫날이면 빠질 수 없는 메뉴가 바로 잡채인데요. 가족 모두 좋아하지만 재료 준비부터 엄두가 안나셨다면, 바로 COOKIT의 소고기듬뿍 버섯잡채 추천드립니다. 보내드리는 담백한 소고기 우둔살과 향긋한 세 가지 버섯, 신선한 네 가지 채소를 맛있는 간장양념에 버무려 주시기만 하면 양도 풍미도 최고!</span><br />  &nbsp;</div>    <div><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef1.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:24px"><strong>고소한 소고기와 다양한 버섯, 채소가 어우러져 기교 없어도 진한 맛</strong></span></div>    <p style="text-align:left">향긋하고 쫄깃한 버섯의 맛과 먹기좋게 채썬 푸짐한 소고기가 COOKIT 잡채의 차별점이죠. 시중에서 판매하는 어묵과 시금치로만 맛낸 잡채와는 확실히 다르다고 느끼실 거에요. 소소한 우리 가족의 일상도 COOKIT 소고기듬뿍 버섯잡채와 함께 기분 좋은 잔칫날처럼 보내시면 어떨까요.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef2.jpg" style="width: 780px; height: 520px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef3.jpg" style="width: 780px; height: 520px;" type="image" /></p>  <br />  <p style="text-align:left"><span style="font-size:24px"><strong>이렇게 보내드려요!</strong></span></p>    <div style="text-align:left"><span style="font-size:16px"><strong>3인분&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" style="height:23px; width:23px" title="enlightened" /></strong><br />  <strong>1.</strong>소고기 1팩&nbsp;&nbsp;&nbsp;<strong>2.</strong>당면 2팩&nbsp;&nbsp;&nbsp;<strong>3.</strong>간장불고기양념 1팩&nbsp;<strong>4.</strong>볶음용간장양념 1팩&nbsp;<strong>5.</strong>혼합채소 [적파프리카, 양파, 당근] 1팩&nbsp;&nbsp;&nbsp;<strong>6.</strong>혼합버섯 [표고버섯, 만가닥버섯, 느타리버섯] 1팩&nbsp;&nbsp;&nbsp;<strong>7.</strong>부추 1팩&nbsp;&nbsp;&nbsp;<strong>8.</strong>다진마늘 1팩 &nbsp;&nbsp;&nbsp;<strong>9.</strong>콩기름 1팩&nbsp;&nbsp;&nbsp;<strong>10.</strong>참기름 1병&nbsp;&nbsp;</span></div>    <p style="text-align:left"><strong><span style="color:#e74c3c"><span style="font-size:16px">*수급상황에 따라 일부 재료는 변경될 수 있습니다.</span></span></strong><br />  &nbsp;</p>    <p><strong><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef6.PNG" style="width: 600px; height: 546px;" type="image" /></span></span></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe1.PNG" style="width: 600px; height: 763px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe2.PNG" style="width: 422px; height: 546px;" type="image" /></p>    <div>&nbsp;</div>  </div>  </div>',
             0, 10, 0, sysdate, '소고기,잡채,버섯잡채,소고기잡채', 'japchae1.jpg', 'japchae1.jpg', 'japchae1_t.jpg', 92275);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '얼큰시원 알탕', 25000, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef.jpg" style="width: 755px; height: 1200px;" type="image" />  <p><span style="font-size:36px"><strong>소고기듬뿍 버섯잡채</strong></span></p>    <div style="text-align:left"><span style="font-size:16px">기분 좋은 일이 있는 잔칫날이면 빠질 수 없는 메뉴가 바로 잡채인데요. 가족 모두 좋아하지만 재료 준비부터 엄두가 안나셨다면, 바로 COOKIT의 소고기듬뿍 버섯잡채 추천드립니다. 보내드리는 담백한 소고기 우둔살과 향긋한 세 가지 버섯, 신선한 네 가지 채소를 맛있는 간장양념에 버무려 주시기만 하면 양도 풍미도 최고!</span><br />  &nbsp;</div>    <div><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef1.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:24px"><strong>고소한 소고기와 다양한 버섯, 채소가 어우러져 기교 없어도 진한 맛</strong></span></div>    <p style="text-align:left">향긋하고 쫄깃한 버섯의 맛과 먹기좋게 채썬 푸짐한 소고기가 COOKIT 잡채의 차별점이죠. 시중에서 판매하는 어묵과 시금치로만 맛낸 잡채와는 확실히 다르다고 느끼실 거에요. 소소한 우리 가족의 일상도 COOKIT 소고기듬뿍 버섯잡채와 함께 기분 좋은 잔칫날처럼 보내시면 어떨까요.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef2.jpg" style="width: 780px; height: 520px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef3.jpg" style="width: 780px; height: 520px;" type="image" /></p>  <br />  <p style="text-align:left"><span style="font-size:24px"><strong>이렇게 보내드려요!</strong></span></p>    <div style="text-align:left"><span style="font-size:16px"><strong>3인분&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" style="height:23px; width:23px" title="enlightened" /></strong><br />  <strong>1.</strong>소고기 1팩&nbsp;&nbsp;&nbsp;<strong>2.</strong>당면 2팩&nbsp;&nbsp;&nbsp;<strong>3.</strong>간장불고기양념 1팩&nbsp;<strong>4.</strong>볶음용간장양념 1팩&nbsp;<strong>5.</strong>혼합채소 [적파프리카, 양파, 당근] 1팩&nbsp;&nbsp;&nbsp;<strong>6.</strong>혼합버섯 [표고버섯, 만가닥버섯, 느타리버섯] 1팩&nbsp;&nbsp;&nbsp;<strong>7.</strong>부추 1팩&nbsp;&nbsp;&nbsp;<strong>8.</strong>다진마늘 1팩 &nbsp;&nbsp;&nbsp;<strong>9.</strong>콩기름 1팩&nbsp;&nbsp;&nbsp;<strong>10.</strong>참기름 1병&nbsp;&nbsp;</span></div>    <p style="text-align:left"><strong><span style="color:#e74c3c"><span style="font-size:16px">*수급상황에 따라 일부 재료는 변경될 수 있습니다.</span></span></strong><br />  &nbsp;</p>    <p><strong><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef6.PNG" style="width: 600px; height: 546px;" type="image" /></span></span></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe1.PNG" style="width: 600px; height: 763px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe2.PNG" style="width: 422px; height: 546px;" type="image" /></p>    <div>&nbsp;</div>  </div>  </div>',
             0, 10, 0, sysdate, '소고기,잡채,버섯잡채,소고기잡채', 'japchae1.jpg', 'japchae1.jpg', 'japchae1_t.jpg', 92275);
             
             
-- 2) 목록
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
ORDER BY pdcontentsno DESC;

PDCONTENTSNO PRODUCTCATENO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD FNAME       FUPNAME       THUMB         FSIZE
 ------------ ------------- ----- ------- ----- --- -------- --------------------- ---- ----------- ------------- ------------- -----
            1             1 비빔밥   내용1         0   0        0 2019-12-11 17:47:23.0 NULL bibmbap.jpg bibmbap_1.jpg bibmbap_t.jpg  1000
            
-- 3) productcate별 전체 목록
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE productcateno=1 --1: 한식, --2: 중식 
ORDER BY pdcontentsno DESC;

 PDCONTENTSNO PDTHUMBNO PRODUCTCATENO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------------ --------- ------------- ----- ------- ----- --- -------- --------------------- ----
            1         1             1 비빔밥   내용1         0   0        0 2019-12-11 16:55:02.0 NULL
         
-- 4) 전체 레코드 수 
SELECT COUNT(*) as count
FROM pdcontents;

 COUNT
 -----
     1
     
-- 5) 조회
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE pdcontentsno=2;
     
-- 6) 수정
UPDATE pdcontents
SET title='김치볶음밥', content='내용 수정', word='검색어'
WHERE pdcontentsno = 1;


-- 추천 수정
UPDATE pdcontents
SET recom= 3
WHERE pdcontentsno = 2;

SELECT pdcontentsno, productcateno, title, price, 
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE pdcontentsno=1;

-- 7) 삭제
DELETE FROM pdcontents
WHERE pdcontentsno = 1;


-- 8) FK 부모 테이블별 레코드 갯수 산출
SELECT pdcontentsno, productcateno, title, price, 
FROM pdcontents
WHERE productcateno = 1;

 MKCONTENTSNO PRODUCTCATENO TITLE
 ------------ ------------- -----
            1             1 제목 수정
            
SELECT COUNT(*) as cnt
FROM pdcontents
WHERE productcateno = 1;

 CNT
 ---
   1

   --- 여기까지 ㅇ12.09
-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM contents
WHERE categrpno = 1;

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE reply(
		rplyno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.rplyno is '댓글번호';
COMMENT ON COLUMN reply.contentsno is '컨텐츠번호';


/**********************************/
/* Table Name: 부서 */
/**********************************/
CREATE TABLE department(
		departmentno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE department is '부서';
COMMENT ON COLUMN department.departmentno is '부서번호';


/**********************************/
/* Table Name: 직원 */
/**********************************/
CREATE TABLE employee(
		employeeno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		departmentno                  		NUMBER(10)		 NULL ,
  FOREIGN KEY (departmentno) REFERENCES department (departmentno)
);

COMMENT ON TABLE employee is '직원';
COMMENT ON COLUMN employee.employeeno is '직원번호';
COMMENT ON COLUMN employee.departmentno is '부서번호';


/**********************************/
/* Table Name: 회원 로그인 내역 */
/**********************************/
CREATE TABLE login(
		loginno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE login is '회원 로그인 내역';
COMMENT ON COLUMN login.loginno is '로그인번호';
COMMENT ON COLUMN login.memberno is '회원번호';


/**********************************/
/* Table Name: 직원 로그인 내역 */
/**********************************/
CREATE TABLE login2(
		login2no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		employeeno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (employeeno) REFERENCES employee (employeeno)
);

COMMENT ON TABLE login2 is '직원 로그인 내역';
COMMENT ON COLUMN login2.login2no is '로그인번호2';
COMMENT ON COLUMN login2.employeeno is '직원번호';


/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
CREATE TABLE attachfile(
		attachfileno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE attachfile is '첨부파일';
COMMENT ON COLUMN attachfile.attachfileno is '첨부파일번호';
COMMENT ON COLUMN attachfile.contentsno is '컨텐츠번호';


