<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
function delete_by_contentsno() {
  frm_delete_by_contentsno.submit();
}
</script>
</head> 
 
<body>
 
  <ASIDE style='float: left;'>
 
  </ASIDE>
    <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?cartgrpno=${cartgrpVO.cartgrpno }'>삭제</A>
 
  </ASIDE> 
  
  <div class='menu_line'></div>
  <%-- <FORM name='frm_delete_by_contentsno' method='POST' action='../attachfile/delete_by_contentsno.do'>
    <input type='hidden' name='contentsno' value='${param.contentsno }'>
    <input type="hidden" name="categrpno" value="${param.categrpno }">
  </FORM> --%>
 
  <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='cartno' value='${param.cartno}'>
      <input type="hidden" name="cartgrpno" value="${param.cartgrpno }">
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는 상품: ${cart_productVO.title } ${cartVO.productCount }개<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
          <button type = "submit" class="btn btn-info">삭제 진행</button>
          <button type="button" onclick="window.close();" class="btn btn-info">취소</button>
        </div>
      </div>   
  </FORM>
 
</body>
 
</html> 