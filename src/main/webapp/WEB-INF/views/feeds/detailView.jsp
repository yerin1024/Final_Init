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
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
	<div id="wrapper">
		<div class="table">
			<div class="row">
				<div class="col-4">${dto.nickname}</div>
				<div class="col-8">${dto.title }</div>
			</div>
			<div class="row">
				<div class="col-12" id="contents">
				${dto.contents }
				</div>
			</div>
		</div>
	</div>
</body>
</html>