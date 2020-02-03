<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>delete_by_categrp_msg</title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
           
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
<div style="display:table; width: 100%; height:300px;">       
<div style="display:table-cell; vertical-align: middle">      
<DIV class='title_line'>알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count >= 1 }">
           <LI class="li_none">
            <span class='span_success'>컨텐츠를 삭제했습니다.</span>
           </LI>
            <li class="li_none">
              <button type='button' class='btn btn-info' onclick="location.href='../cartgrp/delete.do?cartgrpno=${param.cartgrpno }'">
              계속 삭제 진행
              </button>
              <button type='button' class='btn btn-info' onclick="opener.location.reload(); window.close();">
              삭제 중지
              </button>
            </li>
        </c:when>
        <c:otherwise>
          <LI class="li_none">
            <span class='span_fail'>컨텐츠 삭제에 실패했습니다.</span>
          </LI>
            
          <LI class="li_none">
            <span class='span_fail'>다시 시도해주세요.</span>
          </LI>
          <li class="li_none">
            <button type='button' class='btn btn-info' onclick="opener.location.reload(); window.close();">닫기</button>
          </li>
         </c:otherwise>
      </c:choose>
     </UL>
  </fieldset>
 
</DIV>
 
</div>
</div>
</body>
 
</html> 
  