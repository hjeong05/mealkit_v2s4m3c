<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
           
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${count == 1 }">
          <LI class="li_none">
            <span class='span_success'>장바구니 수량을 수정했습니다.</span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class="li_none">
            <span class='span_fail'>장바구니 수량 수정에 실패했습니다.</span>
          </LI>
          <LI class="li_none">
            <span class='span_fail'>다시 시도해주세요.</span>
          </LI>
         </c:otherwise>
      </c:choose>
       <li class="li_none">
        <button type='button' class='btn btn-info' onclick="opener.location.reload(); window.close();">닫기</button>
       </li>
     </UL>
  </fieldset>
 
</DIV>
</body>
 
</html> 
  