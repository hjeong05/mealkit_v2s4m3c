<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }"/>

        <ul class="dropdown-menu">
          <c:forEach var="productcateVO" items="${list }">
            <c:set var="productcateno" value="${productcateVO.productcateno }" />
           <li>
           <A href='${root }/pdcontents/list.do?productcateno=${productcateno }'>${productcateVO.name }(${productcateVO.cnt })</A>
           </li>
          </c:forEach>
        </UL>
