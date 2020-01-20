<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whole Feed</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/nav.css"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
#wrapper {
	margin: auto;
	padding: 60px 20px 0;
}

#search {
   margin: auto;
   text-align: center;
}

#contents {
/*    border: 2px solid black; */
   width: 65vw;
   min-width: 470px;
   margin: auto;
   text-align: center;

}

.row{
   margin:0px;
}
.feed {
   width: 20vw;
   height: 22vw;
   min-height: 150px;
   min-width: 150px;
   padding:10px;
/* 	border: 2px solid black; */
	width: 65vw;
	min-width: 470px;
	margin: auto;
	text-align: center;
}

}
.btn-primary:hover, .btn-primary:hover{
   background-color:white;
}
.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle{
   border:none;
   background-color:white;
}
.cover {
   width: 100%;
   height: 100%;
}
.title{
   display:inline-block;
   position:absolute;
   top:50%;
   left:50%;
   transform: translate(-50%, -50%);
}
.parent([.title]){
	border:1px solid red;
}
.title{
	display:inline-block;
	position:absolute;top:50%;left:50%;transform: translate(-50%, -50%);
	 word-break: break-all;
    white-space: normal;
}
.btn-primary{
   width:100%;
   height:100%;
   border-color:white;
   background-color:white;
   padding:0px;
   color:black;
}
#likeBtn, #bookmarkBtn{
   width:20px;
   height:20px;
}
#exampleModal{
	padding: 100px 20px 0;
}
#carouselExampleIndicators{
   width:100%;
}
.carousel-item {
   margin: auto;
   text-align: center;
}

.carousel-inner {
   width: 100%;
}

.carousel-item * {
   width: 200px;
   height: 200px;
}
#writerProfile{
   width:50px;
   height:50px;
}

</style>
<script>
var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 

$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
    if(page==1){ 
     page++;
    }else{
    	getList(page);
    	page++;
    }
}); 
 
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	if($(window).scrollTop() >= $(document).height() - $(window).height()-5){
	console.log("스크롤감지");
		if(page==1){ 
		     page++;
		    }else{
		    	getList(page);
		    	page++;
		    }
     } 
});

function getList(page){
    $.ajax({
        type : 'POST',  
        dataType : 'json', 
        data : {"page" : page},
        url : "/feed/wholeFeedAjax",
        dataType:"JSON"
    }).done(function(data){
    	console.log("data.result : "+data.result);
    	if(data.result=="false"){
    		console.log("false");
    		return 'false';
    	}
		var rnum = JSON.parse(data.rnum);
		console.log("rnum : "+rnum);
    	var list = JSON.parse(data.list);
    	var cover = JSON.parse(data.cover);
    	console.log(list);
    	var i =Number(rnum[0]);
    	console.log("rnum[0] : " +i);
    	var end = (Number(i)+list.length);
    	var index=0;
    	var data = "";
    	for(i; i<end; i++){
			data = data + "<div class='col-4 feed'><a class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' href='#' data-id='"+list[index].feed_seq+"'>"+cover[index]+"</a></div>";
			console.log(i);
			if(i%3==1){
				console.log(i+"는 1");
				data = "<div class='row' style='margin:0px'>" +data;
			}
			if(i%3==0){
				console.log(i+"는0");
				data = data + "</div>";

		    	$("#feeds").append(data); 
		    	var data = "";
			}
			
    	}
    	$("#feeds").append(data); 
    	
//			for(i; i<end; i++){
//				console.log(i);
//		    	var data = $("<div class='col-4 feed'></div>");
//		    	var a = $("<a href='/feed/detailView?feed_seqS="+list[index].feed_seq+"'>");
//		    	a.append(cover[index]);
//		    	data.append(a);
//		    	if(i%3==1){
//		    		data.before("<div class='row' style='margin:0px'>")
//		    		console.log(data);
//		    	}else if(i%3==0){
//		    		data.after("</div>");
//		    	}
//		    	$("#feeds").append(data);
//		    	index++;
//			}
	})
}
</script>
</head>
<body>
 <jsp:include page="/resources/jsp/nav.jsp" />
	<div id="wrapper">
		<div id="search">
			<br><br>
			<form action="wholeFeed" method="post">
				<input type="text" name="keyword" id="keyword">
				<button>검색</button>
			</form>
			<br><br>
		</div>
<!-- 		wholeFeed는 친구검색일 경우와 피드검색일 경우로 나뉘고 default는 검색내용없이 전체피드가 나오도록 했음 -->
		<div id="contents">
			<c:if test="${option eq 'friend' }"><!-- 		친구검색일 경우 -->
				<c:choose>
					<c:when test="${fn:length(friendList) >0 }">
					<div id="feeds">
						<c:forEach items="${friendList}" var="friend">
						<div class="row">
							<div class="col-4">
								<img src="${friend.profile_img}" style="width:100px;">
							</div>
							<div class="col-8">
								<a href="${pageContext.request.contextPath}/feed/myFeed?email=${friend.email}">${friend.nickname}</a>
							</div>
						</div>
						</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
					검색한 친구 없습니다.
					</c:otherwise>
				</c:choose>
			</c:if>

			<c:if test="${option eq 'nfriend' }"><!-- 		피드검색일 경우 -->
				<c:choose>
					<c:when test="${fn:length(list) <1}">
					게시물이 없습니다.
					</c:when>
					<c:otherwise>
						<div id="feeds">
							<c:forEach items="${list }" var="feed" varStatus="status">
								<c:if test="${status.count mod 3==1}">
									<div class="row" >
								</c:if>
								
								<div class="col-4 feed">
									<a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" href="#" data-id="${feed.feed_seq }">${cover[status.count-1] }</a>
								</div>
								
								<c:if test="${status.count mod 3==0}">

									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>

	
		
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">DETAIL VIEW</h5>
	        <span class="writerProfile"></span>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			
	      </div>
	      <div class="modal-footer">
				
	      </div>
	    </div>
	  </div>
	<script>
	$('#exampleModal').on('shown.bs.modal', function (event) {
		var seq= $(event.relatedTarget).data('id');
		console.log("seq : "+seq);
		$.ajax({
			type:"post",
			url:"/feed/detailView",
			data:{
				feed_seqS:seq
			},
			dataType:"json"
		}).done(function(data){
			console.log(data);
			var writerProfile = data.writerProfile;
			console.log(writerProfile)
			var likeCheck = data.likeCheck;
			var bookmarkCheck = data.bookmarkCheck;
			var mediaList = JSON.parse(data.media);
			var dto = JSON.parse(data.dto);
			console.log(mediaList.length);
			
			//디테일뷰 미디어
			if(mediaList.length>0){ //미디어가 존재하므로 캐러셀 만들어줌
				console.log("캐러셀 시작");
				var mediaRow = $("<div class='row media'></div>");
				var cei = $("<div id='carouselExampleIndicators' class='carousel slide' data-interval='false'></div>");
				var ol = $("<ol class='carousel-indicators'></ol>");
				for(var i=0; i<mediaList.length; i++){
					console.log(i);
					if(i==0){
						ol.append("<li data-target='#carouselExampleIndicators' data-slide-to='0' class='active'></li>");
						console.log("i는 0");
					}else{
						ol.append("<li data-targer='#carouselExampleIndicators' data-slide-to='"+i+"'></li>");
					}
				}
				cei.append(ol);
				
				var cInner = $("<div class='carousel-inner'></div>");
				for(var i=0; i<mediaList.length; i++){
					if(i==0){
						var cItem = $("<div class='carousel-item active'>"+mediaList[i]+"</div>");
					}else{
						var cItem = $("<div class='carousel-item'>"+mediaList[i]+"</div>");
					}
					cInner.append(cItem);
				}
				var prevA = $("<a class='carousel-control-prev' href='#carouselExampleIndicators' role='button' data-slide='prev'></a>");
				prevA.append("<span class='carousel-control-prev-icon' aria-hidden='ture'></span>");
				prevA.append("<span class='sr-only'>Previous</span>");
				var nextA = $("<a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'></a>");
				nextA.append("<span class='carousel-control-next-icon' aria-hidden='ture'></span>");
				nextA.append("<span class='sr-only'>Next</span>");
				
				cInner.append(prevA);
				cInner.append(nextA);
				
				cei.append(cInner);
				mediaRow.append(cei);
				
				$(".modal-body").html(mediaRow);
			}
			
			
			//디테일뷰 글
			var textRow = $("<div class='row text'></div>");
			textRow.append(dto.contents);
			$(".modal-body").append(textRow);
			
			
			//디테일뷰 좋아요, 스크랩, 수정, 삭제 버튼
			//좋아요버튼
			if(likeCheck==0){
				var likeA = $("<a href='#' id='like' class='"+dto.feed_seq+"'></a>");
				var likeS = $("<span id='likeImg'></span>");
				var likeI = $("<img id='likeBtn' class='likeBefore' src='${pageContext.request.contextPath}/resources/images/likeBefore.png'>");
			}else{
				var likeA = $("<a href='#' id='like' class='"+dto.feed_seq+"'></a>");
				var likeS = $("<span id='likeImg'></span>");
				var likeI = $("<img id='likeBtn' class='likeAfter' src='${pageContext.request.contextPath}/resources/images/likeAfter.png'>");
			}
			likeA.append(likeS);
			likeS.append(likeI); 
		
			//스크랩버튼
			if(bookmarkCheck==0){
				var bookmarkA = $("<a href='#' id='bookmark' class='"+dto.feed_seq+"'></a>");
				var bookmarkS = $("<span id='bookmarkImg'></span>");
				var bookmarkI = $("<img id='bookmarkBtn' class='bookmarkBefore' src='${pageContext.request.contextPath}/resources/images/bookmarkBefore.png'>");
			}else{
				var bookmarkA = $("<a href='#' id='bookmark' class='"+dto.feed_seq+"'></a>");
				var bookmarkS = $("<span id='bookmarkImg'></span>");
				var bookmarkI = $("<img id='bookmarkBtn' class='bookmarkAfter' src='${pageContext.request.contextPath}/resources/images/bookmarkAfter.png'>");
			}
			bookmarkA.append(bookmarkS);
			bookmarkS.append(bookmarkI); 
			
			$(".modal-footer1").html("");
			$(".modal-footer").html(likeA);
			$(".modal-footer").append(bookmarkA);
			$(".writerProfile").html("<img src="+writerProfile+" id='writerProfile'>");
		})
		
		
		$('#myInput').trigger('focus');
		
	})

			$(document).on("click", "#like", function(){
			var seq = $(this).attr("class");
			var likeCheck = $("#likeBtn").attr("class");
			if(likeCheck=="likeBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertLike",
					data : {feed_seq : seq}
				}).done(function(){
					$("#likeImg").html("<img class=\"likeAfter\" id=\"likeBtn\" src=\"${pageContext.request.contextPath }/resources/images/likeAfter.png\">");
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteLike",
					data : {feed_seq : seq}
				}).done(function(){
					$("#likeImg").html("<img class=\"likeBefore\" id=\"likeBtn\" src=\"${pageContext.request.contextPath }/resources/images/likeBefore.png\">");
				})
			}
		})
		
		$(document).on("click","#bookmark", function(){
			var seq = $(this).attr("class");
			var bookmarkCheck = $("#bookmarkBtn").attr("class");
			if(bookmarkCheck=="bookmarkBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					$("#bookmarkImg").html("<img class=\"bookmarkAfter\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkAfter.png\">");
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					$("#bookmarkImg").html("<img class=\"bookmarkBefore\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkBefore.png\">");
				})
			}
				
		})
	</script>
</body>
</html>