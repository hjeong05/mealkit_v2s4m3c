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
<script type="text/javascript" src='../js/tool.js'></script>

<script>
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
});
</script>
<script type="text/javascript">
window.onload = function() {
}
function update_form(cartgrpno, cartno) {
    
    var url = './update.do?cartgrpno=' + cartgrpno + '&cartno=' + cartno;
    var win = window.open(url, '카테고리 그룹 수정', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
function delete_form(cartgrpno, cartno) {
    
    var url = './delete.do?cartgrpno=' + cartgrpno + '&cartno=' + cartno;
    var win = window.open(url, '장바구니 삭제', 'width=700px, height=400px');
    
    var x = (screen.width - 700) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }
  
 function check_box(list_count) {
	 var cartno_list = new Array();
	 var j = 0;
	 for(var i = 1; i <= list_count; i++) {
		 if(find(i).checked) {
			 cartno_list[j] = find(i).value;
			 j++;
		 }
	 } 
	 location.href="../order/list.do?cartno_list=" + cartno_list;
 }
 
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
  <div style='width:80%; margin: 0px auto;'>
    <DIV class='title_line'>장바구니</DIV>
      <ul class="nav nav-tabs" >
        <c:if test="${param.cartgrpno == 1 }">
          <li class="active"><a href="./cartlist.do?cartgrpno=1&orderID=${sessionScope.id }">일반배송</a></li>
          <li><a href="./cartlist.do?cartgrpno=2&orderID=${sessionScope.id }">정기배송</a></li>
        </c:if>
        <c:if test="${param.cartgrpno == 2 }">
          <li><a href="./cartlist.do?cartgrpno=1&orderID=${sessionScope.id }">일반배송</a></li>
          <li class="active"><a href="./cartlist.do?cartgrpno=2&orderID=${sessionScope.id }">정기배송</a></li>
        </c:if>
      </ul>
      <div class="tab-content" >
      <div class="tab-pane fade in active" style='text-align: center;'>  
        <table class="table table-striped" style='width: 100%; display:table;'>
        <colgroup>
          <col style="width: 10%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 30%;"></col>
          <col style="width: 10%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 10%;"></col>
        </colgroup>
        
      <thead>
        <tr>
          <th style='text-align: center;'>선택</th>
          <th style='text-align: center;'>이미지</th>
          <th style='text-align: center;'>상품명</th>
          <th style='text-align: center;'>갯수</th>
          <th style='text-align: center;'>금액</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      </thead>
        <%int list_count = 0; %>
        <c:forEach var="cart_productVO" items="${list }">
        <%list_count++; %> 
          <c:set var="cartno" value="${cart_productVO.cartno }" />
          <tr style='width:100%; '>
            <td style='display:table-cell; vertical-align: middle;'><input type="checkbox" name="check_product" value="${cart_productVO.cartno }" id="<%=list_count %>" ></td>
            <td style='display:table-cell; vertical-align: middle;'><img src='./images/${cart_productVO.thumb }' style='width:100px;'></img></td>
            <td style='display:table-cell; vertical-align: middle; text-align: left;'>${cart_productVO.title }</td>
            <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.productCount}개</td>
            <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.price}원</td>
            <td style='display:table-cell; vertical-align: middle;'>
              <a href="javascript:update_form(${cart_productVO.cartgrpno }, ${cart_productVO.cartno });"><img src="./images/update.png" title="수정"  border='0'/></a>
              <a href="javascript:delete_form(${cart_productVO.cartgrpno }, ${cart_productVO.cartno });"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
          </tr>
        </c:forEach>
        </table>
      </div>
      <div style='text-align: right;' >
        <button type='button' class='btn btn-primary' onclick="check_box(<%=list_count %>);">주문</button>
        <%-- <button type='button' class='btn btn-primary' onclick="list_length(<%=list_count %>);" >주문</button> --%>
        <%-- <button type='button' class='btn btn-primary' onclick="location.href='../order/list.do?cartno=${cart_productVO.cartno }'" >주문</button> --%>
      </div>
    </div>
  </div>
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 