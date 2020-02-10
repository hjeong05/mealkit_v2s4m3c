<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Meal Kit</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

  <ASIDE style='float: left;'>
      마이페이지
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
 
  <div class='menu_line'></div>

  <div class="float-frame">
    <div class="float-unit">
      <DIV class='title_line' style="font-weight: bold; font-size: 18px;"><span class="glyphicon glyphicon-user"></span> 프로필</DIV> <br>
      <span style="font-size: 17px; font-weight: bold;">${mkmemberVO.mname } </span>  회원님<br><br>
      <span style="font-size: 17px; font-weight: bold;">아이디 </span> ${mkmemberVO.id }<br><br>
      <button type="button" onclick="location.href='./read.do?memberno=${memberno}&memcateno=${mkmemberVO.memcateno}&name=${param.name}'"  class="btn btn-primary btn-md">회원정보 수정</button>
    </div>
    <div class="float-unit">
      <DIV class='title_line' style="font-weight: bold; font-size: 18px;"><span class="glyphicon glyphicon-earphone"></span> 연락처</DIV> <br><br>
      <span style="font-size: 17px; font-weight: bold;">전화번호 </span> ${mkmemberVO.tel }<br><br>
      <button type="button" onclick="location.href='./read.do?memberno=${memberno}&memcateno=${mkmemberVO.memcateno}&name=${param.name}'"  class="btn btn-primary btn-md">회원정보 수정</button>
    </div>
    <br>
    <div class="float-unit">
      <DIV class='title_line' style="font-weight: bold; font-size: 18px;"><span class="glyphicon glyphicon-shopping-cart"></span> 주문 정보</DIV> 
      <br>
      장바구니 또는 주문내역을 확인할 수 있습니다.
      <br><br><br>
      <button type="button"  class="btn btn-primary btn-md" style="margin-right: 20px;" onclick="location.href='../cart/cartlist.do?cartgrpno=1&orderID=${sessionScope.id}'">일반배송 장바구니</button>
      <button type="button"  class="btn btn-primary btn-md" style="margin-right: 20px;" onclick="location.href='../cart/cartlist.do?cartgrpno=2&orderID=${sessionScope.id}'">정기배송 장바구니</button>
      <button type="button"  class="btn btn-primary btn-md" onclick="location.href='../pay/list.do?id=${sessionScope.id }'">주문내역</button>
    </div>
    <div class="float-unit">
      <DIV class='title_line' style="font-weight: bold; font-size: 18px;"><span class="glyphicon glyphicon-option-vertical"></span> 정보 관리</DIV>
      <br>
      패스워드를 변경하거나 Meal Kit를 탈퇴할 수 있습니다.
      <br><br><br>
      <button type="button" onclick="location.href='./passwd_update.do?memberno=${memberno}&memcateno=${param.memcateno}&nowPage=${nowPage}'"  class="btn btn-primary btn-md" style="margin-right: 20px;">비밀번호 변경</button>
      <button type="button" onclick="location.href='./withdraw.do?memberno=${sessionScope.memberno }'"  class="btn btn-primary btn-md">탈퇴</button>
    </div>
    <br>
  </div>
 
  <DIV class='bottom_menu'>
    <button type='button'  onclick="location.href='${pageContext.request.contextPath}'"  class="btn btn-primary btn-md">확인</button>  
    <button type='button' onclick="location.reload();" class="btn btn-primary btn-md">새로 고침</button>
  </DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>