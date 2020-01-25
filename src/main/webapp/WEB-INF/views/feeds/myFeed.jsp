<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/msg.css"> 
<link rel="stylesheet" href="/resources/css/alr.css"> 
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	body{
		background-color:white;
	}
	
	span.cover { 
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    word-break: break-all;
    max-width: 150px;
    max-height: 150px;
    overflow-y: hidden;
	}
	#contents {
	border: 2px solid black;
	width: 60vw;
	min-width: 470px;
	margin: auto;
	padding: 60px 20px 0;
}

#search {
   margin: auto;
   text-align: center;
}

#contents {
/* 	width:60vw; */
	margin:0px;
/*     margin: auto; */
    text-align: center;

}
.row{
	min-width:460px;
	margin-bottom:15px;
}
/* .title{ */
/*    display:inline-block; */
/*    position:absolute; */
/*    top:50%; */
/*    left:50%; */
/*    transform: translate(-50%, -50%); */
/* } */
/* .title{ */
/* 	display:inline-block; */
/* 	position:absolute;top:50%;left:50%;transform: translate(-50%, -50%); */
/* 	 word-break: break-all; */
/*     white-space: normal; */
/* } */
.parent([.title]){
	border:1px solid red;
}
.btn-primary{
   width:100%;
   height:100%;
   min-width:150px;
	min-height:150px;
   border-color:white;
   background-color:white;
   padding:0px;
   color:black;
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
   width:10px;
   text-align: center;
}

.carousel-inner {
   width: 400px;
}

.carousel-item * {
   width: 100%;
   height: 200px;
}
#writerProfile{
   width:50px;
   height:50px;
}

#keyword{
	width:300px;
}
.nickname{
	vertical-align:middle;
	line-height:60px;
	font-size:30px;
	font-weight:600;
	text-align:left;
}


.fRow:hover{
	background-color:#fafafa;
}
.nicknameA{
	color:#48689a;
}
.nicknameA:hover{
	text-decoration:none;
}

.feed {
    min-width: 150px;
    min-height: 150px;
    max-height: 200px;
    height: 26vw;
    width: 25vw;
	
#likeBtn, #bookmarkBtn{
   width:20px;
   height:20px;
}

.container-fluid {
	position: relative;
	top: 62px;
	max-width: 935px;
	padding: 60px 20px 0;
}
#carouselExampleIndicators{
   width:100%;
   height:100%;
}

.carousel-item{
	margin:auto;	
	width:100%;
	height:100%;
	text-align:center;
}
.carousel-inner{
	width:100%;
	height:100%;
	margin:auto;
}

.wrapper {
	max-width: 700px;
	margin: auto;
	height: 1200px;
}
.btn-primary:hover, .btn-primary:hover{
   background-color:white;
}
.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle{
   border:none;
   background-color:white;
}

/* 프로필 */
.profile {
	position: relative;
}

.profileMessageLayout {
	position: relative;
}

.report {
	position: absolute;
	right:0px;
	border: none;
	background-color: none;
}

.profileLayout {
	display: flex;
}

.profileLayoutLeft, .profileLayoutRight {
	margin: auto
}

.profileLayoutCenter {
	position: relative;
}

.profileImageLayOut {
	margin-right: 30px;
	width: 30%;
}

.profileImageBox {
	height: 300px;
	width: 300px;
	display: block;
}

.profileImg {
	height: 100%;
	width: 100%;
	border-radius: 160px;
	border: 1px solid black;
}

.profileButton {
	width: 125px;
	height: 125px;
	border-radius: 80px;
	border: 1px solid black;
	background-color: white;
}

.btn btn-primary btn-lg {
	width: 125px;
	height: 125px;
	border-radius: 80px;
	border: 1px solid black;
	background-color: white;
}

#changeProfile {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: -10px;
	border-radius: 20px;
	padding: 5px 20px;
	font-weight: bold;
	font-size: 13px;
	background-color: white;
}

#reportBtn {
	background-color: transparent;
	border: none;
}
/*This is coded CSS rainbow*/
#changeProfile:hover {
	-webkit-animation: rainbow 1s infinite;
	-ms-animation: rainbow 1s infinite;
	-o-animation: rainbow 1s infinite;
	animation: rainbow 1s infinite;
}

@-webkit-keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
@-ms-keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
@-o-keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
@keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
.profileName {
	text-align: center;
	font-size: 70px;
	font-weight: bold;
}

.profileMessageLayout {
	margin-bottom: 50px;
}

.profileMessage {
	text-align: center;
}

.btn-primary1:hover, .btn-primary1:hover{
	background-color:white;
}
.btn-primary1:not(:disabled):not(.disabled).active, .btn-primary1:not(:disabled):not(.disabled):active, .show>.btn-primary1.dropdown-toggle{
	border:none;
	background-color:white;
}
.btn-primary{
    width: 100%;
    height: 100%;
    min-width: 150px;
    min-height: 150px;
    border-color: white;
    background-color: white;
    padding: 0px;
    color: black;
}
.modal-dialog {
    max-width: 1200px;
    margin: 1.75rem auto;
}

.row{
    min-width: 460px;
    margin-bottom: 15px;
}
.modal-main{
    display: flex;
    height: 650px;
}
.carousel-item>img{
	width:100%;
	height:100%;
}
.reply {
		border:1px solid black;
        height: 100%;
        padding: 16px;
        overflow-y: scroll;
}

.reply::-webkit-scrollbar {
        width: 0 !important
}

.writerProfile,.userProfile,.myProfile{	
    margin-right: 16px;
    line-height: 50px;
}
.writerProfileImg{
	width:80px;
	height:80px;
	border-radius: 160px;
    border: 1px solid black;
}
.userProfileImg{
	width:40px;
	height:40px;
	border-radius: 160px;
    border: 1px solid black;
}
.childProfileImg{
	width:24px;
	height:24px;
	border-radius: 160px;
    border: 1px solid black;
}
.modal-btns{
	position:absolute;
    padding: 16px 16px;
    right:0px;
}
.writerInfo,.userInfo{
    margin-left: -12px;
    margin-right: 0;
    padding: 12px 16px 0px 16px;
    display:flex;
    flex-direction: column;
}
.childReply{
    margin-right: 0;
    padding: 0px 16px 0px 48px;
    display: flex;
    flex-wrap: wrap;
}
.userProfileID,.writerProfileID{
	font-weight: 600;
    padding-left: 5px;
    margin: 0px 5px 0px -5px;
    line-height: 50px;
}
.userReply,.text>p{
    line-height: 50px;
    width: 400px;
    word-break: break-all;	
    display: inherit;
}
}
.childContentsBox{
	width:322px;
    border: 1px solid rgb(239, 239, 239);
    border-radius: 16px;
    transition: all 1000ms ease 0s;
}
.footer-btns{
	display:flex;
    width: 50%;
    height:10%;
}
.writeReplyBox{
	display:flex;
    width: 50%;
    height:10%;
}
.modal-title{
	line-height: 50px;
}
#writeReply{	
    line-height:80px;
    margin: 0px 20px;
    min-height: 50px;
    font-size: 16px;
    width: 400px;
    border-radius: 16px;
    border: 1px solid rgb(239, 239, 239);
    padding: 0px 10px;
    
}
.replyBtns{
	margin:20px 20px;
}
.replyContents{	
    background: transparent;
    border: 0px;
    min-height: 50px;
    font-size: 16px;
    margin: 0px 12px;
    width: 100%;
    border-radius: 16px;
    border: 1px solid rgb(239, 239, 239);
    padding: 0px 10px;
}
.modal-body1{
	width:55%;
    height: 100%;
    position: relative;
    border:1px solid black;
}
.title{
	width:45%;
}

.childContentsBox{
    width: 350px;
}
.childReplyContents{
    border-radius: 16px;
    border: 1px solid rgb(239, 239, 239);
	background: transparent;
    min-height: 50px;
    font-size: 16px;
    outline: 0px;
    overflow-x: hidden;
    resize: none;
    width:100%;
    height:100%;
    white-space: pre-wrap;
    word-break: break-all;
    padding: 10px;
    
}
.profileDiv{	
    display: flex;
}
.detailView_header{
    display: flex;
    padding: 16px 20px;
}
.detailView_footer{
    display: flex;
    padding: 1rem 1rem;	
}
.modal-title{
	margin:auto;
}
.replyBtns>button, .replyBtn{
	background: 0 0;
    border: 0;
    cursor: pointer;
    display: inline;
    font-size: 12px;
    font-weight: 600;
    line-height: 14px;
    margin-right: 8px;
    padding: 0;
    color: #999;
    min-width: 30px;
    border: 1px solid #999;
    padding: 5px 7px;
    border-radius: 8px;
}

.myProfile{	
    margin: 5px 10px;
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

/* Desktop Device */
@media all and (min-width:1025px) {
	/*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
	body {
		background-color: pink;
	}
}
</style>
<script>
	window.onload = function(){
		
	
	var feedState = 0; // 0:PersonalFeed 1:ScrapFeed
	var myMail = '${mvo.email }';
	$(function() {
		
		$("#personalFeed").on("click", function() {
			feedState = 0;
			 page = 1;
			$('.row').remove();
			$.ajax({
				url : "${pageContext.request.contextPath}/feed/myPersonalFeed",
				type : "POST",
				data : {
					"email" : myMail
				},
				dataType : "json",
				success : function(res) {
					console.log(res);
					var list = JSON.parse(res.list);
			        var cover = JSON.parse(res.cover);
			          console.log(list);
					
				
			          var i = 0;
			          var end = list.length;
			          var index = 0;
			          var data = "";
			          
			          for(i; i<end; i++){
			              data = data + "<div class='col-4 feed'><a class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' href='#' data-id='"+list[index].feed_seq+"'>"+cover[index]+"</a></div>";
			              console.log(i);
			              if((i+1)%3==1){
			                 console.log(i+"는 1");
			                 data = "<div class='row' style='margin:0px'>" +data;
			              }
			              if((i+1)%3==0){
			                 console.log(i+"는0");
			                 data = data + "</div>";
			                  $("#feeds").append(data); 
			                  var data = "";
			              }
			              index++;
			            }
			            $("#feeds").append(data); 
			           
			            
					
				},//personalFeed done
				error : function(
						request,
						status,
						error) {
					console.log("ajax call went wrong:"+ request.responseText);
				}
			})
		})
		$("#scrapFeed").on("click", function() {
			feedState = 1;
			page = 1;
			$('.row').remove();
			$.ajax({
				url : "${pageContext.request.contextPath}/feed/myScrapFeed",
				type : "POST",
				data : {
					
					"email" : myMail
				},
				dataType : "json",
				success : function(res) {
					console.log(res);
					var list = JSON.parse(res.list);
			        var cover = JSON.parse(res.cover);
			          console.log(list);
					
				
			          var i = 0;
			          var end = list.length;
			          var index=0;
			          var data = "";
			          
			          for(i; i<end; i++){
			              data = data + "<div class='col-4 feed'><a class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' href='#' data-id='"+list[index].feed_seq+"'>"+cover[index]+"</a></div>";
			              console.log(i);
			              if((i+1)%3==1){
			                 console.log(i+"는 1");
			                 data = "<div class='row' style='margin:0px'>" +data;
			              }
			              if((i+1)%3==0){
			                 console.log(i+"는0");
			                 data = data + "</div>";
			                  $("#feeds").append(data); 
			                  var data = "";
			              }
			              index++;
			            }
			            $("#feeds").append(data); 
			            
			            
					
				},//personalFeed done
				error : function(
						request,
						status,
						error) {
					console.log("ajax call went wrong:"+ request.responseText);
				}
			})
		})
	})
	
	var page = 1; //페이징과 같은 방식이라고 생각하면 된다. 

	$(function() { //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
		if (page == 1) {
			page++;
		} else {
			getList(page);
			page++;
		}
	});

	$(window).scroll(
			function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
				if ($(window).scrollTop() >= $(document).height()
						- $(window).height() - 5) {
					console.log("스크롤감지");
					if(feedState == 1){
						if (page == 1) {
							console.log(page);
							page++;
						} else {
							console.log(page);
							getScrapList(page);
							page++;
						}
					}else{
						if (page == 1) {
							console.log(page);
							page++;
						} else {
							console.log(page);
							getList(page);
							page++;
						}
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
	    	   console.log("data.result : "+data);
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
	            index++;
	      })
	   }
	 function getScrapList(page){
	       $.ajax({
	           type : 'POST',  
	           dataType : 'json', 
	           data : {"page" : page},
	           url : "/feed/myScrapFeedAjax",
	           dataType:"JSON"
	       }).done(function(data){
	    	   console.log("data.result : "+data);
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
	            index++;
//	          for(i; i<end; i++){
//	             console.log(i);
//	              var data = $("<div class='col-4 feed'></div>");
//	              var a = $("<a href='/feed/detailView?feed_seqS="+list[index].feed_seq+"'>");
//	              a.append(cover[index]);
//	              data.append(a);
//	              if(i%3==1){
//	                 data.before("<div class='row' style='margin:0px'>")
//	                 console.log(data);
//	              }else if(i%3==0){
//	                 data.after("</div>");
//	              }
//	              $("#feeds").append(data);
//	              index++;
//	          }
	      })
	   }
	}
</script>
</head>

<body>
    <jsp:include page="/resources/jsp/nav.jsp" />
    <jsp:include page="/resources/jsp/alr.jsp"/>
	<jsp:include page="/resources/jsp/msg.jsp"/>
	<div class="container-fluid">
		<div class="profile">
			<c:choose>
				<c:when test="${loginInfo.email ne mvo.email}">
					<div class="profileLayout">
						<div class="profileLayoutLeft">
						<c:if test="${frResult == null || frResult == 0  }">
							<button class="btn btn-primary btn-lg" id="openModalBtn">＋</button>
							<div class="btnText">친구요청</div>
						</c:if>			
							<c:if test="${frResult == 1 }">
						<button class="btn btn-primary btn-lg" id="ingReq">＋</button>
							<div class="btnText">친구요청중</div>
						</c:if>	
						<c:if test="${frResult == 2  }">
							<button class="friend btn btn-primary btn-lg" id="openFrModal" >＋</button>
							<div class="btnText">친구</div>
						</c:if>	
						
						</div>
						<div class="profileLayoutCenter">
							<div class="profileImageBox">
								<img class="profileImg" src="${mvo.profile_img}" alt="">
						</div>
					</div>
					<div class="profileMessageLayout">
						<div class="profileName">${mvo.nickname }</div>
						<div class="profileMessage">${mvo.profile_msg}</div>
					</div>
					<div class="profileLayoutRight">
						<button class="friendRequest">＋</button>
						<div class="btnText">메세지</div>
					</div>
				</c:when>
				<c:otherwise>
				<c:choose>
					<c:when test="${loginInfo ne null}">
							<!-- 신고버튼 사라지기  -->
					</c:when>
					<c:otherwise>
					<div class="report">
						<button type="button" id="reportBtn">ㆍㆍㆍ</button>
					</div>
					</c:otherwise>
				</c:choose>
					
					<div class="profileLayout">
						<div class="profileLayoutLeft">
							<button class="profileButton" id="friendsList">＋</button>
							<div class="btnText">친구목록</div>
						</div>
						<div class="profileLayoutCenter">
							<div class="profileImageBox">
								<img class="profileImg" src="${mvo.profile_img}" alt="">
								<button type="button" id="changeProfile">프로필 편집</button>
						</div>
						</div>
						<c:if test="${loginInfo.id_type eq 'E'}">
							<div class="profileLayoutRight">
								<button class="profileButton" id="changeInfo">＋</button>
								<div class="btnText">회원정보</div>
							</div>
						</c:if>						
					</div>
					<div class="profileMessageLayout">
						<div class="profileName">${mvo.nickname }</div>
						<div class="profileMessage">${mvo.profile_msg}</div>
					</div>
				</c:otherwise>

			</c:choose>
		</div>

		<div class="menubar" style="height:200px;">
		<button type="button" id="personalFeed">Personal feed</button>
		<button type="button" id="scrapFeed">scrap feed</button>

		
		<button type="button" id="registerFeed">게시물 등록</button>
	
		</div>		
         </div>
         <div class="wrapper">			
			<div id="myFeed">
         <c:choose>
            <c:when test="${fn:length(list) ==0}">
            	게시물이 없습니다.
            </c:when>
            <c:otherwise>
            <div id="feeds">
                  <c:forEach items="${list }" var="feed" varStatus="status">
                     <c:if test="${status.count mod 3==1}">
                        <div class="row">
                     </c:if>
                     <div class="col-4 feed">
                        <a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" href="#" data-id="${feed.feed_seq }" style="min-height: 150px;">${cover[status.count-1] }</a>
                     </div>
                     <c:if test="${status.count mod 3==0}">
                        </div>
                     </c:if>
                  </c:forEach>
                  </div>
            </c:otherwise>
         </c:choose>
          </div>
	<!-- 친구요청 모달 영역 -->
	<div id="modalBox" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
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
					
						<input type=radio name="relation" value="1"> 아는 사람<br>
						<input type=radio name="relation" value="2"> 친구<br> <input
							type=radio name="relation" value="3"> 절친<br> 
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="identifyModalBtn">확인</button>
					<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 친구 목록 모달 영역 -->
	<div id="modalBox3" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myModalLabel2"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel2">친구 목록</h4>
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
					<button type="button" class="btn btn-default" id="closeModalBtn3">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px;">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="detailView_header">
	         <span class="writerProfile"><img class="userProfileImg" src="" alt=""></span>
	         <span class="writer"></span>
	        <h5 class="modal-title" id="exampleModalLabel"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-main">			
	      		<div class="modal-body1">
	      		</div>
            <div class="title">
                <div class="reply">
               		<div class="writerInfo">
                    		<span class="writerProfile"><img class="userProfileImg" src="${loginInfo.profile_img }" alt=""></span>
                     		<span class="writerProfileID">asdsadas</span>
                    </div>                     
                </div>
            </div>
        </div>        
	      <div class="detailView_footer">
	      	<div class="footer-btns"></div>
	      	<div class="writeReplyBox">					
	         	<span class="myProfile"><img class="userProfileImg" src="${loginInfo.profile_img }" alt=""></span>
	       		<h5 class="modal-title" id="exampleModalLabel">${loginInfo.nickname }</h5>
	       		<div id="writeReply" contenteditable="true"></div>
	       		<button type="button" class="replyBtn" onclick="replyBtnOnclick('${loginInfo.email}');">등록</button>
			</div>
	      </div>
	    </div>
	  </div>
	  </div>
	  
	  <!-- 친구 수락 모달 영역 -->
	<div id="modalBox1" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
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

				<div class="modal-body1">
					
						<input type=radio name="relation" value="1"> 아는 사람<br>
						<input type=radio name="relation" value="2"> 친구<br> 
						<input type=radio name="relation" value="3"> 절친<br> 
						
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="acceptModalBtn">확인</button>
					<button type="button" class="btn btn-default" id="closeModalBtn1">취소</button>
				</div>
			</div>
		</div>
	</div>
	  
	  <!-- 친구 특징 버튼 모달 영역 -->
	<div id="modalBox2" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
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

				<div class="modal-body2">
					
						<button type=button>친구 끊기</button> 
						
						
					
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" id="closeModalBtn2">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>	

	    $("#registerFeed").on("click", function() {
	    	location.href = "${pageContext.request.contextPath}/feed/writeFeed";
		});

	    
	

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
	
		        // 친구 모달 버튼에 이벤트를 건다.	
        $('#friendsList').on('click', function () {
        	$('#modalBox3').modal('show');
            $('.frInfo').remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/friend/selectFndList",
                type: "POST",
                dataType: "json",
                success: function (res) {
                    console.log(res);
                    if (res.waitlist != null) {
                        var waitlist = JSON
                            .parse(res.waitlist);
                        for (var j = 0; j < waitlist.length; j++) {
                            $('.modal-body2').append("<div class=frInfo><a href='${pageContext.request.contextPath}/feed/myFeed?email="
                                + waitlist[j].email
                                + "'>"
                                + waitlist[j].email
                                + " </a> <button type=button class='frInfo acceptfr' name=" + waitlist[j].email + ">친구 추가</button><button type=button class='frInfo cancelfr' name=" + waitlist[j].email + ">취소</button></div>");
                        }
                    }
                    if (res.list != null) {
                        var list = JSON.parse(res.list);
                        for (var j = 0; j < list.length; j++) {
                            $('.modal-body2').append(
                                "<div class=frInfo><a href='${pageContext.request.contextPath}/feed/myFeed?email="
                                + list[j].email
                                + "'>"
                                + list[j].email
                                + " </a> <button type=button class='frInfo cutfr' name=" + list[j].email + ">친구 끊기</button></div>");
                        }
                    }
                    

                    //친구수락 로직~
                    $("#acceptModalBtn").on("click", function () {
                        var yr_id = $('.acceptfr').attr("name");
                        var relation = $('input[name=relation]').val();
                        console.log(yr_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/acceptFndRequest",
                            type: "POST",
                            data: {
                                yr_id: yr_id,
                                relation : relation
                            },
                            dataType: "text",
                            success: function (
                                res) {
                                console
                                    .log(res);
                                console
                                    .log(yr_id);
                                $('#friendsList').click();
                                $('#modalBox1').modal('hide');
                                //$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

                                // show modal

                            },
                            error: function (
                                request,
                                status,
                                error) {
                                console.log("ajax call went wrong:"
                                    + request.responseText);
                            }
                        })
                    });
                    //친구 끊기
                    $(".cutfr").on("click", function () {
                        var yr_id = $(this).attr("name");
                        console.log(yr_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/cutFndRelation",
                            type: "POST",
                            data: {
                                yr_id: yr_id
                            },
                            dataType: "text",
                            success: function (res) {
                                console.log(res);
                                console.log(yr_id);
                                $('#friendsList').click();

                                //$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

                                // show modal

                            },
                            error: function (
                                request,
                                status,
                                error) {
                                console.log("ajax call went wrong:"
                                    + request.responseText);
                            }
                        })
                    });
                    //친구 검색
                    $('#searchFriends').on('keyup', function () {
                        var search = $(this).val();
                        console.log(search);
                        $('.frInfo').remove();
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/searchFndList",
                            type: "POST",
                            dataType: "json",
                            data: {
                                search: search
                            },
                            success: function (res) {
                                console.log(res);
                                if (res.waitlist != null) {
                                    var waitlist = JSON.parse(res.waitlist);
                                    for (var j = 0; j < waitlist.length; j++) {
                                        $('.modal-body2').append("<div class=frInfo id=wfrNum" + j + "><a href='${pageContext.request.contextPath}/feed/myFeed?email="
                                            + waitlist[j].email
                                            + "'>"
                                            + waitlist[j].email
                                            + " </a> <button type=button class='frInfo acceptfr'   name=" + waitlist[j].email + ">친구 추가</button><button type=button class='frInfo cancelfr' name=" + waitlist[j].email + ">취소</button></div>");
                                    }
                                }
                                if (res.list != null) {
                                    var list = JSON.parse(res.list);
                                    for (var j = 0; j < list.length; j++) {
                                        $('.modal-body2').append(
                                            "<div class=frInfo id=frNum" + j + "><a href='${pageContext.request.contextPath}/feed/myFeed?email="
                                            + list[j].email
                                            + "'>"
                                            + list[j].email
                                            + " </a> <button type=button class='frInfo cutfr' name=" + list[j].email + ">친구 끊기</button></div>");

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
                            error: function (
                                request,
                                status,
                                error) {
                                console.log("ajax call went wrong:"
                                    + request.responseText);
                            }
                        });
                        

                    });
                    $('.acceptfr').on('click', function() {
            			$('#modalBox1').modal('show');
            		});
                    //친구요청 취소
                    $(".cancelfr").on("click", function () {
                        var yr_id = $(this).attr("name");
                        console.log(yr_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/rejectFndRequest",
                            type: "POST",
                            data: {
                                yr_id: yr_id
                            },
                            dataType: "text",
                            success: function (res) {
                                console.log(res);
                                
                                $('#friendsList').click();

                                //$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

                                // show modal

                            },
                            error: function (
                                request,
                                status,
                                error) {
                                console.log("ajax call went wrong:"
                                    + request.responseText);
                            }
                        })
                    });
                },
                error: function (request, status, error) {
                    console.log("ajax call went wrong:"
                        + request.responseText);
                }
            });

        });

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
		$('#closeModalBtn2').on('click', function() {

			$('#modalBox3').modal('hide');

		});
		$('#identifyModalBtn2').on('click', function() {

			$('#modalBox3').modal('hide');
		});

		$('#openModalBtn').on('click', function() {
			$('#modalBox').modal('show');
		});
		$('#openFrModal').on('click', function() {
			$('#modalBox2').modal('show');
		});
		$('#closeModalBtn2').on('click', function() {
			$('#modalBox2').modal('hide');
		});
		
		// 모달 안의 취소 버튼에 이벤트를 건다.	
		$('#closeModalBtn').on('click', function() {
			$('#modalBox').modal('hide');
		});
		$('#closeModalBtn3').on('click', function() {
			$('#modalBox3').modal('hide');
		});
		
		$('#closeModalBtn1').on('click', function() {
			$('#modalBox1').modal('hide');
		});

		
		
		$('#identifyModalBtn').on('click', function () {
			var relation = $('input[name=relation]').val();
            
            
            $.ajax({
                url: "${pageContext.request.contextPath}/friend/friendRequest?to_id=${mvo.email}",
                type: "POST",
                dataType: "text",
                data: {
                    relation: relation
                },
                success: function (res) {
                	$('#modalBox').modal('hide');
                	console.log(res);
                    if(res == 'complete'){
                        alert("성공적으로 친구요청되었습니다.");
                        $(".btn-lg").remove();
                        $(".btnText").remove();
                        $(".profileLayoutLeft").append("<button class=btn btn-primary btn-lg >＋</button><div class=btnText>친구요청중</div>");
                        location.reload();
                    }else if(res == 'alreadyFriend'){
                    	alert("이미 친구입니다.");
                    }else if(res == 'alreadyApply'){
                    	alert("친구요청진행중입니다.");
                    }
                    
                    
                    
                    //친구 검색
                },
                error: function (
                    request,
                    status,
                    error) {
                    console.log("ajax call went wrong:"
                        + request.responseText);
                }
            })

        })
        $('#ingReq').on('click', function () {
			
            
            
            $.ajax({
                url: "${pageContext.request.contextPath}/friend/redoFndRequest?yr_id=${mvo.email}",
                type: "POST",
                dataType: "text",
                data: {
                   
                },
                success: function (res) {
                	
                	console.log(res);
                    if(res == 'ok'){
                        alert("성공적으로 친구요청이 취소 되었습니다.");
                        $(".btn-lg").remove();
                        $(".btnText").remove();
                        $(".profileLayoutLeft").append("<button class=btn btn-primary btn-lg id=openModalBtn >＋</button><div class=btnText>친구요청</div>");
                       location.reload();
                    }else{
                    	
                    }
                    
                    
                    
                    //친구 검색
                },
                error: function (
                    request,
                    status,
                    error) {
                    console.log("ajax call went wrong:"
                        + request.responseText);
                }
            });
            

        })
		
		</script>
   	<jsp:include page="/resources/script/myFeedScript.jsp" />
</body>
</html>