<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/script/dropzone.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
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
<link rel="stylesheet" href="/resources/css/nav.css"> 
<link rel="stylesheet" href="/resources/css/msg.css"> 
<link rel="stylesheet" href="/resources/css/alr.css"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<style>

#mediaRow{
	min-width:1000px;
	margin:auto;
}


#writeForm{
	border:2px solid red;
  	margin:auto;
  	padding-top:60px;
}

#title {
	width:40%;
}
.dz-default {
	border: 1px solid black;
	width:90%;
	margin-top:10px;
}

.dz-preview {
	display: none;
}

.carousel-item {
	margin: auto;
	text-align: center;
}

.carousel-inner * {
	width: 14vw;
	height: 14vw;
}
.carousel-inner{
	width:60vw;
}
#summernote{
	width:55vw; 
	min-width:670px;
}
.note-editable{
	height:26vw;
	min-height:400px;
}
.cover{
	margin-left:18px;
}
/* All Device */
/* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. */

/* Mobile Device */
/* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device */
@media all and (min-width:768px) {
	/*     사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	body {
		background-color: purple;
	}
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
	body {
		background-color: pink;
	}
}
</style>
<script>
	$(function() {
		$("#writeFeedForm").on("submit", function() {
			$(".note-editable img").removeAttr("style");
			var note = $(".note-editable").html();
			$("#contents").val(note);
		})
	})
</script>
</head>
<jsp:include page="/resources/jsp/nav.jsp" />
<jsp:include page="/resources/jsp/msg.jsp" />
<jsp:include page="/resources/jsp/alr.jsp" />
<body>
	<div id="wrapper">
		<div id="writeForm">
		<br>
			<form action="writeFeedProc" method="post" enctype="multipart/form-data" id="writeFeedForm">
				제목&nbsp;&nbsp;<input type="text" name="title" id="title">
				<select name="relation">
				<option value='0'>전체보기</option>
				<option value='1'>지인</option>
				<option value='2'>아는친구</option>
				<option value='3'>절친</option>
				<option value='4' selected>나만보기</option>
				</select>
				<textarea name="contents" style="display: none" id="contents"></textarea>
				<button type="button" id="register">등록</button>
			</form>
			<br>
			<br>
		
			<div class="row" id="mediaRow">
				<div class="col-3">
				<div class="row">
					<div class="col-12">
						<form action="/feed/mediaTmpUpload" class="dropzone"
							id="my-awesome-dropzone" enctype="multipart/form-data"></form>
					</div>
					<div class="col-12" style="padding-top:40px">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-interval="false" >
							<ol class="carousel-indicators">
					
							</ol>
							<div class="carousel-inner"></div>
							<a class="carousel-control-prev" href="#carouselExampleIndicators"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
				</div>
				<!-- 	캐러셀에서 첫번째 미디어만 active가 붙어야 정상동작하는데 그떼 사용하기 위해 index div를 만들어놓고 display none을 시켜놨음 -->
				<div class="col-8" style="margin:auto">
				<div id="summernote"></div>
				</div>
			</div>
			<span id="index" style="display: none">0</span>
		</div>
	</div>
	<script>
		$('#summernote').summernote({
			tabsize : 2,
			disableResizeEditor: true,
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
		
		Dropzone.options.myAwesomeDropzone = {
				maxFilesize: 10,//최대 파일사이즈 10MB
				
				init : function(re) {//ajax 통신 이후
					//파일크기 자체가 10MB를 넘어서 ajax통신자체가 실패했을때
				    this.on("error", function(file, xhr, form) {
				    	 alert("불가능한 파일유형입니다. ");
				    });
					//성공했을때
					this.on("success",function(file, response) {
// 						$(".carousel-control-next").css("height","600px");
// 						$(".carousel-control-prev").css("height","600px");
						console.log(file);
						console.log(response);
						//통신엔 성공했지만 파일유형이 image나 video가 아닌 겨우
						if(response.result=="fail"){
							alert("불가능한 파일유형입니다. ");
							return false;
						}
						//통신에 성공했으면서 파일유형이 imager나 video인 경우 정상적으로 태그를 붙여서 넣어줌
						var result = response.result;
						var type = response.type;
						if (type == "image") {
							var media = "<img class='cover' src=\""+response.result+"\">";
						} else {
							var media = "<video class='cover' src=\""+response.result+"\" controls>";
						}

						var index = Number($("#index").html());
						//캐러셀에서 첫번째 미디어만 active가 붙어야 정상동작하는데 그떼 사용하기 위해 index div를 만들어놓고 display none을 시켜놨음
						if (index == 0) {
							$(".carousel-indicators").append("<li data-target=\"#carouselExampleIndicators\" data-slide-to=\""+index+"\" class=\"active\"></li>")
							$(".carousel-inner").append("<div class=\"carousel-item active\">"+ media + "</div>");
						} else {
							$(".carousel-indicators").append("<li data-target=\"#carouselExampleIndicators\" data-slide-to=\""+index+"\"></li>")
							$(".carousel-inner").append("<div class=\"carousel-item\">"+ media + "</div>");
						}
						$("#index").html(index + 1);
					})
				}
			};
		$("#register").on("click", function(){
			var regex = /(\w+)/;
			var title = $("#title").val();
			if(title.match(regex)==null){
				alert("제목을 입력하세요");
				return;
			}
			var contents = $(".note-editable").html();
			console.log(contents);
			if(contents=="<p><br></p>"){
				alert("내용을 입력하세요");
				return;
			}
			$("#writeFeedForm").submit();
		})
	</script>
</body>
</html>