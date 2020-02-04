<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

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

</head>

<body>
<c:set var="cartgrpno" value="${cartgrpVO.cartgrpno}" />
<c:set var="cartno" value="${cart_productVO.cartno }" />

<jsp:include page="/menu/top.jsp" flush='false' />

  <ASIDE style='float: left;'>
    <A href='../cartgrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?cartgrpno=${cartgrpno }'>${cartgrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?cartgrpno=${cartgrpno }'>목록</A>
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="cartno" value="${cartno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>주문자 아이디 : ${cart_productVO.orderID} / </span>
            <span>등록일 : ${cart_productVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>상품명 : ${cart_productVO.title }</DIV>
          </li>
          <li class="li_none">
            <DIV>상품 수량 : ${cart_productVO.productCount }</DIV>
          </li>     
        </ul>
      </fieldset>
  </FORM>
  

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>