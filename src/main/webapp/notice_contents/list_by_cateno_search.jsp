<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>공지 world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <form name='frm' id='frm' method='get' action='./list_by_cateno_search.do'>
   
  <ASIDE style='float: left;'>
    <A href='../notice_cate/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?cateno=${notice_cateVO.cateno }'>${noitce_cateVO.title }</A>
    <c:if test="${param.no_word.length() > 0 }">
    > [${param.no_word}]검색 목록 (${search_count }건)
    </c:if>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <c:if test="${sessionScope.id != null}">
      <span class='menu_divide' > | </span>
      <A href='./create.do?cateno=${notice_cateVO.cateno }'>등록</A>
    </c:if>
      
      <c:choose>
        <c:when test="${param.no_word!='' }">
          <input type='text' name='no_word' id='no_word' value='${param.no_word }'
                   style='width:35%;'>        
        </c:when>
        <c:otherwise>
        <input type='text' name='no_word' id='no_word' value='' style='width:35%;'>
        </c:otherwise>
      </c:choose>
      
      <button type='submit'>검색</button>
     <c:if test="${param.no_word.length() > 0 }">
      <button type='button' 
                  onclick="location.href='./list_by_cateno_search.do'">검색 취소</button>
      </c:if>
  </ASIDE> 
  </form>
  
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 75%;"></col>
        <col style="width: 10%;"></col>
  
        <!-- 기타가 없는이유= 단순 전체글 목록 확인용. 수정 삭제는 카테고리 타고들어가서 하는것. -->
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>번호</th>
          <th style='text-align: center;'>제목</th>
            <th style='text-align: center;'>등록일</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="no_contentsVO" items="${list }">
          <c:set var="no_contentsno" value="${no_contentsVO.no_contentsno }" />
          <tr> 
            <td style='text-align: center;'>${no_contentsVO.no_contentsno}</td>
            <td style='text-align: center;'>
              <a href="./read.do?no_contentsno=${no_contentsno}">${no_contentsVO.no_title}</a> 
            </td> 
            <td style='text-align: center;'>${no_contentsVO.no_rdate.substring(0, 10)}</td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  