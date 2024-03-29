<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
	
	<my:navBar currentPage="list"></my:navBar>
	
	<%-- 글 목록 --%>
	
	<div class="container">
		<div class="row">
			<div class="col">
				
				<h1>글 목록</h1>
			
				<table class="table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList }" var="board">			
							<tr>
								<td>${board.id }</td>
								<td>
									<a href="${appRoot }/ex01/board/${board.id }">${board.title }</a>
									<c:if test="${board.numOfReply > 0}">
										[${board.numOfReply }]
									</c:if>
								</td>
								<td>${board.prettyInserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	
	<my:pagination path="/ex01/board/list"></my:pagination>
	
</body>
</html>