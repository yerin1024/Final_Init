<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#writeForm").on("submit", function() {
			$(".note-editable img").removeAttr("style");
			var note = $(".note-editable").html();
			$("#contents").val(note);
		})
	})
</script>
</head>
<body>
	<c:choose>
		<c:when test="${id ne null }">
		바보
		</c:when>
		<c:otherwise>			
			<form action="writeFeedProc" method="post"
				enctype="multipart/form-data" id="writeForm">
				제목:<input type="text" name="title">
					<select name="relation">
					<option value='0' selected>전체보기</option>
					<option value='1'>지인</option>
					<option value='2'>아는친구</option>
					<option value='3'>절친</option>
					<option value='4'>나만보기</option>
				</select>
				<textarea name="contents" style="display: none" id="contents"></textarea>
			<button>등록</button>
			</form>
			<div id="summernote"></div>
		</c:otherwise>
	</c:choose>
	<script>
		$('#summernote').summernote({
			placeholder : 'Hello bootstrap 4',
			tabsize : 2,
			height : 600,
			width : 900,
			toolbar: [
	             // [groupName, [list of button]]
	             ['style', ['bold', 'italic', 'underline', 'clear']],
	             ['font', ['strikethrough', 'superscript', 'subscript']],
	             ['fontsize', ['fontsize']],
	             ['color', ['color']],
	             ['para', ['ul', 'ol', 'paragraph']],
	             ['height', ['height']]
	           ]
		});
	</script>
</body>
</html>