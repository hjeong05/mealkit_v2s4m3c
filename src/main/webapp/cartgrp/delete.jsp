<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
 
<script type="text/javascript">
function delete_by_cartgrpno() {
	frm_delete_by_cartgrpno.submit();
}
</script>
 
</head> 
 
<body>     
<div style="display:table; width: 100%; height:300px;">       
<div style="display:table-cell; vertical-align: middle">      
 <FORM name='frm_delete_by_cartgrpno' method='POST' action='../cart/delete_by_cartgrpno.do'>
 <input type='hidden' name='cartgrpno' value='${cartgrpVO.cartgrpno }'>
 </FORM>
 
 
<FORM name='frm' method='POST' action='./delete.do'>
  <input type='hidden' name='cartgrpno' value='${cartgrpVO.cartgrpno }'>
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none' style="font-weight:bold;">
        삭제될 카테고리 그룹 이름 :${cartgrpVO.name }
      </li>
      <c:if test="${count_by_cartgrpno > 0 }">
      <li class='li_none' style="text-decoration: underline;">
        관련된 글 ${count_by_cartgrpno }건이 발견되었습니다.
      </li>
      <li class='li_none' >
        관련글을 삭제해야 카테고리 그룹을 삭제 할 수 있습니다.
        <br>
        관련글을 삭제 하시겠습니까?
        <br> <span style='color:#FF0000;'>
        관련글이 삭제되면 복구 할 수 없습니다.
        </span>
        <button type="button" onclick='delete_by_cartgrpno();' >삭제</button>
      </li>
      </c:if>
      <li class='li_none'>
        삭제하면 복구 할 수 없습니다. <br>
        삭제를 진행하시겠습니까?
      </li>
      <li class='li_right'>
        <button type="submit">삭제 진행</button>
        <button type="button" onclick="window.close();">닫기</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
 
 </div>
 </div>
</body>
 
</html> 