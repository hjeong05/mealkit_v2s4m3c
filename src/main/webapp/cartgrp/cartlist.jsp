<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Meal Kit 장바구니 그룹</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    `
   
<script type="text/javascript">
function update_form(cartgrpno) {
    
    var url = './update.do?cartgrpno=' + cartgrpno;
    var win = window.open(url, '카테고리 그룹 수정', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
function delete_form(cartgrpno) {
    
    var url = './delete.do?cartgrpno=' + cartgrpno;
    var win = window.open(url, '카테고리 그룹 삭제', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
  
  <DIV class='title_line'>장바구니</DIV>
  <button type='button' onclick='location.href="./cartlist.do?cartgrpno=1"'>일반배송</button>
  <button type='button' onclick='location.href="./cartlist.do?cartgrpno=2"'>일반배송</button>
  <div id='cart_list' style='display:none'>
    <c:forEach var="cartVO" items="${list }">
          <c:set var="cartno" value="${cartVO.cartno }" />
          <UL style='text-align: center;'>
            <LI class='li_none'><input type="checkbox" name="check_product" value="${cartVO.cartno }"></LI>
            <LI class='li_none'>상품명</LI>
            <LI class='li_none'>상품 사진</LI>
            <LI class='li_none'>${cartVO.productCount}</LI>
            <LI class='li_none'><a href="./delete.do?cartno=${cartno}&cartgrpno=${cartVO.cartgrpno}"><img src="./images/delete.png" title="삭제"  border='0'/></a></LI>
          </UL>
        </c:forEach>
 </div>
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 