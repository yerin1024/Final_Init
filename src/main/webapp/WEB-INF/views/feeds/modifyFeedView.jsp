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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<link rel="stylesheet" href="/resources/css/nav.css?new"> 
<link rel="stylesheet" href="/resources/css/msg.css"> 
<link rel="stylesheet" href="/resources/css/alr.css">
<link rel="stylesheet" href="/resources/css/test.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
body{
	background-color:#171C28;
}
#mediaRow{
	width:1000px;
}

#writeFeedProc{
	padding-left:50px;
}

#writeForm{
	border:3px solid white;
  	margin:auto;
  	margin-top:100px;
  	height:700px;
  	width:1000px;
  	border-radius:20px;
}

#title {
	width:670px;
	margin-left:50px;
	margin-right:15px;
}

#register{
	border:2px solid white;
	border-radius:5px;
	height:30px;
	background:none;
	color:white;
	margin-left:10px;
}
#back{
	border:2px solid white;
	border-radius:5px;
	height:30px;
	background:none;
	color:white;
	margin-left:10px;
}

.dz-default {
	text-align:center;
	margin-left:13px;
	border: 2px solid white;
	border-radius : 15px;
	color:white;
	font-weight:100;
	width:90%;
	margin-top:10px;
}

.dz-preview {
	display: none;
}

.carousel-item {
}

.carousel-inner * {
	width: 14vw;
}
/* .carousel-inner{ */
/* 	width:60vw; */
/* } */
#summernote{
	width:55vw; 
	min-width:670px;
}
.note-editor{
	width:680px;
}
.note-editable{
	height:500px;
}
.cover{
	width:220px;
	height:200px;
}
.note-toolbar{
	z-index: 1;
}
/* All Device */
/* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. */

/* Mobile Device */
/* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device */
@media all and (min-width:768px) {
	/*     사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */

}

@media all and (max-width:768px) {
	/*     사용자 해상도가 768px 이하일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	.section {
		height: 150px;
		margin: 0px;
		padding: 0px;
	}
}
/* Tablet Device */
@media all and (max-width:1024px) {
	/*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
	.section {
		height: 250px;
		padding: 0px;
	}
	.profileImageBox {
		height: 200px;
		width: 200px;
	}
	.friendRequest {
		width: 80px;
		height: 80px;
	}
}
#wrapper{
	margin:auto;
	min-width:1000px;
}
/* Desktop Device */
@media all and (min-width:1025px) {
	/*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */

}
</style>

<script>
	$(function() {
		$("#modifyProc").on("submit", function() {
			var note = $(".note-editable").html();
			$("#contents").val(note);
		})
		console.log("relation : ${dto.relation}");
		
		$("#selectRelation option:eq(${dto.relation})").attr("selected", "selected");
	})
</script>
</head>
<jsp:include page="/resources/jsp/nav.jsp" />
<jsp:include page="/resources/jsp/alr.jsp"/>
<jsp:include page="/resources/jsp/msg.jsp"/>
<body>
	<div id="wrapper">
		<div id="writeForm">
		<br>
			<form action="modifyFeedProc?feed_seq=${dto.feed_seq }" method="post" id="modifyProc">
				&nbsp;&nbsp;<input type="text" name="title" id="title" value="${dto.title }">
				<select name="relation" data-menu id="selectRelation">
				<option value='0'>전체보기</option>
				<option value='1'>지인</option>
				<option value='2'>아는친구</option>
				<option value='3'>절친</option>
				<option value='4'>나만보기</option>
				<textarea name="contents" style="display: none" id="contents"></textarea>
				</select> <button id="register">등록</button><button type="button" id="back">취소</button>
			</form>
			<br>
			<br>	
							
			<div class="row" id="mediaRow">
			<div class="col-8" style="margin:auto">
			<div id="summernote">
				${dto.contents }
			</div>
			</div>
			<div class="col-3">
				<c:choose>             
					<c:when test="${fn:length(media) >=1 }">
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
											<div class="carousel-item active">${media }</div>
									</c:if>
									<c:if test="${status.index !=0}">
										<div class="carousel-item">${media }</div>
									</c:if>
							</c:forEach>
						</div>
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
					</c:when>
				</c:choose>
			</div>

	
			
		</div>
	</div>
	<script>
		$('#summernote').summernote({
			tabsize : 2,
			disableResizeEditor: true,
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
		$("#back").on("click", function(){
			var result = confirm("취소하시겠습니까?");
			if(result==true){
				history.back();
			}else{
				return;
			}
		})
	</script>
	<jsp:include page="/resources/jsp/select.jsp" />
</body>
</html>