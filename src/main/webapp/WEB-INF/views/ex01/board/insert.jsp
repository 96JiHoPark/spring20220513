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
	
	<my:navBar currentPage="insert"></my:navBar>
	
	<div class="container">
		<div class="col">
			<div class="row">
			
				<h1>글 쓰기</h1>
				
				<form action="${appRoot }/ex01/board/insert" method="post">
					<div>
						<label for="input1" class="form-label">제목</label>
						<input id="input1" class="form-control" type="text" required 
						 name="title"/>
					</div>
					<div>
						<label for="textarea1" class="form-label">본문</label>
						<textarea id="textarea1" class="form-control" rows="10" cols="30" 
						name="body" ></textarea> 
					</div>
					<button class="btn btn-primary justify-content-right">작성</button>
				</form>
								
			</div>
		</div>
	</div>
	
	
</body>
</html>