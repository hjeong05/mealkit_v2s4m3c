/**********************************/
/* Table Name: pdcontents */
/**********************************/
DROP TABLE pdcontents CASCADE CONSTRAINTS; 

DROP TABLE pdcontents;
CREATE TABLE pdcontents(
		pdcontentsno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		productcateno                 NUMBER(10)		 NOT NULL,
		title                         		    VARCHAR2(300)		 NOT NULL,
		price                             NUMBER(10)    NOT NULL,
		content                       		CLOB		 NOT NULL,
		recom                         		NUMBER(5,2)		 DEFAULT 0		 NOT NULL,
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

DELETE FROM PDCONTENTS;
-- 1) contents 등록 (member:1, categrpno: 1),
--     varchar에 ''등록되면 null이 insert 됨. 

-- 한식 카테고리 번호 확인후 일식 카테고리에 insert
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              4, '소고기듬뿍 버섯잡채', 19400, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef.jpg" style="width: 755px; height: 1200px;" type="image" />  <p><span style="font-size:36px"><strong>소고기듬뿍 버섯잡채</strong></span></p>    <div style="text-align:left"><span style="font-size:16px">기분 좋은 일이 있는 잔칫날이면 빠질 수 없는 메뉴가 바로 잡채인데요. 가족 모두 좋아하지만 재료 준비부터 엄두가 안나셨다면, 바로 COOKIT의 소고기듬뿍 버섯잡채 추천드립니다. 보내드리는 담백한 소고기 우둔살과 향긋한 세 가지 버섯, 신선한 네 가지 채소를 맛있는 간장양념에 버무려 주시기만 하면 양도 풍미도 최고!</span><br />  &nbsp;</div>    <div><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef1.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:24px"><strong>고소한 소고기와 다양한 버섯, 채소가 어우러져 기교 없어도 진한 맛</strong></span></div>    <p style="text-align:left">향긋하고 쫄깃한 버섯의 맛과 먹기좋게 채썬 푸짐한 소고기가 COOKIT 잡채의 차별점이죠. 시중에서 판매하는 어묵과 시금치로만 맛낸 잡채와는 확실히 다르다고 느끼실 거에요. 소소한 우리 가족의 일상도 COOKIT 소고기듬뿍 버섯잡채와 함께 기분 좋은 잔칫날처럼 보내시면 어떨까요.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef2.jpg" style="width: 780px; height: 520px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef3.jpg" style="width: 780px; height: 520px;" type="image" /></p>  <br />  <p style="text-align:left"><span style="font-size:24px"><strong>이렇게 보내드려요!</strong></span></p>    <div style="text-align:left"><span style="font-size:16px"><strong>3인분&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" style="height:23px; width:23px" title="enlightened" /></strong><br />  <strong>1.</strong>소고기 1팩&nbsp;&nbsp;&nbsp;<strong>2.</strong>당면 2팩&nbsp;&nbsp;&nbsp;<strong>3.</strong>간장불고기양념 1팩&nbsp;<strong>4.</strong>볶음용간장양념 1팩&nbsp;<strong>5.</strong>혼합채소 [적파프리카, 양파, 당근] 1팩&nbsp;&nbsp;&nbsp;<strong>6.</strong>혼합버섯 [표고버섯, 만가닥버섯, 느타리버섯] 1팩&nbsp;&nbsp;&nbsp;<strong>7.</strong>부추 1팩&nbsp;&nbsp;&nbsp;<strong>8.</strong>다진마늘 1팩 &nbsp;&nbsp;&nbsp;<strong>9.</strong>콩기름 1팩&nbsp;&nbsp;&nbsp;<strong>10.</strong>참기름 1병&nbsp;&nbsp;</span></div>    <p style="text-align:left"><strong><span style="color:#e74c3c"><span style="font-size:16px">*수급상황에 따라 일부 재료는 변경될 수 있습니다.</span></span></strong><br />  &nbsp;</p>    <p><strong><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/beef6.PNG" style="width: 600px; height: 546px;" type="image" /></span></span></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe1.PNG" style="width: 600px; height: 763px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EC%9E%A1%EC%B1%84/receipe2.PNG" style="width: 422px; height: 546px;" type="image" /></p>    <div>&nbsp;</div>  </div>  </div>',
             0, 10, 0, sysdate, '소고기,잡채,버섯잡채,소고기잡채', 'japchae1.jpg', 'japchae1.jpg', 'japchae1_t.jpg', 92275);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '얼큰시원 알탕', 25000, '<input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_1.jpg" style="width: 755px; height: 1200px;" type="image" />  <p style="text-align:center"><span style="font-size:28px"><strong>얼큰 시원 알탕</strong></span></p>  가끔 피곤할 때 시원한 국물에 반주 한 잔 곁들인 식사도 하고 싶잖아요. 아이들이 좋아하는 메뉴도 좋지만, 고생하는 우리 부부를 위한 메뉴 어떠세요. COOKIT 알탕이라면 보글보글 끓어오르는 시원하고 칼칼한 메뉴에 반주 한 잔 하면서 도란도란 이야기를 나누는 따뜻한 식사가 될 거에요.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_2.gif" style="width: 780px; height: 500px;" type="image" /><br />  <span style="font-size:16px"><strong>신선한 명란과 곤이, 푸짐한 콩나물, 쑥갓, 팽이버섯, 양파, 대파, 고추를 아낌없이</strong></span>    <p>신선한 명란과 곤이, 푸짐한 콩나물, 쑥갓, 팽이버섯, 양파, 대파, 고추를 아낌없이 넣고 끓여주면 시원한 맛이 우러나요. 텁텁하지 않고 깔끔하고 개운하게 맛을 잡아 계속 떠먹게 되는 그런 국물이죠.</p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_3.jpg" style="width: 780px; height: 1115px;" type="image" /></p>    <p><input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_4.jpg" style="width: 780px; height: 520px;" type="image" /></p>  &nbsp;    <p><strong>이렇게 보내드려요!</strong></p>  <strong>3인분&nbsp;<img alt="enlightened" src="http://localhost:9090/mealkit/ckeditor/plugins/smiley/images/lightbulb.png" title="enlightened" /><br />  1.</strong>알탕소스 1팩&nbsp;<strong>2.</strong>명란 1팩&nbsp;<strong>3.</strong>곤이 1팩&nbsp;<strong>4.</strong>콩나물 1팩&nbsp;<strong>5.</strong>무 1팩&nbsp;<strong>6.</strong>고춧가루 1팩&nbsp;<strong>7.</strong>혼합채소Ⅰ[팽이버섯, 쑥갓]1팩&nbsp;<strong>8.</strong>혼합채소Ⅱ[양파, 청양고추, 홍고추, 대파]1팩&nbsp;<strong>9.</strong>두부 1팩&nbsp;<strong>10.</strong>다진마늘 1팩    <p><strong>*수급상황에 따라 일부 재료는 변경될 수 있습니다.</strong><br />  &nbsp;</p>    <p><strong><input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_5.jpg" style="width: 780px; height: 480px;" type="image" /></strong><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%95%8C%ED%83%95/altang_6.PNG" style="width: 732px; height: 619px;" type="image" /></p>    <p><strong>시원한 알탕 맛있게 먹는 방법</strong></p>    <p>1.명란과 곤이 세척 팁! 세척을 원하시면 소금물(또는 수돗물)에 &#39;살살&#39; 헹구세요. 흐르는 물에 헹구면 명란이 풀어질 수 있어요.<br />  2.명란 끝이 초록색으로 변한 것은 쓸개가 닿았던 부위로 드셔도 무해합니다. 혹시 쓴맛이 날 수 있으니 잘라내고 조리하셔도 됩니다.</p>'
              ,0, 10, 0, sysdate, '알탕,얼큰,국물,시원한 국물,시원', 'altang1.jpg', 'altang1.jpg', 'altang1_t.jpg', 75471);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '속초식 코다리찜', 18600, '<p style="text-align:center"><span style="font-size:36px"><strong><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_01.jpg" style="height:1200px; width:755px" type="image" /><br />  속초식 코다리찜</strong></span></p>  <span style="font-size:16px">요즘 같이 찬 바람이 불어오면 더 맛있게 느껴지는 재료, 혹시 아시나요? 정답은 바로 코다리! 명태를 손질한 후, 살짝 건조시켜 쫄깃한 맛이 매력적인 식재료입니다. 코다리는 찜으로 요리하면 더 맛있어지는데요, 그래서 COOKIT이 준비했습니다.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_02.gif" style="height:500px; width:780px" type="image" /></span><br />  <span style="font-size:20px"><strong>구운 김에 코다리살과 아삭한 콩나물을 얹으니 별미</strong></span>    <p><span style="font-size:16px">살이 많아 부드러우면서도 쫀득한 코다리와 큼직하게 썰어낸 무를 COOKIT이 보내드리는 양념에 자작하게 졸여내기만 하면 되는 간편한 메뉴인데요. 함께 보내드리는 구운 김에 발라낸 통통한 코다리 살과 아삭한 콩나물을 얹어 함께 먹는 맛이 별미입니다. 매콤달콤 짭짤한 양념에 가정에 있는 밥을 양념에 비벼서 함께 싸 드시면 든든함에 절로 웃음이 나실 거에요.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_03.jpg" style="height:520px; width:780px" type="image" /><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_04.jpg" style="height:520px; width:780px" type="image" /></span></p>    <p><span style="font-size:16px"><strong>이렇게 보내드려요!</strong></span></p>    <hr /><span style="font-size:16px">3인분<br />  <strong>1.</strong>코다리 1팩&nbsp;&nbsp;&nbsp;<strong>2.</strong>조림용고추장양념 1팩&nbsp;&nbsp;&nbsp;<strong>3.</strong>혼합채소 [꽈리고추, 청양고추] 1팩&nbsp;&nbsp;&nbsp;<strong>4.</strong>무 1팩&nbsp;&nbsp;&nbsp;<strong>5.</strong>콩나물 1팩&nbsp;&nbsp;&nbsp;<strong>6.</strong>구운 김 1팩&nbsp;&nbsp;&nbsp;<strong>7.</strong>고추기름 1팩&nbsp;&nbsp;&nbsp;<strong>8.</strong>고춧가루 1팩&nbsp;&nbsp;</span>    <p><span style="color:#e74c3c"><span style="font-size:16px">*수급상황에 따라 일부 재료는 변경될 수 있습니다.</span></span><br />  &nbsp;</p>    <p style="text-align:center"><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_07.PNG" style="height:575px; width:717px" type="image" /></span></span></p>    <p style="text-align:center"><span style="color:#e74c3c"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_08.PNG" style="height:605px; width:650px" type="image" /></span></span><input alt="" src="/mealkit/ckstorage/images/%EC%BD%94%EB%8B%A4%EB%A6%AC%EC%B0%9C/codari_09.PNG" style="height:576px; width:715px" type="image" /></p>'
              ,0, 10, 0, sysdate, '코다리찜,코다리,찜', 'codari.jpg', 'codari.jpg', 'codari_t.jpg', 23005);

INSERT INTO pdcontents(pdcontentsno, 
                  productcateno, title, price, content,
                  recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '소고기두부전골', 24800, '<p style="text-align:center"><span style="font-size:28px"><strong><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_01.jpg" style="height:1200px; width:755px" type="image" /><br />  소고기두부전골</strong></span></p>  <span style="font-size:16px">고소하고 담백한 두부와 얇게 썰린 소고기의 감칠맛이 어우러진 소고기 두부전골을 소개합니다. 과하게 얼큰하거나 칼칼해서 자극적인 국물이 아니라, 사골베이스의 국물에 재료 본연의 맛이 조화롭게 어우러지는 전골 요리로 요리시간이 짧고 간편해서 바쁜 평일 저녁에도 맛있게 드실 수 있어요.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_02.gif" style="height:500px; width:780px" type="image" /></span><br />  <span style="font-size:20px"><strong>고소한 두부, 소고기, 다양한 버섯과 야채가 어우러져 기교 없어도 진한 맛</strong></span>    <p><span style="font-size:16px">고소한 두부와 세 가지 버섯(팽이버섯,새송이버섯,애느타리버섯), 당면, 쑥갓, 김치, 애호박이 고루 들어간 남한산성 부근에서 유명한 두부전골을 이제 집에서 드셔보세요. 진하면서도 건강한 맛이라 가족 모두 좋아할거에요.<br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_03.jpg" style="height:520px; width:780px" type="image" /><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_04.jpg" style="height:520px; width:780px" type="image" /></span></p>    <p><span style="font-size:20px"><strong>이렇게 보내드려요!</strong></span></p>    <hr /><span style="font-size:16px">3인분<br />  <strong>1.</strong>소고기 1팩&nbsp;&nbsp;&nbsp;<strong>2.</strong>전골용 간장양념 1팩&nbsp;&nbsp;&nbsp;<strong>3.</strong>사골농축소스 2팩&nbsp;&nbsp;&nbsp;<strong>4.</strong>혼합채소I [대파, 애호박, 새송이버섯, 애느타리버섯]&nbsp;&nbsp;&nbsp;<strong>5.</strong>혼합채소II [팽이버섯, 쑥갓]&nbsp;&nbsp;&nbsp;<strong>6.</strong>배추김치 1팩&nbsp;&nbsp;&nbsp;<strong>7.</strong>고춧가루 1팩&nbsp;&nbsp;&nbsp;<strong>8.</strong>다진마늘 1팩 &nbsp;&nbsp;&nbsp;<strong>9.</strong>당면 1팩&nbsp;&nbsp;&nbsp;<strong>10.</strong>두부 1팩&nbsp;&nbsp;</span>    <p><span style="color:#e74c3c"><strong>*수급상황에 따라 일부 재료는 변경될 수 있습니다.<br />  <br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_05.jpg" style="height:480px; width:780px" type="image" /></strong></span></p>    <p><strong><span style="font-size:20px">요리 전 준비하세요!</span></strong></p>    <hr />  <p><span style="font-size:16px">30분<br />  준비하실 재료물 1400ml(종이컵 기준 약 7컵)필요한 조리도구전골냄비, 그릇, 국자, 키친타올</span></p>    <p style="text-align:center"><span style="font-size:16px"><input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_06.PNG" style="height:671px; width:560px" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%91%90%EB%B6%80%EC%A0%84%EA%B3%A8/tofustew_07.PNG" style="height:640px; width:527px" type="image" /></span></p>'
              ,0, 10, 0, sysdate, '두부전골,전골,소고기,소고기두부전골', 'tofustew.jpg', 'tofustew.jpg', 'tofustew_t.jpg', 34726);

-- 일식 카테고리 번호 확인후 일식 카테고리에 insert
INSERT INTO pdcontents(pdcontentsno, 
                  productcateno, title, price, content,
                  recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              3, '밀푀유나베', 24800, '<div style="text-align:center"><input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_01.jpg" style="width: 763px; height: 1200px;" type="image" />  <p><span style="font-size:28px"><strong>밀푀유나베</strong></span></p>    <div><span style="font-size:16px">맛있으면서도 신경 쓴 듯한 인상을 줄 수 있는 요리. 평범한 식탁을, 매일 먹는 식사를 조금 특별하게 즐기고 싶다는 생각이 든다면, 주저말고 경험해보세요. 보내드리는 재료를 겹겹이 쌓아 냄비에 차곡차곡 쌓아주고 육수를 부어 한번 보글보글 끓여내면 완성되니까, 작은 노력으로 큰 만족을<br />  얻으실 거에요.<br />  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_02.gif" style="width: 780px; height: 500px;" type="image" /></span>    <div style="text-align:left"><span style="font-size:20px"><strong>담백하면서도 깔끔한 일본식 나베요리</strong></span></div>    <p style="text-align:left"><span style="font-size:16px">가쓰오부시를 우려낸 육수로 깊지만 담백하면서도 깔끔한 일본식 나베요리의 맛을 살렸어요. 취향에 맞게 다양한 맛을 즐기실 수 있도록 유자폰즈소스와 오곡참깨소스를 함께 보내드려요. 담백하면서도 깔끔한 국물을 한 입 드시고, 푸짐하게 겹겹히 쌓인 야채와 고기는 취향에 따라 두 가지 소스에 찍어서 다채로운 맛을 즐겨보세요. 밀푀유 나베를 맛있게 즐기신 후, 남은 육수에 보내드린 칼국수 면을 넣어 한소끔 끓여내면 또 다른 별미가 완성되죠.</span></p>  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_03.jpg" style="width: 780px; height: 520px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_04.jpg" style="width: 780px; height: 520px;" type="image" />  <div style="text-align:left">  <p><span style="font-size:20px"><strong>이렇게 보내드려요!</strong></span></p>    <hr /><span style="font-size:16px">3인분<br />  <strong>1.</strong>소고기 1팩&nbsp;<strong>2.</strong>단호박 1팩&nbsp;<strong>3.</strong>혼합채소 (배춧잎,깻잎) 1팩&nbsp;<strong>4.</strong>혼합버섯 (만가닥버섯, 표고버섯, 팽이버섯) 1팩&nbsp;<strong>5.</strong>청경채 1팩&nbsp;<strong>6.</strong>가쓰오육수 2팩&nbsp;<strong>7.</strong>칼국수 1팩&nbsp;<strong>8.</strong>디핑소스 I (유자폰즈소스) 1팩&nbsp;<strong>9.</strong>디핑소스II (오곡참깨소스) 1개</span>    <p><strong><span style="color:#2980b9">*수급상황에 따라 배추는 베타카로틴 배추로 제공될 수 있습니다.<br />  (베타카로틴 배추는 더 고소한 맛을 띄는 품종으로, 뿌리부분에 짙은 노란색 또는 붉은색이 특징입니다)</span></strong><br />  <br />  <strong><span style="color:#e74c3c">*수급상황에 따라 일부 재료는 변경될 수 있습니다.</span></strong></p>    <p style="text-align:center"><strong><span style="color:#e74c3c"><input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_05.jpg" style="width: 780px; height: 480px;" type="image" /><br />  <input alt="" src="/mealkit/ckstorage/images/%EB%B0%80%ED%91%80%EC%9C%A0%EB%82%98%EB%B2%A0/nabe_06.PNG" style="width: 530px; height: 491px;" type="image" /></span></strong></p>  </div>  </div>  </div>'
              ,0, 10, 0, sysdate, '나베,밀푀유,밀푀유나베', 'nabe.jpg', 'nabe.jpg', 'nabe_t.jpg', 25888);
              
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
    
SELECT pdcontentsno, productcateno, title,content
                              recom,cnt,replycnt
FROM pdcontents;

-- 6) 수정
UPDATE pdcontents
SET title='김치볶음밥', content='내용 수정', word='검색어'
WHERE pdcontentsno = 1;

-- 댓글 수 0 초기화
UPDATE pdcontents
SET replycnt=0;

-- recom 0 초기화
UPDATE pdcontents
SET recom = 0;

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


