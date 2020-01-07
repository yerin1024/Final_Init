<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<style>
.feed {
	border: 1px solid black;
}

img {
	width: 50px;
	height: 50px;
}
</style>
<script>
    $(document).ready(function() { 
    	$("img").css("height","300px");
    	$("video").css("height","300px");
    	$("img").css("width","300px");
    	$("video").css("width","300px");
    	$(".carousel-item").css("text-align","center");
	});
    </script>
</head>
<body>
	<div id="container">
		<div class="table">
			<div class="row">
				<div class="col-4">${dto.nickname }</div>
				<div class="col-8">${dto.title }</div>
			</div>
			<div class="row">
				<div class="col-4 feed">${dto.contents }</div>
				<div class="col-4 feed">
					<a
						href="${pageContext.request.contextPath }/feed/deleteProc?seq=${dto.feed_seq}">
						<img
						src="${pageContext.request.contextPath }/resources/images/delete.png">
					</a>
				</div>
				<div class="col-4 feed">
					<a
						href="${pageContext.request.contextPath }/feed/modifyFeedView?feed_seq=${dto.feed_seq}">
						<img
						src="${pageContext.request.contextPath }/resources/images/improvement.png">
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>