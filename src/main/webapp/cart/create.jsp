<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script type="text/javascript" src='../js/tool.js'></script>
 
 <script type="text/javascript">
 window.onload = function() {
	 find('productno').addEventListener('change', price);  
	 find('productCount').addEventListener('change', price);
 }
 /* 
  $(function() { // 자동 실행
  	changeProduct();
  	changePrice();
  }); */
 
  function price(event) {
	  var productno = find('productno').value;
	  var productCount = parseInt(find('productCount').value);
	  
	  var tot = 0;
	  var productPrice = 0;
	  
	  if(productno == 1) {
		  productPrice = 6500;
		  tot = productPrice * productCount;
	  } else if(productno == 2) {
      productPrice = 5000;
      tot = productPrice * productCount;
	  } else if(productno == 3) {
		  tot = 3;
      productPrice = 7500;
      tot = productPrice * productCount;
	  }
	  
	  find('price').innerHTML = '￦ ' + tot + '원';
  }
 </script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href="../cartgrp/list.do">장바구니 그룹</A> > 
    <A href='./list.do?cartgrpno=${cartgrpVO.cartgrpno }'>${cartgrpVO.name }</A> > 
    상품 등록
  </ASIDE> 
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do?cartgrpno=${cartgrpVO.cartgrpno }'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class='form-horizontal'>
               
      <!-- 테스트를 위하여 FK 회원번호 지정 -->
      <input type='hidden' name='orderID' id='orderID' value='${sessionScope.id }'>
       <!-- 테스트를 위하여 FK cartgrpno 지정 -->
      <input type='hidden' name='cartgrpno' id='cartgrpno' value=${param.cartgrpno }>
      
      <div class="form-group">
        <div class="col-md-12">
          <select name ="productno" id="productno" style="width:10%;" class="form-control" >
            <option value="none">--상품 선택--</option>
            <option value=1>비빔밥</option>
            <option value=2>짜장면</option>
            <option value=3>연어 덮밥</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='number' class="form-control input-lg" name='productCount' id="productCount" value=0 placeholder="상품 갯수" style='width: 10%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          총 금액 : <span id='price' style='color: #FF0000; font-weight: bold;'>￦ 0원</span>
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-primary" onclick="location.href='./list.do?cartgrpno=${param.cartgrpno }'" >취소[목록]</button>
      </DIV>
    </FORM>
  </DIV>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 