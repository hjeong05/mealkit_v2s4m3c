<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
<script type="text/javascript">
$(function(){
 
});
</script>
 
<script type="text/javascript">
</script>
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
  질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요. → 
  <button type='button' onclick="location.href='../faq_cate/list.do'"  class="btn btn-info">FAQ</button>
<%--    <c:forEach var="qnaVO" items="${list }">--%>
     <%--  <A href=' ./choice_list.do?choice=${param.choice}' > 배송 |</A>
      <A href=' ./choice_list.do?choice=${qnaVO.choice }' >주문 결제 |</A>
      <A href=' ./choice_list.do?choice=${qnaVO.choice }' > 상품/재입고문의 |</A>
      <A href=' ./choice_list.do?choice=${qnaVO.choice }' > 불량 |</A>
      <A href=' ./choice_list.do?choice=${qnaVO.choice }' > 회원 관련 |</A>
      <A href=' ./choice_list.do?choice=${qnaVO.choice }' >기타 문의</A> --%>
  </ASIDE>
<%-- </c:forEach> --%>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
     <%-- <c:if test="${sessionScope.id != null}"> --%>
    <span class='menu_divide' >│</span> 
    <A href=' ./create.do' >등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
      <c:choose>
          <c:when test="${sessionScope.id != null || sessionScope.id_admin != null}">
            <col style="width: 20%;"></col>
            <col style="width: 30%;"></col>
            <col style="width: 25%;"></col>
            <col style="width: 25%;"></col>
            
          </c:when>
          <c:otherwise>
            <col style="width: 20%;"></col>
            <col style="width: 50%;"></col>
            <col style="width: 30%;"></col>

          </c:otherwise>

        </c:choose>  
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <!-- <th style='text-align: center;'>순서</th> -->
          
          <th style='text-align: center;'>질문유형</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'><c:if test="${sessionScope.id != null || sessionScope.id_admin != null}">기타</c:if></th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="qnaVO" items="${list }"> <!-- 컨트롤러에서 저장해준 리스트 -->
          <c:set var = "qnano" value="${qnaVO.qnano }"/>
          <tr> 
            <%-- <td style='text-align: center;'>${qnaVO.qnano}</td> --%>
            
            <td style='text-align: center;'>${qnaVO.choice}</td>
             <td style='text-align: center;'>
              <a href="./read.do?qnano=${qnano}">${qnaVO.title}</a> 
            </td> 
            
            <td style='text-align: center;'>${qnaVO.rdate.substring(0, 10)}</td>
            
            
            <td style='text-align: center;'>
            <c:if test="${sessionScope.id != null || sessionScope.id_admin != null}">
              <a href="./update.do?qnano=${qnano}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?qnano=${qnano}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
             </c:if>
      
             </td>
             
             
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  