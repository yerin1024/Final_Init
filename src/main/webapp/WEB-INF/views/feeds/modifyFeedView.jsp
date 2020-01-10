<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	$(function() {
		$("#modifyProc").on("submit", function() {
			var note = $(".note-editable").html();
			$("#contents").val(note);
		})
	})
</script>
</head>
<body>
	<div id="container">
		<form action="modifyFeedProc?feed_seq=${dto.feed_seq }" method="post" id="modifyProc">
			<div class="table">
				<div class="row">
					<div class="col-4">
						제목:<input type="text" name="title" value="${dto.title }">
					</div>
					<div class="col-8">
						관계선택:<select name="relation">
							<option value=''>-- 관계 선택 --</option>
							<option value='0'>전체보기</option>
							<option value='1'>지인</option>
							<option value='2'>아는친구</option>
							<option value='3'>절친</option>
							<option value='4'>나만보기</option>
						</select>
					</div>
				</div>
				<textarea name="contents" style="display: none" id="contents"></textarea>
			<button>등록</button>
				<div class="row">
					<div class="col-12  feed"></div>
				</div>
				<div>
				</div>
			</div>
		</form>
		<div id="summernote">
			${dto.contents }
		</div>
	</div>
	<script>
		$('#summernote').summernote({
			placeholder : 'Hello bootstrap 4',
			tabsize : 2,
			height : 600,
			width : 900
		});
	</script>
</body>
</html>