<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	body{
		background-color:white;
	}
	.feed {
		width: 20vw;
		height: 20vw;
		min-height: 150px;
		min-width: 150px;
		border: 1px solid red;
	}
	
	.cover {
		width: 100%;
		height: 100%;
	}
	#contents {
	border: 2px solid black;
	width: 60vw;
	min-width: 470px;
	margin: auto;
	text-align: center;
	}

#likeBtn, #bookmarkBtn{
	width:20px;
	height:20px;
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

	#feedList{
		border:2px solid red;
	}
	#feedList {
	border: 2px solid red;
}
	html, body {
	background-color: #1D4E89;
	margin: 0px;
	padding: 0px;
	height: 2000px;
}

.mainBox {
	height: 1000px;
}

.container-fluid {
	position: relative;
	top: 62px;
	z-index: -1;
}

.row {
	margin: 0px;
	padding: 0px;
}

.wrapper {
	max-width: 1200px;
	margin: auto;
	height: 1200px;
}

.section {
	border: 1px solid black;
	height: 430px;
	background-color: white;
	margin-bottom: 5px;
}

.left {
	margin-right: 5px;
}

.middle {
	margin-right: 5px;
}

.profile {
	border: 1px solid black;
	height: 300px;
}

.btn-primary1:hover, .btn-primary1:hover{
	background-color:white;
}
.btn-primary1:not(:disabled):not(.disabled).active, .btn-primary1:not(:disabled):not(.disabled):active, .show>.btn-primary1.dropdown-toggle{
	border:none;
	background-color:white;
}
.cover {
	width: 100%;
	height: 100%;
}
.btn-primary1{
	width:100%;
	height:100%;
	border-color:white;
	background-color:white;
	padding:0px;
	color:black;
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
	.row>.section {
		height: 200px;
	}
	.left, .right {
		display: none;
	}
}

/* Tablet Device */
@media all and (min-width:768px) and (max-width:1024px) {
	/*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
}

/* Desktop Device */
@media all and (min-width:1025px) {
	/*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
	body {
		background-color: blue;
	}
}
#writerProfile{
	width:50px;
	height:50px;
}
</style>
<script>

	$(function() {
		$("#registerFeed").on("click", function() {
			location.href = "writeFeed";
		})
	})
	
	
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
	        url : "/feed/myFeedAjax",
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
// 			for(i; i<end; i++){
// 				console.log(i);
// 		    	var data = $("<div class='col-4 feed'></div>");
// 		    	var a = $("<a href='/feed/detailView?feed_seqS="+list[index].feed_seq+"'>");
// 		    	a.append(cover[index]);
// 		    	data.append(a);
// 		    	if(i%3==1){
// 		    		data.before("<div class='row' style='margin:0px'>")
// 		    		console.log(data);
// 		    	}else if(i%3==0){
// 		    		data.after("</div>");
// 		    	}
// 		    	$("#feeds").append(data);
// 		    	index++;
// 			}
		})
	}
		
</script>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp" />
	<div class="container-fluid">
		<div class="wrapper">
			<div class="profile"
				style="background-color: white; text-align: center;">
				<div>
					<label style="color: white;"></label> <br>
					<img
						src="${pageContext.request.contextPath}/resources/images/default_profile_img.png"
						id="setProfile" style="width: 200px; border-radius: 50%;">
				</div>

				<label style="color: black;">${dto.nickname }</label> <label
					style="color: black;">${dto.profile_msg}</label> <br>
				<button type="button" id="changeProfile">프로필 편집</button>
				<button type="button" id="changeInfo">회원 정보 편집</button>
				<button type="button" id="friendsList">친구 목록</button>
			</div>
			<div class="mainBox">
				<div class="row">
					<div class="col m-20 section left">
						<p>Contents 1</p>
					</div>
					<div class="col m-20 section middle">
						<p>Contents 2</p>
					</div>
					<div class="col m-20 section right">
						<p>Contents 3</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="contents">

		<br>
		<button id="registerFeed">게시물 등록</button>

		<div id="myFeed">
			<c:choose>
				<c:when test="${fn:length(list) ==0}">
				게시물이 없습니다.
				</c:when>
				<c:otherwise>
				<div id="feeds">
						<c:forEach items="${list }" var="feed" varStatus="status">
							<c:if test="${status.count mod 3==1}">
								<div class="row" style="margin: 0px">
							</c:if>
							<div class="col-4 feed">
								<a class="btn btn-primary1" data-toggle="modal" data-target="#exampleModal" href="#" data-id="${feed.feed_seq }">${cover[status.count-1] }</a>
							</div>
							<c:if test="${status.count mod 3==0}">
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

	</div>


	<!-- 친구요청 모달을 열기 위한 버튼 -->
	<button type="button" class="btn btn-primary btn-lg" id="openModalBtn">
		친구 요청</button>
	<!-- 친구요청 모달 영역 -->
	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 관계 설정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>

				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/friend/friendRequest?to_id=${dto.email}"
						method="post" id="goReqFri">
						<input type=radio name="relation" value="1"> 아는 사람<br>
						<input type=radio name="relation" value="2"> 친구<br> <input
							type=radio name="relation" value="3"> 절친<br> <input
							type=radio name="relation" value="4"> x새끼<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="identifyModalBtn">확인</button>
					<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 친구 목록 모달 영역 -->
	<div id="modalBox2" class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 목록</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>
				<div style="text-align: center;">
					친구 검색 : <input type=text placeholder=이름,닉네임 id="searchFriends"
						value="">
				</div>
				<div class="modal-body2"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="identifyModalBtn2">확인</button>
					<button type="button" class="btn btn-default" id="closeModalBtn2">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 100px;">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">DETAIL VIEW</h5>
	         <span class="writerProfile"></span>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body1">
			
	      </div>
	      <div class="modal-footer1">
				
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
				console.log(ol.html());
				for(var i=0; i<mediaList.length; i++){
					console.log(i);
					if(i==0){
						ol.append("<li data-target='#carouselExampleIndicators' data-slide-to='0' class='active'></li>");
						console.log("i는 0");
						console.log(ol.html());
					}else{
						ol.append("<li data-targer='#carouselExampleIndicators' data-slide-to='"+i+"'></li>");
						console.log("i는 "+i);
						console.log(ol.html());
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
				
				$(".modal-body1").html(mediaRow);
			}
			
			
			//디테일뷰 글
			var textRow = $("<div class='row text'></div>");
			textRow.append(dto.contents);
			$(".modal-body1").append(textRow);
			
			
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
			$(".modal-footer1").append(likeA);
			$(".modal-footer1").append(bookmarkA);

			$(".writerProfile").html("<img src="+writerProfile+" id='writerProfile'>");
			
		})
		
		
		$('#myInput').trigger('focus');
		
	})

			$(document).on("click", "#like", function(e){
				e.preventDefault();   
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
		
		$(document).on("click","#bookmark", function(e){
			e.preventDefault();   
			var seq = $(this).attr("class");
			var bookmarkCheck = $("#bookmarkBtn").attr("class");
			if(bookmarkCheck=="bookmarkBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					console.log($("#bookmarkImg").html());
					$("#bookmarkImg").html("<img class=\"bookmarkAfter\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkAfter.png\">");
					console.log($("#bookmarkImg").html());
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					console.log("deleteBookmark done");
					$("#bookmarkImg").html("<img class=\"bookmarkBefore\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkBefore.png\">");
				})
			}
				
		})
	
	
		$("#changeProfile")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/member/goMyProfile";
						})
		$("#changeInfo")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/member/goMyInfo";
						})
		// 친구 모달 버튼에 이벤트를 건다.	
		$('#friendsList')
				.on(
						'click',
						function() {

							$('.frInfo').remove();
							$
									.ajax({
										url : "${pageContext.request.contextPath}/friend/selectFndList",
										type : "POST",
										dataType : "json",
										success : function(res) {
											console.log(res);
											if (res.waitlist != null) {
												var waitlist = JSON
														.parse(res.waitlist);
												for (var j = 0; j < waitlist.length; j++) {
													$('.modal-body2')
															.append(
																	"<div class=frInfo>"
																			+ waitlist[j].email
																			+ "  <button type=button class=frInfo id=acceptfr name="+waitlist[j].email+">친구 추가</button><button type=button class=frInfo id=cancelfr name="+waitlist[j].email+">취소</button></div>");
												}
											}
											if (res.list != null) {
												var list = JSON.parse(res.list);
												for (var j = 0; j < list.length; j++) {
													$('.modal-body2')
															.append(
																	"<div class=frInfo>"
																			+ list[j].email
																			+ "  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");
												}
											}
											// get the ajax response data
											// var data = res.body;

											// update modal content here
											// you may want to format data or 
											// update other modal elements here too
											// 		                console.log(changedStr.waitlist);
											// 		                console.log();

											// show modal
											$('#modalBox2').modal('show');

											//친구수락 로직~
											$("#acceptfr")
													.on(
															"click",
															function() {
																var yr_id = $(
																		this)
																		.attr(
																				"name");
																console
																		.log(yr_id);
																$
																		.ajax({
																			url : "${pageContext.request.contextPath}/friend/acceptFndRequest",
																			type : "POST",
																			data : {
																				yr_id : yr_id
																			},
																			dataType : "text",
																			success : function(
																					res) {
																				console
																						.log(res);
																				console
																						.log(yr_id);
																				$(
																						'#friendsList')
																						.click();

																				//$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

																				// show modal

																			},
																			error : function(
																					request,
																					status,
																					error) {
																				console
																						.log("ajax call went wrong:"
																								+ request.responseText);
																			}
																		})
															});
											//친구 끊기
											$("#cutfr")
													.on(
															"click",
															function() {
																var yr_id = $(
																		this)
																		.attr(
																				"name");
																console
																		.log(yr_id);
																$
																		.ajax({
																			url : "${pageContext.request.contextPath}/friend/cutFndRelation",
																			type : "POST",
																			data : {
																				yr_id : yr_id
																			},
																			dataType : "text",
																			success : function(
																					res) {
																				console
																						.log(res);
																				console
																						.log(yr_id);
																				$(
																						'#friendsList')
																						.click();

																				//$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

																				// show modal

																			},
																			error : function(
																					request,
																					status,
																					error) {
																				console
																						.log("ajax call went wrong:"
																								+ request.responseText);
																			}
																		})
															});
											//친구 검색
											$('#searchFriends')
													.on(
															'keyup',
															function() {
																var search = $(
																		this)
																		.val();
																console
																		.log(search);
																$('.frInfo')
																		.remove();
																$
																		.ajax({
																			url : "${pageContext.request.contextPath}/friend/searchFndList",
																			type : "POST",
																			dataType : "json",
																			data : {
																				search : search
																			},
																			success : function(
																					res) {

																				console
																						.log(res);
																				if (res.waitlist != null) {
																					var waitlist = JSON
																							.parse(res.waitlist);
																					for (var j = 0; j < waitlist.length; j++) {
																						$(
																								'.modal-body2')
																								.append(
																										"<div class=frInfo>"
																												+ waitlist[j].email
																												+ "  <button type=button class=frInfo id=acceptfr name="+waitlist[j].email+">친구 추가</button><button type=button class=frInfo id=cancelfr name="+waitlist[j].email+">취소</button></div>");
																					}
																				}
																				if (res.list != null) {
																					var list = JSON
																							.parse(res.list);
																					for (var j = 0; j < list.length; j++) {
																						$(
																								'.modal-body2')
																								.append(
																										"<div class=frInfo>"
																												+ list[j].email
																												+ "  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");
																					}
																				}
																				// get the ajax response data
																				// var data = res.body;

																				// update modal content here
																				// you may want to format data or 
																				// update other modal elements here too
																				// 		                console.log(changedStr.waitlist);
																				// 		                console.log();

																				// show modal

																				//친구 검색
																			},
																			error : function(
																					request,
																					status,
																					error) {
																				console
																						.log("ajax call went wrong:"
																								+ request.responseText);
																			}
																		});

															});
										},
										error : function(request, status, error) {
											console.log("ajax call went wrong:"
													+ request.responseText);
										}
									});

						});
		$('#closeModalBtn2').on('click', function() {

			$('#modalBox2').modal('hide');

		});
		$('#identifyModalBtn2').on('click', function() {

			$('#modalBox2').modal('hide');
		});

		$('#openModalBtn').on('click', function() {
			$('#modalBox').modal('show');
		});
		// 모달 안의 취소 버튼에 이벤트를 건다.	
		$('#closeModalBtn').on('click', function() {
			$('#modalBox').modal('hide');
		});
		
		$('#identifyModalBtn').on('click', function() {
			$("#goReqFri").submit();
			$('#modalBox').modal('hide');
		});
		//친구추가 ,취소 ,끊기
	</script>


</body>
</html>