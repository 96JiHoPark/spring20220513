<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="path" %>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	
  	<%-- 첫 페이지로 --%>
  	
  	<c:url value="${path }" var="firstLink">
  		<c:param name="page" value="1"></c:param>
  	</c:url>
  	
  	<li class="page-item">
    	<a class="page-link" href="${firstLink }">&Lang;</a>
    </li>
  	
  	<%-- 이전 페이지로 --%>
  	
  	<c:url value="${path }" var="prevLink">
  		<c:param name="page" value=
  		"${pageInfo.current - 1 > 1 
  		? pageInfo.current - 1  : 1 }">
  		</c:param>
  	</c:url>
  	
    <li class="page-item">
    	<a class="page-link" href="${prevLink }">&lang;</a>
    </li>
    
    <%-- 페이지 번호 나열 --%>
    
   	<c:forEach begin="${pageInfo.left }" end="${pageInfo.right }" var="pageNum">
   		
   		<c:url value="${path }" var="link">
   			<c:param name="page" value="${pageNum }"></c:param>
   		</c:url>
   		
   		<li class="page-item ${pageInfo.current == pageNum ? 'active' : ''}">    		
    		<a class="page-link" href="${link }">${pageNum }</a>
   		</li>
		
   	</c:forEach>
   	
   	<%-- 다음 페이지로 --%>
   	
   	<c:url value="${path }" var="nextLink">
   		<c:param name="page" value=
   		"${pageInfo.current + 1 > pageInfo.lastPage 
   		? pageInfo.lastPage : pageInfo.current + 1 }">
   		</c:param>
   	</c:url>
    <li class="page-item">
    	<a class="page-link" href="${nextLink }">&rang;</a>
    </li>
    
   	<%-- 마지막 페이지로 --%>
  	
  	<c:url value="${path }" var="lastLink">
  		<c:param name="page" value="${pageInfo.lastPage }"></c:param>
  	</c:url>
  	
  	<li class="page-item">
    	<a class="page-link" href="${lastLink }">&Rang;</a>
    </li>
  </ul>
  
</nav>



