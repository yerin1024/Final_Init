<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whole Feed</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
#wrapper {
	margin: auto;
}

#search {
	margin: auto;
	text-align: center;
}

#contents {
	border: 2px solid black;
	width: 60vw;
	min-width: 470px;
	margin: auto;
	text-align: center;
}

.feed {
	width: 20vw;
	height: 20vw;
	min-height: 150px;
	min-width: 150px;
	border: 1px solid red;
	padding:0px;
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
.btn-primary{
	width:100%;
	height:100%;
	border-color:white;
	background-color:white;
	padding:0px;
	color:black;
}
.likeBtn, .bookmarkBtn{
	width:20px;
	height:20px;
}
.modal-contents{
	height:300px;
}
.modal-contents div{
	width:100%;
}
.row{
	margin:0px;
	margin-left:10px;
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
			console.log(data);
			if(i%3==1){
				data = "<div class='row' style='margin:0px'>" +data;
			}
			if(i%3==0){
				data = data + "</div>";
			}
			
			index++;
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
								${friend.profile_img }
							</div>
							<div class="col-8">
								${friend.nickname }
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
									<div class="row" style="margin: 0px">
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
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-contents">

	      </div>
	      <div class="modal-footer">

			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
			var likeCheck = data.likeCheck;
			var bookmarkCheck = data.bookmarkCheck;
			var mediaList = JSON.parse(data.media);
			var dto = JSON.parse(data.dto);
			
			$("#dtoContents").html(dto.contents);
			if(mediaList.length>0){
				console.log("media.length>0");
				var media = $("<div class='row media'></div>");
			}
			
			var feed = $("<div class='feedDetail'></div>");
			var nick = $("<div class='row nickname'></div>");
			nick.append(dto.nickname);

			var media = $("<div class='row media'></div>");

			var CEI = $("<div id='carouselExampleIndicators' class='carousel slide' data-interval='false'></div>");

			var olCEI = $("<ol class='carousel-indicators'></ol>");

			for (var m = 0; m < mediaList.length; m++) {
				var liCEI = $("<li data-target='#carouselExampleIndicators'></li>");
				if (m == 0) {
					liCEI.attr("data-slide-to", 0);
					liCEI.addClass("active");
				} else {
					liCEI.attr("data-slide-to", m);
				}
				olCEI.append(liCEI);
			}
			CEI.append(olCEI);

			var ci = $("<div class='carousel-inner'>");

			for (var m = 0; m < mediaList.length; m++) {
				var divCI = $("<div class='carousel-item'></div>");
				if (m == 0) {
					divCI.addClass("active");
					divCI.append(mediaList[m]);
				} else {
					divCI.append(mediaList[m]);
				}
				ci.append(divCI);
			}
			ci.append("<a class='carousel-control-prev' href='#carouselExampleIndicators' role='button' data-slide='prev'>");
			ci.append("<span class='carousel-control-prev-icon' aria-hidden='true'></span> <span class='sr-only'>Previous</span></a>");
			ci.append("<a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'>");
			ci.append("<span class='carousel-control-next-icon' aria-hidden='true'></span> <span class='sr-only'>Next</span></a>");

			media.append(ci);
			feed.append(nick);
			feed.append(media);

			var contents = $("<div class='row contents' style='height:100px'></div>");
			contents.append(dto.contents);

			feed.append(contents);

			var btns = $("<div class='row btns'></div>");

			if (likeCheck == 0) {
				var imgBTNS = $("<img class='likeBtn' value='likeBefore' src='${pageContext.request.contextPath }/resources/images/likeBefore.png'>");
				var spanBTNS = $("<span class='likeImg' ></span>");
				imgBTNS.attr("seq", seq);
				spanBTNS.append(imgBTNS);
				spanBTNS.attr("seq", seq);

				var aBTNS = $("<a href='#' class='like' onclick='return false'></a>");
				aBTNS.attr("id", seq);
				aBTNS.append(spanBTNS);
				btns.append(aBTNS);
			} else {
				var imgBTNS = $("<img class='likeBtn' value='likeAfter' src='${pageContext.request.contextPath }/resources/images/likeAfter.png'>");
				var spanBTNS = $("<span class='likeImg'></span>");
				imgBTNS.attr("seq", seq);
				spanBTNS.append(imgBTNS);
				spanBTNS.attr("seq", seq);

				var aBTNS = $("<a href='#' class='like' onclick='return false'></a>");
				aBTNS.attr("id", seq);
				aBTNS.append(spanBTNS);
				btns.append(aBTNS);
			}

			if (bookmarkCheck == 0) {
				var imgBTNS = $("<img class='bookmarkBtn' value='bookmarkBefore' src='${pageContext.request.contextPath }/resources/images/bookmarkBefore.png'>");
				var spanBTNS = $("<span class='bookmarkImg' ></span>");
				imgBTNS.attr("seq", seq);
				spanBTNS.append(imgBTNS);
				spanBTNS.attr("seq", seq);

				var aBTNS = $("<a href='#' class='bookmark' onclick='return false'></a>");
				aBTNS.attr("id", seq);
				aBTNS.append(spanBTNS);
				btns.append(aBTNS);
			} else {
				var imgBTNS = $("<img class='bookmarkBtn' value='bookmarkAfter' src='${pageContext.request.contextPath }/resources/images/bookmarkAfter.png'>");
				var spanBTNS = $("<span class='bookmarkImg' ></span>");
				imgBTNS.attr("seq", seq);
				spanBTNS.append(imgBTNS);
				spanBTNS.attr("seq", seq);

				var aBTNS = $("<a href='#' class='bookmark' onclick='return false'></a>");
				aBTNS.attr("id", seq);
				aBTNS.append(spanBTNS);
				btns.append(aBTNS);
			}
			feed.append(btns);
			$(".modal-contents").append(feed);
			

		})
		
		$('#myInput').trigger('focus');
	})

		$(document).on("click", ".like", function(){
			var seq = $(this).attr("id");
			var likeCheck = $("#likeBtn").attr("class");
			if(likeCheck=="likeBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertLike",
					data : {feed_seq : seq}
				}).done(function(){
					$(".likeImg").html("<img class=\"likeAfter\" id=\"likeBtn\" src=\"${pageContext.request.contextPath }/resources/images/likeAfter.png\">");
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteLike",
					data : {feed_seq : seq}
				}).done(function(){
					$(".likeImg").html("<img class=\"likeBefore\" id=\"likeBtn\" src=\"${pageContext.request.contextPath }/resources/images/likeBefore.png\">");
				})
			}
		})
		
		$(document).on("click", ".bookmark", function(){
			var seq = $(this).attr("id");
			var bookmarkCheck = $("#bookmarkBtn").attr("class");
			if(bookmarkCheck=="bookmarkBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					$(".bookmarkImg").html("<img class=\"bookmarkAfter\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkAfter.png\">");
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					$(".bookmarkImg").html("<img class=\"bookmarkBefore\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkBefore.png\">");
				})
			}
		})
	</script>
</body>
</html>