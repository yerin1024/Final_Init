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

.carousel-control-next, .carousel-control-prev {
	height: 600px;
}

.carousel-inner * {
	width: 600px;
	height: 600px;
}


</style>
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
<form action="/feed/mediaTmpUpload" class="dropzone"
		id="my-awesome-dropzone" enctype="multipart/form-data"></form>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-interval="false">
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
	<span id="index" style="display: none">0</span>
<form action="writeFeedProc" method="post" enctype="multipart/form-data" id="writeForm">
	제목:<input type="text" name="title">
	<select name="relation">
	<option value='' selected>-- 관계 선택 --</option>
	<option value='0'>전체보기</option>
	<option value='1'>지인</option>
	<option value='2'>아는친구</option>
	<option value='3'>절친</option>
	<option value='4'>나만보기</option>
	</select>
	<textarea name="contents" style="display: none" id="contents"></textarea>
	<button>등록</button>
</form>
<div id="summernote"></div>


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
		
		Dropzone.options.myAwesomeDropzone = {
				// paramName: "file", // The name that will be used to transfer the file
				//maxFilesize: 2, // MB
				//accept: function(file, done) {
				//  if (file.name == "justinbieber.jpg") {
				//     done("Naha, you don't.");
				//   }
				//  else { done(); }
				// }
				init : function(re) {
					console.log("ajax리턴");
					//성공했을때
					this.on("success",function(file, response) {
						console.log(file);
						var result = response.result;
						var type = response.type;
						if (type == "image") {
							var media = "<img src=\""+response.result+"\">";
						} else {
							var media = "<video src=\""+response.result+"\" controls>";
						}

						var index = Number($("#index").html());
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
	</script>
</body>
</html>