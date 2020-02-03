<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<c:set var="root" value='${pageContext.request.contextPath}'/>
▷ <A href='${root}/cart/list_all.do'>전체글 (${total_count })</A>

<UL>
  <c:forEach var ="cartgrpVO" items ="${list }" >
    <c:set var="cartgrpno" value="${cartgrpVO.cartgrpno }"/>
    <LI class='li_none'>
      <A href="${root }/cart/list.do?cartgrpno=${cartgrpno }">${cartgrpVO.name }(${cartgrpVO.cnt })</A>
    </LI>
  </c:forEach>
</UL>