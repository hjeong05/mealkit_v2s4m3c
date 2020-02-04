<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>
</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

  <form name="frm" id="frm" method="get" action="./list.do">
  <input type="hidden" name="faq_cateno"  value="${faq_cateVO.faq_cateno }">
    <ASIDE style='float: left;'>
      <A href='../faq_cate/list.do'>카테고리 그룹</A> > 
      <A href='./list.do?faq_cateno=${faq_cateVO.faq_cateno }'>${faq_cateVO.title }</A>
      <c:if test="${param.word.length() > 0 }">
        > [${param.word }] 검색 목록 (${search_count } 건)
      </c:if> 
    </ASIDE>
    
    <ASIDE style='float: right;'>
      <A href="javascript:location.reload();">새로고침</A>
     
      <span class='menu_divide' > | </span>
      <c:if test="${sessionScope.id_admin != null}">
      <A href='./create.do?faq_cateno=${faq_cateVO.faq_cateno }'>등록</A>
     </c:if>
      <c:choose>
        <c:when test="${param.word != '' }">
          <input type="text"  name="word" id="word" value="${param.word }" style="width: 35%;"> 
        </c:when>
        <c:otherwise>
          <input type="text"  name="word" id="word" value="" style="width: 35%;"> 
        </c:otherwise>
      </c:choose>
      <button type="submit">검색</button>
    <c:if test="${param.word.length() > 0 }">
      <button type="button" onclick="location.href='./list.do?faq_cateno=${faq_cateVO.faq_cateno}'" >검색 취소</button> 
    </c:if>
    </ASIDE> 
  </form>
  
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
  <c:choose>
   <c:when test="${sessionScope.id_admin != null}">
     <col style='width: 10%;'/>
     <col style='width: 40%;'/>
     <col style='width: 20%;'/>
     <col style='width: 30%;'/>
   </c:when>
    <c:otherwise>
       <col style="width: 15%;"></col>
       <col style="width: 75%;"></col>
       <col style="width: 10%;"></col>
       </c:otherwise>
      </c:choose>
  </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>번호</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'><c:if test="${sessionScope.id_admin != null}">기타</c:if></TH>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="faqVO" items="${list }">
          <c:set var="faqno" value="${faqVO.faqno }" />
          
          <tr> 
           <td style='text-align: center;'>${faqVO.faqno}</td>
            
            <td style='text-align: center;'>
              <a href="./read.do?faqno=${faqno}&nowPage=${param.nowPage}">${faqVO.title}</a> 
            </td> 
            <td style='text-align: center;'>${faqVO.rdate.substring(0, 10)}</td>
            <c:if test="${sessionScope.id_admin != null}">
             <TD style='text-align: center;'>
              <a href="./update.do?faqno=${faqno}&faq_cateno=${faq_cateVO.faq_cateno}&nowPage=${param.nowPage}"><img src="./images/update.png" title="수정"></a>
              <a href="./delete.do?faqno=${faqno}&faq_cateno=${faq_cateVO.faq_cateno}&nowPage=${param.nowPage}"><img src="./images/delete.png" title="삭제"></a>
              
           
            </td>
            </c:if>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <DIV class='bottom_menu'>${paging }</DIV>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  