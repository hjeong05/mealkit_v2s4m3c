<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
$(function(){
 
});
</script>
 
<script type="text/javascript">

function update_form(cartgrpno, cartno) {
    
    var url = './update.do?cartgrpno=' + cartgrpno + '&cartno=' + cartno;
    var win = window.open(url, '카테고리 그룹 수정', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
function delete_form(cartgrpno, cartno) {
    
    var url = './delete.do?cartgrpno=' + cartgrpno + '&cartno=' + cartno;
    var win = window.open(url, '장바구니 삭제', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
</script>
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href="../cartgrp/list.do">장바구니 그룹</A> > 
    <A href='./list.do?cartgrpno=${cartgrpVO.cartgrpno }'>${cartgrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./create.do?memberno=1&cartgrpno=${cartgrpVO.cartgrpno }">등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 17%;"></col>
        <col style="width: 12%;"></col>
        <col style="width: 12%;"></col>
        <col style="width: 12%;"></col>
        <col style="width: 17%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>선택</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>주문자 ID</th>
          <th style='text-align: center;'>상품명</th>
          <th style='text-align: center;'>상품 수</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="cart_productVO" items="${list }">
          <c:set var="cartno" value="${cart_productVO.cartno }" />
          <tr style='text-align: center;'> 
            <td><input type="checkbox" name="check_product" value="${cart_productVO.cartno }"></td>
            <td>${cart_productVO.rdate.substring(0, 10)}</td>
            <td>${cart_productVO.orderID}</td>
            <td>
              <a href="./read.do?cartno=${cartno}">${cart_productVO.title}</a> 
            </td> 
            <td>${cart_productVO.productCount}</td>
            <td style='text-align: center;'>
              <a href="javascript:update_form(${cart_productVO.cartgrpno }, ${cart_productVO.cartno });"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="javascript:delete_form(${cart_productVO.cartgrpno }, ${cart_productVO.cartno });"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br>
    <div style='text-align: right;' >
      <button type='button' class='btn btn-primary' >주문</button>
    </div>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>