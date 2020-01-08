<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
.dz-default {
	border: 2px solid black;
}

.dz-preview {
	display: none;
}

<<<<<<< HEAD
.carousel-item {
	margin: auto;
	text-align: center;
}

.carousel-control-next, .carousel-control-prev {

}

.carousel-item *{
	width: 600px;
	height: 600px;
}
.btnss *{
	width:100px;
	height:100px;
}
</style>
<script>
	$(function() {
		$("#replyBtn").on("click", function() {
			var queryString = $("#registerReply").serialize();
			console.log(queryString);
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				dataType : 'json',
				data : queryString
			}).done(function(resp) {
				
			})
		})
		$(".replyDeleteBtn").on("click", function() {
			var feed_seq = ${dto.feed_seq};
			var reply_seq = $(this).val();
			console.log(feed_seq + "입니다.");
			console.log(reply_seq + "입니다.");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/deleteReply",
				data : {
					feed_seq : feed_seq,
					reply_seq : reply_seq
				}
			}).done(function(resp) {
				console.log('성공적으로 성공');
				$("."+resp).html("");
			})
		})
		$("#replyModifyBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath }/feed/";
		})
	})
</script>
</head>
<body>
	<div id="container">
		<div class="table">
			<div class="row">
				<div class="col-4">${dto.nickname }</div>
				<div class="col-8">${dto.title }</div>
			</div>
			<c:choose>
				<c:when test="${fn:length(media) >0}">
				<div class="row media">
					<div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
			        	<ol class="carousel-indicators">
			        	<c:forEach items="${media }" var="media" varStatus="status">
			            	<c:if test="${status.index ==0}">
			            		 <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			            	</c:if>
			            	<c:if test="${status.index !=0}">
			            		 <li data-target="#carouselExampleIndicators" data-slide-to="${status.index }"></li>
			            	</c:if>
			            </c:forEach>
			            </ol>
			        	<div class="carousel-inner">
				        	<c:forEach items="${media }" var="media" varStatus="status">
			            	<c:if test="${status.index ==0}">
			            		 <div class="carousel-item active">
			            		 ${media }
			            		 </div>
			            	</c:if>
			            	<c:if test="${status.index !=0}">
			            		<div class="carousel-item">
			            		 ${media }
			            		 </div>
			            	</c:if>
			           		</c:forEach>
				        	
					        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					            <span class="sr-only">Previous</span>
					        </a>
					        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					            <span class="carousel-control-next-icon" aria-hidden="true"></span>
					            <span class="sr-only">Next</span>
					        </a>
			   			</div>
			   		</div>
				</div>
				</c:when>
			</c:choose>
			
			<div class="row">
				<div class="col-12 feed">${dto.contents }</div>
				<div class="col-6 feed btnss">
					<a href="${pageContext.request.contextPath }/feed/deleteProc?seq=${dto.feed_seq}">
						<img src="${pageContext.request.contextPath }/resources/images/delete.png">

					</a>
				</div>
				<div class="col-6 feed btnss">
					<a href="${pageContext.request.contextPath }/feed/modifyFeedView?feed_seq=${dto.feed_seq}">
						<img src="${pageContext.request.contextPath }/resources/images/improvement.png">
					</a>
				</div>
			</div>
			
			<c:forEach items="${replylist }" var="replylist">
				<div class="row replyFeed ${replylist.reply_seq }" >
					<div class="col-2 feed" style="text-align: center">${replylist.nickname }님의
						댓글</div>
					<div class="col-9 feed">
						<div>${replylist.contents }</div>
					</div>
					<div class="col-1 feed">
						<button type="button" class="replyDeleteBtn" value="${replylist.reply_seq }" style="width: 30%">삭제</button>
						<button type="button" class="replyModifyBtn" style="width: 30%">수정</button>
					</div>
				</div>
			</c:forEach>			
			<form method="post" id="registerReply">
				<div class="row">
					<div class="col-2 feed"  style="text-align: center" >${dto.nickname }님의
						댓글</div>
					<div class="col-9 feed">
						<input type="text" id="reply" name="contents" style="width: 100%">
					</div>
					<div class="col-1 feed">
						<button type="submit" id="replyBtn" style="width: 30%">등록</button>
					</div>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>