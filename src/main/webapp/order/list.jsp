<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Meal Kit 장바구니 그룹</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
   
<script type="text/javascript">
function update_form(cartgrpno) {
    
    var url = './update.do?cartgrpno=' + cartgrpno;
    var win = window.open(url, '카테고리 그룹 수정', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
function delete_form(cartgrpno) {
    
    var url = './delete.do?cartgrpno=' + cartgrpno;
    var win = window.open(url, '카테고리 그룹 삭제', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
function same_info(f) {
  f.order_payGetName.value = f.order_payPostName.value;
  f.order_payGetTel.value = f.order_payPostTel.value;
  f.order_payGetAddress1.value = f.order_payPostAddress1.value;
  f.order_payGetAddress2.value = f.order_payPostAddress2.value;
}

function load_info(f) {
  id = f.id.value;
  var params = "id=" + id;
    $.ajax({
      url: "./load_member.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        f.order_payPostName.value = rdata.mname;
        f.order_payPostTel.value = rdata.tel;
        f.order_payPostAddress1.value = rdata.address1;
        f.order_payPostAddress2.value = rdata.address2;
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
}
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />

 <DIV class='title_line'>주문</DIV>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <input type="hidden" name='order_pay_grpStatus' value='결제 완료'>
    <input type="hidden" name='cartno_list' value=${param.cartno_list }>
    <input type="hidden" name='id' value='${sessionScope.id }'>
    <input type="hidden" name='cartno' value=${cartno }>
    <div> <!-- 주문자 정보 시작 -->
      <div style='text-align: left; font-weight: bold; font-size: 24px; margin-left: 20px;'>
        주문자 정보
        <span style="font-weight:normal; font-size:16px;">
          기본 정보
          <input type="checkbox" name='load' onclick='load_info(document.frm);'>
        </span>
      </div>
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; float: left; width:170px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>주문자 명</span>
      <input type='text' class="form-control input-lg" name='order_payPostName' value='' placeholder="주문자 명" required="required" style='width: 20%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>전화 번호</span>
      <input type='tel' class="form-control input-lg" name='order_payPostTel' value='' placeholder="전화 번호" required="required" style='width: 20%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style=' text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>주소</span>
      <input type='text' class="form-control input-lg" name='order_payPostAddress1' value='' placeholder="주소" required="required" style='width: 30%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>상세 주소</span>
      <input type='text' class="form-control input-lg" name='order_payPostAddress2' value='' placeholder="상세 주소" required="required" style='width: 45%; float: left; '>
      </div>
    </div> <!-- 주문자 정보 끝 -->
    <br><br><br>
    
    <div style='clear: both;'> <!-- 배송지 정보 시작 -->
      <div style='text-align: left; font-weight: bold; font-size: 24px; margin-left: 20px;'>
        배송지
      <span style="font-weight:normal; font-size:16px;">
        주문자 정보와 일치
        <input type="checkbox" name='same' onclick='same_info(document.frm);'>
      </span>
      </div>
      
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; float: left; width:170px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>받는 분</span>
      <input type='text' class="form-control input-lg" name='order_payGetName' value='' placeholder="수령자 명" required="required" style='width: 20%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>전화 번호</span>
      <input type='tel' class="form-control input-lg" name='order_payGetTel' value='' placeholder="전화 번호" required="required" style='width: 20%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style=' text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>주소</span>
      <input type='text' class="form-control input-lg" name='order_payGetAddress1' value='' placeholder="주소" required="required" style='width: 30%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>상세 주소</span>
      <input type='text' class="form-control input-lg" name='order_payGetAddress2' value='' placeholder="상세 주소" required="required" style='width: 45%; float: left; '>
      </div>
      <div style='clear: both;'>
      <span style='text-align: left; font-size: 18px; width:170px; float: left; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>요청 사항</span>
      <input type='text' class="form-control input-lg" name='order_payGetRequest' value='' placeholder="요청 사항" required="required" style='width: 45%; float: left; '>
      </div>
    </div> <!-- 배송지 정보 끝 -->
    
    <br><br><br>
    
    <div style='clear: both;'> <!-- 배송될 상품 정보 시작 -->
      <div style='text-align: left; font-weight: bold; font-size: 24px; margin-left: 20px;'>상품 정보</div>
      <table class="table table-striped" style='width: 100%;'>
        <colgroup>
            <col style="width: 25%;"></col>
            <col style="width: 35%;"></col>
            <col style="width: 15%;"></col>
            <col style="width: 25%;"></col>
          </colgroup>
        
        <%-- table 내용 --%>
        <tbody><c:forEach var="cart_productVO" items="${list }">
            <c:set var="cartno" value="${cart_productVO.cartno }" />
            <tr style='text-align: center;'>
              <td style='display:table-cell; vertical-align: middle;'><IMG src="../pdcontents/storage/${cart_productVO.thumb }" style='width:100px;'></td>
              <td style='display:table-cell; vertical-align: middle;'>
                <a href="./read.do?cartno=${cartno}">${cart_productVO.title}</a> 
              </td> 
              <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.productCount}개</td> 
              <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.price}원</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <div style='text-align: right; font-weight: bold; font-size: 24px; margin-right: 20px;'>
        총 금액 : ${total_price }
      </div>
    </div> <!-- 배송될 상품 정보 끝 -->
    
    <br><br><br>
   
   <div style='clear: both;'> <!-- 결제 수단 시작 -->
      <div style='text-align: left; font-weight: bold; font-size: 24px; margin: 0px 0px 10px 20px;'>결제 수단</div>
      <ul class="nav nav-tabs">
        <li class="active" style='text-align:center; width:33%;'><a data-toggle="tab" href="#menu1" >신용 카드</a></li>
        <li style='text-align:center; width:33%;'><a data-toggle="tab" href="#menu2" >모바일 결제</a></li>
        <li style='text-align:center; width:33%;'><a data-toggle="tab" href="#menu3" >실시간 계좌이체</a></li>
      </ul>
   </div>
   <div class="tab-content">
      <div id="menu1" class="tab-pane fade in active">
      <br><br>
        <div style='clear: both;'>
          <span style='text-align: left; font-size: 18px; float: left; width:100px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>카드 종류 : </span>
          <select name='order_pay_grpMethod' class="form-control" style='width:150px;'>
            <option selected="selected">카드선택</option>
            <option value='신용카드-신한'>신한카드</option>
            <option value='신용카드-하나'>하나카드</option>
            <option value='신용카드-KB국민'>KB국민 카드</option>
            <option value='신용카드-삼성'>삼성카드</option>
            <option value='신용카드-우리'>우리카드</option>
            <option value='신용카드-BC'>BC카드</option>
            <option value='신용카드-현대'>현대카드</option>
          </select>
        </div>
        <div style='clear: both;'>
          <span style='text-align: left; font-size: 18px; float: left; width:100px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>할부 선택 : </span>
          <select name='month' class="form-control" style='width:150px;'>
            <option selected="selected">할부 선택</option>
            <option value='now'>일시불</option>
            <option value='3month'>3개월</option>
            <option value='6month'>6개월</option>
          </select>
        </div>
      </div>
      <div id="menu2" class="tab-pane fade">
      <br><br>
        <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>통신사 선택 : </span>
        <select name='order_pay_grpMethod' class="form-control" style='width:150px;'>
          <option selected="selected">통신사</option>
          <option value='모바일-KT'>KT</option>
          <option value='모바일-SKT'>SKT</option>
          <option value='모바일-LG'>LG</option>
        </select>
        <div style='clear: both;'>
          <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>전화 번호 : </span>
          <input type='tel' class="form-control input-lg" name='mobile_phone' value='' placeholder="전화 번호" style='width: 150px; float: left; '>
        </div>
        <div style='clear: both;'>
         <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>이름 : </span>
         <input type='text' class="form-control input-lg" name='mobile_name' value='' placeholder="이름" style='width: 150px; float: left; '>
        </div>
        <div style='clear: both;'>
          <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>생년월일 : </span>
          <input type='text' class="form-control input-lg" name='mobile_birth' value='' placeholder="생년월일" style='width: 150px; float: left; '>
        </div>
      </div>
      <div id="menu3" class="tab-pane fade">
        <br><br>
        <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>은행 선택 : </span>
        <select name='order_pay_grpMethod' class="form-control" style='width:150px;'>
          <option selected="selected">은행 선택</option>
          <option value='계좌이체-KB'>KB국민 은행</option>
          <option value='계좌이체-신한'>신한 은행</option>
          <option value='계좌이체-농협'>농협 은행</option>
          <option value='계좌이체-하나'>하나 은행</option>
          <option value='계좌이체-신협'>신협 은행</option>
          <option value='계좌이체-우리'>우리 은행</option>
          <option value='계좌이체-카카오'>카카오 뱅크</option>
          <option value='계좌이체-케이'>케이 뱅크</option>
        </select>
        <div style='clear: both;'>
         <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>이름 : </span>
         <input type='text' class="form-control input-lg" name='account_name' value='' placeholder="이름" style='width: 150px; float: left; '>
        </div>
        <div style='clear: both;'>
          <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>생년월일 : </span>
          <input type='text' class="form-control input-lg" name='account_birth' value='' placeholder="생년월일" style='width: 150px; float: left; '>
        </div>
        <div style='clear: both;'>
          <span style='text-align: left; font-size: 18px; float: left; width:120px; height:46px; margin: 0px 0px 5px 30px; padding-top: 8px;'>계좌 번호 : </span>
          <input type='text' class="form-control input-lg" name='account_num' value='' placeholder="계좌 번호" style='width: 240px; float: left; '>
        </div>
      </div>
      <br><br>
    </div><!-- 결제 수단 끝 -->
    <div style='text-align: right;'> <!-- 결제 버튼 시작 -->
      <button type='submit' class='btn btn-primary'>결제</button>
    </div><!-- 결제 버튼 끝 -->
  </FORM>
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 