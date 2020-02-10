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
  <div style='width:80%; margin: 0px auto;'>
    <DIV class='title_line'>결제 목록</DIV>
      <div class="tab-content" >
      <div class="tab-pane fade in active" style='text-align: center;'>  
        <table class="table table-striped" style='width: 100%; display:table;'>
        <colgroup>
          <col style="width: 20%;"></col>
          <col style="width: 30%;"></col>
          <col style="width: 10%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 10%;"></col>
        </colgroup>
        
      <thead>
        <tr>
          <th style='text-align: center;'>이미지</th>
          <th style='text-align: center;'>상품명</th>
          <th style='text-align: center;'>갯수</th>
          <th style='text-align: center;'>금액</th>
          <th style='text-align: center;'>결제일</th>
        </tr>
      </thead>
        <c:forEach var="cart_productVO" items="${list }">
          <c:set var="cartno" value="${cart_productVO.cartno }" />
          <tr style='width:100%; '>
            <td style='display:table-cell; vertical-align: middle;'><IMG src="../pdatfile/storage/${cart_productVO.thumb }"></td>
            <td style='display:table-cell; vertical-align: middle; text-align: left;'>${cart_productVO.title }</td>
            <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.productCount}개</td>
            <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.price}원</td>
            <td style='display:table-cell; vertical-align: middle;'>${cart_productVO.rdate }</td>
          </tr>
        </c:forEach>
        </table>
      </div>
    </div>
  </div>
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 