<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<body>
 
  <ASIDE style='float: left;'>
 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./create.do?categrpno=${categrpVO.categrpno }'>등록</A>
 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='cartgrpno' value='${cartgrpVO.cartgrpno }'>
      <input type='hidden' name='cartno' value='${cartVO.cartno }'>
        
      <div class="form-group">   
        <div class="col-md-11" >
          <label class="col-md-1 control-label">상품 갯수</label>
          <input type='number' class="form-control input-lg" name='productCount' value='${cartVO.productCount }' placeholder="상품 갯수" style='width: 20%;'>
        </div>
      </div>
      
      <DIV style='text-align: right;'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" onclick="window.close();" class="btn btn-info">취소</button>
      </DIV>
  </FORM>
</body>
 
</html> 