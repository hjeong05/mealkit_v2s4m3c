<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
 
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${count > 0 }">
          <LI class='li_none'><span class='span_success'>장바구니에 추가되었습니다.</span></LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'><span class='span_fail'>장바구니 추가에 실패했습니다.</span></LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <button type='button' class='btn btn-primary' onclick="window.close(); opener.location.href='./cartlist.do?cartgrpno=${param.cartgrpno}&orderID=${sessionScope.id}'">장바구니</button>
        <button type='button' class='btn btn-primary' onclick="window.close();">닫기</button>
      </LI>
     </UL>
  </fieldset>
 
</DIV>
 
</body>
 
</html> 
   