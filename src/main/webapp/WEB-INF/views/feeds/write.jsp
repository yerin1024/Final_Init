<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
	<div id="wrapper">
		<form action="/feed/writeProc" method="post" id="writeForm" enctype="multipart/form-data">
			<input type="text" name="title">
			<select name="relation">
				<option value="0">전체공개</option>
				<option value="1">아는사람</option>
				<option value="2">친구</option>
				<option value="3">절친</option>
				<option value="4">나만</option>
			</select>
			<input type="file" name="files" multiple="multiple">
			<input type="text" name="contents" id="contents" style="display:none">
			<textarea  id="summernote" class="summernote"></textarea>
			<button type="button" id="write">등록</button>
		</form>
	</div>
	<script>
	$(document).ready(function() { 
		$('#summernote').summernote();
	});
	$("#write").on("click", function(){
		$("#contents").val($("#summernote").val());
		$("#writeForm").submit();
	})
	</script>
</body>
</html>