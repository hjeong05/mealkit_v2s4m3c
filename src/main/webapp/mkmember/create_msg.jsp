<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Meal Kit</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count == 1 }">
          <LI class='li_none'>회원가입이 완료되었습니다.</LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>회원가입에 실패했습니다.</LI>
          <LI class='li_none'>다시 한 번 시도해주세요.</LI>
          <LI class='li_none'>계속 실패시 ☏000-0000-0000 문의해주세요.</LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
        <c:when test="${sessionScope.id_admin == null}"> <!-- 관리자 로그인 되어있지 않을 때 -->
          <button type='button'  onclick="location.href='${pageContext.request.contextPath}'"  class="btn btn-primary">확인</button>  
        </c:when>
        <c:otherwise> <!-- 관리자 로그인 되어있을 때 -->
         <button type='button' onclick="location.href='./create.do?memcateno=${param.memcateno}'"class="btn btn-primary">회원 등록</button>
         <button type='button' onclick="location.href='./list.do?memcateno=${param.memcateno}&nowPage=${param.nowPage}'" class="btn btn-primary">목록</button>
        </c:otherwise>
        </c:choose>
      </LI>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 