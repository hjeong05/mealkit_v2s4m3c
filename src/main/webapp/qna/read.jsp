<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>qna</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type = "text/javascript">

</script>
</head>

<body>
<c:set var="qnano" value="${qnaVO.qnano}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
   <A href='./list.do'>Q&A 목록</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?qnano=${qnano }'>목록</A>
    <c:if test="${sessionScope.id != null || sessionScope.id_admin != null}"> 
    <span class='menu_divide' > | </span> 
    <A href='./update.do?qnano=${qnano }'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?qnano=${qnano }'>삭제</A>
    </c:if>
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="qnano" value="${qnano}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${qnaVO.title}</span>
           
            <span>${qnaVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>${qnaVO.content }</DIV>
          </li>
         
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  