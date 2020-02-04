<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <ul class="dropdown-menu">
          <c:forEach var="productcateVO" items="${list }">
            <c:set var="productcateno" value="${productcateVO.productcateno }" />
           <li>
           <A href='../pdcontents/list.do?productcateno=${productcateno }'>${productcateVO.name }(${productcateVO.cnt })</A>
           </li>
          </c:forEach>
        </UL>
