<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

  <!-- jQuery -->
  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

  <!-- Fotorama -->
  <link href="fotorama.css" rel="stylesheet">
  <script src="fotorama.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src='../js/tool.js'></script>
<script>
$(document).ready(function(){
  
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('current');
    $('.tab-pdcontent').removeClass('current');

    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })

})
</script>
<%
DecimalFormat df = new DecimalFormat("￦ ###,###,### 원");
%>
<script type="text/javascript">
function order_direct(f){
    var count = parseInt(f.productCnt.value);
    var id = f.id.value;
    if(count > ${pdcontentsVO.cnt}){
    	alert('재고가 부족합니다. 남은 수량: ' + ${pdcontentsVO.cnt} +' 개');
    } else {
    	   window.location.href="../order/list_direct.do?cartgrpno=1&orderID="+id+"&productno="+${pdcontentsVO.pdcontentsno }+"&productCount="+count;
    }
  }

function create_form_n(f) {
	var count = parseInt(f.productCnt.value);
  var id = f.id.value;
  if(count > ${pdcontentsVO.cnt}){
      alert('재고가 부족합니다. 남은 수량: ' + ${pdcontentsVO.cnt} +' 개');
    } else {
      var url = "../cart/create.do?cartgrpno=1&orderID="+id+"&productno="+${pdcontentsVO.pdcontentsno }+"&productCount="+count;
      var win = window.open(url, '장바구니 담기', 'width=800px, height=300px');
      
      var x = (screen.width - 700) / 2;
      var y = (screen.height - 400) / 2;
      
      win.moveTo(x, y); // 지정된 좌표로 이동    
    }
}

function create_form_r(f) {
	var count = parseInt(f.productCnt.value);
	var id = f.id.value;
	
  if(count > ${pdcontentsVO.cnt}){
      alert('재고가 부족합니다. 남은 수량: ' + ${pdcontentsVO.cnt} +' 개');
    } else {
    	var url = "../cart/create.do?cartgrpno=2&orderID="+id+"&productno="+${pdcontentsVO.pdcontentsno }+"&productCount="+count;
      var win = window.open(url, '장바구니 담기', 'width=800px, height=300px');
      
      var x = (screen.width - 700) / 2;
      var y = (screen.height - 400) / 2;
      
      win.moveTo(x, y); // 지정된 좌표로 이동    
    }
}

  window.onload = function(){
    find('productCnt').addEventListener('change', price);
  }
  
  function price(event) {
    var productCnt = parseInt(find('productCnt').value);
    
    var tot = 0;
    
    tot = productCnt * ${pdcontentsVO.price};
 
    find('price').innerHTML = '총 금액 : ￦ ' + tot + '원';
  }
  
  $(function() { // 자동 실행
    list_by_pdcontentsno(${pdcontentsVO.pdcontentsno });  // JS의 EL 접근
    
    if ('${sessionScope.memberno}' != '') { // 로그인된 경우
      // alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

      var frm_pdreply = $('#frm_pdreply');
      $('#content', frm_pdreply).attr('placeholder', '댓글 작성');
    }
  });
  
  function panel_img(file) {
    var tag = "";
    tag = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag += "  <IMG src='../pdatfile/storage/" + file
        + "' style='width: 100%;'>";
    tag += "</A>";

    $('#pdatfile_panel').html(tag);
    $('#pdatfile_panel').show();
  }
  
  function create_pdreply() {
    var frm_pdreply = $('#frm_pdreply');
    var params = frm_pdreply.serialize();
    // alert('checkId() 호출됨: ' + params);
    // return;
    if ($('#memberno', frm_pdreply).val().length == 0) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#content', frm_reply).val().length);
    // return;
    if ($('#content', frm_pdreply).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    $.ajax({
      url: "../pdreply/create.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.count > 0) {
          $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
          msg = "댓글을 등록했습니다.";
          
          list_by_pdcontentsno(${pdcontentsVO.pdcontentsno }) // 목록을 새로 읽어옴.
          
        } else {
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          msg = "댓글 등록에 실패했습니다.";
        }
        
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html(msg);        // 내용
        $('#modal_panel').modal();              // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
   
  }
  
  // 댓글 목록
  function list_by_pdcontentsno(pdcontentsno) {
    // alert(contentsno);
    var params = 'pdcontentsno=' + pdcontentsno;

    $.ajax({
      url: "../pdreply/list_by_pdcontentsno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#panel_reply').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];

          msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "<span style='font-weight: bold; color: magenta;'>" + " 평점: " + row.starcnt + "</span>";
          msg += "<br> " + row.rdate;
          if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
            msg += " <A href='javascript:pdreply_delete("+row.pdreplyno+")'><IMG src='./images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.content;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#panel_reply').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    
  }
 
  
  // 삭제 레이어 출력
  function pdreply_delete(pdreplyno) {
   //  alert('pdreplyno: ' + pdreplyno);
    var frm_pdreply_delete = $('#frm_pdreply_delete');
    $('#pdreplyno', frm_pdreply_delete).val(pdreplyno);  // 삭제할 댓글 번호 저장 
    $('#modal_panel_delete').modal();              // 삭제 폼 다이얼로그 출력
  }
  
  // 삭제 처리
  function pdreply_delete_proc(pdcontentsno,pdreplyno) {
   //  alert('pdreplyno: ' + pdreplyno);
    var params = $('#frm_pdreply_delete').serialize();
    $.ajax({
      url: "./pdreply_delete.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
       //  alert(rdata);
        var msg = "";
        
        if (rdata.count ==1) { // 패스워드 일치
          if (rdata.delete_count == 1) { // 삭제 성공

            $('#btn_frm_pdreply_delete_close').trigger("click"); // 삭제폼 닫기 
            
            list_by_pdcontentsno(${pdcontentsVO.pdcontentsno }); // 목록을 다시 읽어옴
            
            return; // 함수 실행 종료
          } else {  // 삭제 실패
            msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
            msg += " 다시한번 시도해주세요."
          }
        } else { // 패스워드 일치하지 않음.
          msg = "패스워드가 일치하지 않습니다.";
        }
        
        $('#modal_panel_delete').hide();       // 삭제폼이 있는창을 숨김
        
        $('#modal_panel_delete_msg_content').html(msg);   // 내용
        $('#modal_panel_delete_msg').modal();                   // 다이얼로그 출력        

      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });

    
  }
</script>

</head>

<body>
<c:set var="productcateno" value="${productcateVO.productcateno}" />
<c:set var="pdcontentsno" value="${pdcontentsVO.pdcontentsno }" />

<jsp:include page="/menu/top.jsp" flush='false' />

<!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" onclick="javascript:location.reload();" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <!-- 삭제폼 -->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='frm_pdreply_delete' id='frm_pdreply_delete' method='POST' 
                    action='./pdreply_delete.do'>
            <input type='hidden' name='pdreplyno' id='pdreplyno' value=''>
            <input type="hidden" name="pdcontentsno" value="${pdcontentsno}">
            
            <label>패스워드</label>
            <input type='password' name='passwd' id='passwd' class='form-control'>
            <div style='text-align: right; margin: 5px;'>
              <button type='button' class='btn btn-success' 
                           onclick="pdreply_delete_proc(this.form.pdcontentsno.value,this.form.pdreplyno.value);this.form.passwd.value='';">삭제</button>
            </div> 
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       onclick="javascript:location.reload();" id='btn_frm_pdreply_delete_close'>Close</button>
        </div>
      </div>
    </div>
  </div> <!-- 삭제폼 종료 -->
  
  <!-- 삭제폼 알림창 시작 -->
  <div class="modal fade" id="modal_panel_delete_msg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
                       onclick="$('#modal_panel_delete').show();">×</button>
          <h4 class="modal-title">비밀번호 에러</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_panel_delete_msg_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
        <!-- 현재 창은 삭제되면서 삭제 폼이 다시 출력됨. -->
          <button type="button" class="btn btn-default" data-dismiss="modal"
                      onclick="$('#modal_panel_delete').show();">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <ASIDE style='float: left;'>
    <A href='../productcate/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?productcateno=${productcateno }'>${productcateVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?productcateno=${productcateno }&nowPage=${param.nowPage}'>목록</A>
    <span class='menu_divide' > | </span> 
    <c:if test="${sessionScope.id_admin != null}"> 
    <A href='./update.do?productcateno=${productcateno }&pdcontentsno=${pdcontentsno}&nowPage=${param.nowPage}'>수정</A>
    <span class='menu_divide' > | </span> 
    <a href="../pdatfile/create.do?pdcontentsno=${pdcontentsno}&productcateno=${productcateVO.productcateno}&nowPage=${param.nowPage}">첨부 파일 등록</A>
    <span class='menu_divide' > | </span> 
    <a href="./file_delete.do?pdcontentsno=${pdcontentsno}&productcateno=${productcateVO.productcateno}&nowPage=${param.nowPage}">첨부 파일 삭제</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?productcateno=${productcateno }&pdcontentsno=${pdcontentsno}&nowPage=${param.nowPage}'>삭제</A>
    </c:if>
  </ASIDE> 
  
  <div class='menu_line'></div>

      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${pdcontentsVO.title}</span>
            (<span>${pdcontentsVO.recom}</span>)
            <span>${pdcontentsVO.rdate.substring(0, 16)}</span>
          </li>
        </ul>
          <DIV style='width: 100%; margin: 0px auto; border: solid 1px #FFFFFF;'>
          <!-- 상단 좌측 fotorama -->
          <DIV style='float: left; width: 50%;'>
            <div class="fotorama" style= 'float: left; width: 500px;' data-autoplay="5000" data-nav="thumbs" data-width="1000" data-ratio="3000/2800" data-max-width="90%">
              <c:forEach var="pdatfileVO" items="${pdatfile_list }">
              <c:set var="thumb" value="${pdatfileVO.thumb.toLowerCase() }" />
            <c:choose>
              <c:when
                test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <A href="../pdatfile/storage/${pdatfileVO.fname }">
                  <IMG src='../pdatfile/storage/${thumb }' style='width: 100%; height: 100%;'>
                </A>
              </c:when>
            </c:choose>
          </c:forEach>
            </div>
           </DIV>
           <!-- 상품명, 판매가, 주문 하기 칸 -->
           <FORM name='frm_cart' id='frm_cart' action=" 주문하기 창으로 넘어가기">
             <input type="hidden" name="pdcontentsno" value="${pdcontentsno}">
             <input type="hidden" name='id' value='${sessionScope.id }'>
            <DIV style='float: right; width: 50%;'>
              <UL style='padding-left: 30px;'>
                <li class="li_none" >
                  <span style='display: block;  color: #101010;  font-size: 50px; line-height: 40px; font-weight: 700;  word-break: break-all;' >${pdcontentsVO.title}</span>
                </li>
                <li class="li_none" >
                  판매가 :
                    <span style='box-sizing: border-box; font-size: 30px; box-sizing: border-box;'>${pdcontentsVO.price}</span>원
                </li>
                <li class="li_none" >
                  수량:
                  <input type='number' name =productCnt value=1 id='productCnt' min='1' max='10'>개
                <!--   <button type='button' id="btn_order">확인</button> -->
                  <div class="col-md-11"><span id='price' style='color: #FF0000; font-weight: bold; font-size: 2em; text-align: right;'>총 금액 : ￦ ${pdcontentsVO.price}원</span>
        </div>
                </li>
                <li class="li_none" >
                  <button class="btn btn-info" style='padding_bottom: 5px;' type='button' id="order" onclick=order_direct(document.frm_cart);>주문하기</button><br>
                  <button class="btn btn-info" style='padding_bottom: 5px;' type='button' id='btn_cart' onclick=create_form_n(document.frm_cart);>장바구니(일반)</button>
                  <button class="btn btn-info" style='padding_bottom: 5px;' type='button' id='btn_cart' onclick=create_form_r(document.frm_cart);>장바구니(정기)</button>
                </li>
              </UL>
          </DIV>
         </FORM> 
          <!-- Tabs -->
          <DIV style='clear: both; width: 100%;'>
                      <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1" style='font-weight: bold;'>상세설명</li>
            <li class="tab-link" data-tab="tab-2">리뷰(${pdcontentsVO.replycnt })</li>
          </ul>
          <DIV style='clear: both; width: 100%;'>
          <!-- 상세설명 탭 내용 -->
          <div id="tab-1" class="tab-pdcontent current">  
            <DIV>${pdcontentsVO.content }</DIV>
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어(키워드): ${pdcontentsVO.word }
            </DIV>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>${productcateVO.name } 목록
           </li>
           <DIV style='position: relative;' >
              <c:forEach var="pdcontentsVO" items="${pdcontents_list }">
              <c:set var="pdcontentsno" value="${pdcontentsVO.pdcontentsno }" />
                <a href="./read.do?pdcontentsno=${pdcontentsno}" >${pdcontentsVO.title}</a><br>
              </c:forEach>
           </DIV>
          </div>
          </DIV>
      
          <!-- 리뷰 탭 내용 -->
          <div id="tab-2" class="tab-pdcontent">
              <!-- 댓글 영역 시작 -->
            <DIV style='width: 80%;'>
              <HR>
              <FORM name='frm_pdreply' id='frm_pdreply' >
                <input type='hidden' name='pdcontentsno' id='pdcontentsno' value='${pdcontentsVO.pdcontentsno }'> 
                <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
                
                <input type='number' name='starcnt' id='starcnt' max= '5' min = '0' step = '1' placeholder="0.0 ~ 5.0" >
                <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
                <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
                <button type='button' id='btn_create' onclick="create_pdreply();">등록</button>
              </FORM>
              <HR>
              <DIV id='panel_reply'></DIV>
            </DIV>

            <!-- 댓글 영역 종료 -->   
          </div>

          </DIV>
        </DIV>
  
      </fieldset>

        
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>