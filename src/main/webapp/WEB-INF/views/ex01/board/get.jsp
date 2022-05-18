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

<script>
	$(document).ready(function(){
		
		$("#edit-button1").click(function(){
			$("#input1").removeAttr("readonly");
			$("#textarea1").removeAttr("readonly");
			$("#modify-submit-button").removeClass("d-none");
			$("#remove-submit-button").removeClass("d-none");
		});
		
		$("#remove-submit-button").click(function(e){
			let message = "글을 삭제하시겠습니까?";
			e.preventDefault();
			
			if(confirm(message)){
				let form1 = $("#form1");
				let actionAttr = "${appRoot}/ex01/board/remove"
				form1.attr("action", actionAttr);
				form1.submit();
			}
		});
		
		$(".reply-modify-button").click(function(){
			let replyId = $(this).attr("data-reply-id");
			let currentReplyId = "#current-reply" + replyId;
			let modifiedReplyId = "#modified-reply" + replyId;
			
			console.log(replyId);
			
			$(currentReplyId).hide();
			$(modifiedReplyId).show();
		});
		
		$(".reply-delete-button").click(function(){			
			let message = "댓글을 삭제하시겠습니까?";
			let replyId = $(this).attr("data-reply-id");
			
			console.log(replyId);
			
			if(confirm(message)){			
				$("#reply-delete-input").val(replyId);
				$("#replyDeleteForm").submit();
			}
		});
			
	});
</script>

<title>Insert title here</title>
</head>
<body>
	
	<my:navBar></my:navBar>
	
	<%-- 게시글 수정 알림 --%>
	
	<c:if test="${not empty param.boardModifySuccess }">
		<c:if test="${param.boardModifySuccess }">
			<div class="alert alert-success" role="alert">
			  <p class="text-center fw-bolder">글이 수정되었습니다.</p>
			</div>					
		</c:if>
		<c:if test="${not param.boardModifySuccess }">
			<div class="alert alert-danger" role="alert">
			  <p class="text-center fw-bolder">글 수정 중 오류가 발생했습니다.</p>
			</div>
		</c:if>
	</c:if>
	
	<%-- 본문 --%>
	
	<div class="container">
		<div class="row">
			<div class="col">
				
				
				<h1>글 본문
					<button class="btn btn-primary" id="edit-button1">
						<i class="fa-solid fa-pen-to-square"></i>
					</button>
				</h1> 
				
				<form id="form1" action="${appRoot }/ex01/board/modify" method="post">
					<input type="hidden" value="${board.id }" name="id"/>				
					<div>
						<label for="input1" class="form-label">제목</label>
						<input id="input1" class="form-control" type="text" value="${board.title }" name="title" required readonly/>
					</div>
					<div>
						<label for="textarea1" class="form-label">본문</label>
						<textarea id="textarea1" class="form-control" rows="10" cols="30" name="body" readonly>${board.body }</textarea> 
					</div>
					<div>
						<label for="input2" class="form-label">작성일시</label>
						<input id="input2" class="form-control" type="datetime-local" value="${board.inserted }" readonly/>
					</div>
					
					<button id="modify-submit-button" class="btn btn-primary d-none">수정</button>
					<button id="remove-submit-button" class="btn btn-danger d-none">삭제</button>
				</form>
				
			</div>
		</div>
	</div>	
	
	<%-- 댓글 입력 --%>
	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				
				<form action="${appRoot }/ex02/reply/insert" method="post">								
					<div class="input-group mb-3">
						<input type="hidden" name="boardId" value="${board.id }" />
					 	<input type="text" name="content" class="form-control"
					 	placeholder="댓글 입력" required>
					 	<button class="btn btn-outline-secondary">
					 		<i class="fa-solid fa-comment"></i>
					 	</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	
	<%-- 댓글 목록 --%>
	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<ul class="list-group">
				
					<c:forEach items="${replyList }" var="reply">
						<li class="list-group-item">
							
							<%-- 댓글 내용, 수정버튼, 삭제버튼--%>
							
							<div id="current-reply${reply.id }">
								<div>
									<i class="fa-solid fa-comment"></i> ${reply.prettyInserted }	
								</div>
								${reply.content } 
								<button class="reply-modify-button" data-reply-id="${reply.id }"
										id="reply-modify-button${reply.id }">
									<i class="fa-solid fa-pen"></i>
								</button>
								<button class="reply-delete-button btn-danger" data-reply-id="${reply.id }">
									<i class="fa-solid fa-xmark"></i>
								</button>
							</div>
							
							<%-- 댓글 수정  --%>
							
							<div id="modified-reply${reply.id }" style="display:none">
								<form action="${appRoot }/ex02/reply/modify" method="post">
									<input type="hidden" value="${reply.id }" name="id"/>
									<input type="hidden" value="${board.id }" name="boardId"/>
									<input type="text" name="content" value="${reply.content }" required/>
									<button>완료</button>
								</form>
							</div>
							
						</li>											
					</c:forEach>
				</ul>
				
			</div>
		</div>
	</div>
	
	<%-- 댓글 삭제 --%>
	
	<div class="d-none">
		<form action="${appRoot }/ex02/reply/delete" 
		id="replyDeleteForm" method="post">
			<input type="text" id="reply-delete-input" name="id"/>
			<input type="text" value="${board.id }" name="boardId"/>
		</form>
	</div>
				
</body>
</html>