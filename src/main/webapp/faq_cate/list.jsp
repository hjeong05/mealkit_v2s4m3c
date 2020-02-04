<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>FAQ</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
function update_form(faq_cateno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './update.do?faq_cateno=' + faq_cateno;
  var win = window.open(url, '공지사항 그룹 수정', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(faq_cateno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './delete.do?faq_cateno=' + faq_cateno;
  var win = window.open(url, '공지사항 그룹 삭제', 'width=800px, height=500px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 500) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>FAQ 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        <c:if test="${sessionScope.id_admin != null}">
      <label>FAQ 그룹 제목</label>
      <input type='text' name='title' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
      </c:if>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>

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
 
  <thead>  
  <TR>
    <th style='text-align: center;'>순서</TH>
    <th style='text-align: center;'>대분류명</TH>
    <th style='text-align: center;'>등록일</TH>
    <th style='text-align: center;'><c:if test="${sessionScope.id_admin != null}">기타</c:if></TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="faq_cateVO" items = "${list }">
    <c:set var="faq_cateno" value="${faq_cateVO.faq_cateno }" />
    
    <TR>
      <TD style='text-align: center;'>${faq_cateVO.seqno }</TD>
      <TD style='text-align: center;'>
       <A href='../faq/list.do?faq_cateno=${faq_cateno }'>${faq_cateVO.title }</A> (${faq_cateVO.cnt }) 
      </TD>
      <TD style='text-align: center;'>${faq_cateVO.rdate.substring(0, 10) }</TD>
   
    <c:if test="${sessionScope.id_admin != null}">
      <TD style='text-align: center;'>
        <A href="javascript: update_form(${faq_cateno });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${faq_cateno });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
     </c:if>
    </TR>
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 