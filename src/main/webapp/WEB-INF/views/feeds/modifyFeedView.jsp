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

.carousel-item {
	margin: auto;
	text-align: center;
}
.carousel-inner{
	width:100vw;
}
.carousel-control-next, .carousel-control-prev {
	height: 600px;
}

.carousel-inner img {
	width: 600px;
	height: 600px;
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
							<option value='0'>전체보기</option>
							<option value='1'>지인</option>
							<option value='2'>아는친구</option>
							<option value='3'>절친</option>
							<option value='4' selected>나만보기</option>
						</select> <button>등록</button>
					</div>
					
				</div>

				<c:choose>             
					<c:when test="${fn:length(media) >0}">
						<div class="row media">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-interval="false">
								<ol class="carousel-indicators">
									<c:forEach items="${media }" var="media" varStatus="status">
										<c:if test="${status.index ==0}">
											<li data-target="#carouselExampleIndicators"
												data-slide-to="0" class="active"></li>
										</c:if>
										<c:if test="${status.index !=0}">
											<li data-target="#carouselExampleIndicators"
												data-slide-to="${status.index }"></li>
										</c:if>
									</c:forEach>
								</ol>
								<div class="carousel-inner">
									<c:forEach items="${media }" var="media" varStatus="status">
										<c:if test="${status.index ==0}">
											<div class="carousel-item active">${media }</div>
										</c:if>
										<c:if test="${status.index !=0}">
											<div class="carousel-item">${media }</div>
										</c:if>
									</c:forEach>

									<a class="carousel-control-prev"
										href="#carouselExampleIndicators" role="button"
										data-slide="prev"> <span
										class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next"
										href="#carouselExampleIndicators" role="button"
										data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>



				<textarea name="contents" style="display: none" id="contents"></textarea>
			
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
			width : 900,
// 			툴바는 글내용 꾸미기만 나오도록 바꿔줌
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