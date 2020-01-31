<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<DIV class='container' style='width: 100%;'> 
  <!-- 최상단 메뉴 -->
  <nav class="navbar navbar-fixed-top" style="background-color: #000d1a; width: 100%;">
    <div class="container-fluid" style="width: 100%;">
    <ul class="nav navbar-nav navbar-right">
      <li><a href='${root}/mkmember/create.do' style="color: #FFFFFF; font-size: 14px;"><span class="glyphicon glyphicon-user" style="color: #FFFFFF;"></span> 회원가입</a></li>    
      <c:choose>
        <c:when test="${sessionScope.id == null}"> <!-- 로그인 되어있지 않을 때 -->
          <li><a href='${root}/mkmember/login.do'  style="color: #FFFFFF; font-size: 14px;"><span class="glyphicon glyphicon-log-in" style="color: #FFFFFF;"></span> 로그인</a></li>
        </c:when>
        <c:otherwise> <!-- 로그인 되어있을 때 -->
          <li><a href='${root}/mkmember/logout.do'  style="color: #FFFFFF; font-size: 14px;">
          <span class="glyphicon glyphicon-log-out" style="color: #FFFFFF; margin-right: 4px;"></span>${sessionScope.id }님 로그아웃</a></li>
        </c:otherwise>
      </c:choose>  
    </ul>
    </div>
    
    <!-- 상단 메뉴 -->
    <div class="collapse navbar-collapse" style="background-color: #FFFFFF; height: 120px; vertical-align: middle; display: table-cell; width: 100%;">
      <div class="navbar-header">
        <a class="navbar-brand" href="${root}" style="font-size: 35px; font-weight: bold; color: #004d1a; margin: 15px;">Meal Kit</a>
      </div>
      <ul class="nav navbar-nav" style="margin: 15px;">
        <li class="dropdown">
        <a class="dropdown-toggle" id="dropdown" data-toggle="dropdown" style="color: #333333;">카테고리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" style="color: #333333;">한식</a></li>
          <li><a href="#" style="color: #333333;">중식</a></li>
          <li><a href="#" style="color: #333333;">일식</a></li>
        </ul>
        </li>
        <li><a href="#">리뷰</a></li>
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <!-- 로그인 되어있을 때 -->
          <li><a href="${root}/mkmember/mypage.do?memberno=${sessionScope.memberno }">마이페이지</a></li>
        </c:when>
      </c:choose>          
        <li><a href="#" >장바구니</a></li>
      </ul>
      
      <!-- 관리자용 메뉴 -->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${root }/memcate/list.do">멤버카테고리</a></li>
        <c:choose>
          <c:when test="${sessionScope.id_admin == null}"> <!-- 관리자 로그인 되어있지 않을 때 -->
            <li><a href="${root}/admin/login.do">관리자로그인</a></li>
          </c:when>
          <c:otherwise> <!-- 관리자 로그인 되어있을 때 -->
            <li><a href="${root}/admin/logout.do">${sessionScope.id_admin }님 로그아웃</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div> 
  </nav>

   
<DIV class='content' style="margin-top: 200px;">
