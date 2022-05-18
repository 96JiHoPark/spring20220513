<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="currentPage" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
   	<div class="collapse navbar-collapse" id="navbarNav">
   		<div class="container">   		
	    	<ul class="navbar-nav">
	       		<li class="nav-item">
	         		<a class="nav-link active" aria-current="page" href="${appRoot }/ex01/board/list">
	         			<i class="fa-solid fa-house"></i>
	         		</a>
	        	</li>
	        	<li class="nav-item">
	          		<a class="nav-link ${currentPage == 'list' ? 'active' : '' }" href="${appRoot }/ex01/board/list">목록</a>
	        	</li>
	        	<li class="nav-item">
	          		<a class="nav-link ${currentPage == 'insert' ? 'active' : '' }" href="${appRoot }/ex01/board/insert">글쓰기</a>
	        	</li>
	    	</ul>
   		</div>
	</div>
</nav>