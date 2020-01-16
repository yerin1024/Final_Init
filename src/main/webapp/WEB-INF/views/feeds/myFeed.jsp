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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

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
	

	#feedList{
		border:2px solid red;
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
.profile{
	border:1px solid black;
	height:300px;
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
				data = data + "<div class='col-4 feed'><a href='/feed/detailView?feed_seqS="+list[index].feed_seq+"'>"+cover[index]+"</a></div>";
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
			<div class="profile" style="background-color:white; text-align:center;">
				<div>
			<label style="color:white;"></label> <br><img src="${pageContext.request.contextPath}/resources/images/default_profile_img.png"
				id="setProfile" style="width: 200px;border-radius:50%;">
				</div>
			
			<label style="color:black;">${dto.nickname }</label> 
			
			<label style="color:black;">${dto.profile_msg}</label>  
			
		<br>
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
	<div id="myFeed">
		
		<br><button id="registerFeed">게시물 등록</button>
		
		<div id="contents">
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
								<a href="/feed/detailView?feed_seqS=${feed.feed_seq }">${cover[status.count-1] }</a>
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
		role="dialog" aria-labelledby="myModalLabel" style="margin-top:100px;">
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
				<form action="${pageContext.request.contextPath}/friend/friendRequest?to_id=${dto.email}" method="post" id="goReqFri">
					<input type=radio name="relation" value="1"> 아는 사람<br>
					<input type=radio name="relation" value="2"> 친구<br>
					<input type=radio name="relation" value="3"> 절친<br>
					<input type=radio name="relation" value="4"> x새끼<br>
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
	<div id="modalBox2" class="modal fade" id="myModal2" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" style="margin-top:100px;">
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
					친구 검색 : <input type=text placeholder=이름,닉네임 id="searchFriends" value="">
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
	<script type="text/javascript">
	$("#changeProfile").on("click", function() {
		location.href = "${pageContext.request.contextPath}/member/goMyProfile";
	})
	$("#changeInfo").on("click", function() {
		location.href = "${pageContext.request.contextPath}/member/goMyInfo";
	})
		// 친구 모달 버튼에 이벤트를 건다.	
		$('#friendsList').on('click',function() {

				$('.frInfo').remove();
							$.ajax({
									url : "${pageContext.request.contextPath}/friend/selectFndList",
									type : "POST",
									dataType : "json",
									success : function(res) {
									console.log(res);
									if (res.waitlist != null) {
										var waitlist = JSON.parse(res.waitlist);
												for (var j = 0; j < waitlist.length; j++) {
													$('.modal-body2').append("<div class=frInfo>"+ waitlist[j].email+ "  <button type=button class=frInfo id=acceptfr name="+waitlist[j].email+">친구 추가</button><button type=button class=frInfo id=cancelfr name="+waitlist[j].email+">취소</button></div>");
												}
											}
											if (res.list != null) {
												var list = JSON.parse(res.list);
												for (var j = 0; j < list.length; j++) {
													$('.modal-body2').append("<div class=frInfo>"+ list[j].email+ "  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");
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
											$("#acceptfr").on("click",function() {
												var yr_id = $(this).attr("name");
																console.log(yr_id);
																$.ajax({
																			url : "${pageContext.request.contextPath}/friend/acceptFndRequest",
																			type : "POST",
																			data : {
																				yr_id : yr_id
																			},
																			dataType : "text",
																			success : function(res) {
																				console.log(res);
																				console.log(yr_id);
																				$('#friendsList').click();

																				//$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

																				// show modal

																			},
																			error : function(request,status,error) {													
																				console.log("ajax call went wrong:"+ request.responseText);
																			}
																		})
															});
											//친구 끊기
											$("#cutfr").on("click",	function() {
																var yr_id = $(this).attr("name");
																console.log(yr_id);
																$.ajax({
																			url : "${pageContext.request.contextPath}/friend/cutFndRelation",
																			type : "POST",
																			data : {
																				yr_id : yr_id
																			},
																			dataType : "text",
																			success : function(res) {
																				console.log(res);
																				console.log(yr_id);
																				$('#friendsList').click();

																				//$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

																				// show modal

																			},
																			error : function(request,status,error) {
																				console.log("ajax call went wrong:"+ request.responseText);
																			}
																		})
															});
											//친구 검색
											$('#searchFriends').on('keyup',function() {
												var search = $(this).val();
												console.log(search);
												$('.frInfo').remove();
															$.ajax({
																	url : "${pageContext.request.contextPath}/friend/searchFndList",
																	type : "POST",
																	dataType : "json",
																	data:{
																		search:search
																	},
																	success : function(res) {
																	
																	console.log(res);
																	if (res.waitlist != null) {
																		var waitlist = JSON.parse(res.waitlist);
																				for (var j = 0; j < waitlist.length; j++) {
																					$('.modal-body2').append("<div class=frInfo>"+ waitlist[j].email+ "  <button type=button class=frInfo id=acceptfr name="+waitlist[j].email+">친구 추가</button><button type=button class=frInfo id=cancelfr name="+waitlist[j].email+">취소</button></div>");
																				}
																			}
																			if (res.list != null) {
																				var list = JSON.parse(res.list);
																				for (var j = 0; j < list.length; j++) {
																					$('.modal-body2').append("<div class=frInfo>"+ list[j].email+ "  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");
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
																		error : function(request, status, error) {
																			console.log("ajax call went wrong:"
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