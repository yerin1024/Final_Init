<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<link rel="stylesheet" href="/resources/css/nav.css?new"> 
<link rel="stylesheet" href="/resources/css/msg.css"> 
<link rel="stylesheet" href="/resources/css/alr.css"> 
<link rel="stylesheet" href="/resources/css/test.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
/* 	폰트 */
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR|Orbitron&display=swap');
	
	body{
		background-color:#171C28;
    	font-family: Orbitron;
	}
	div.cover { 
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    word-break: break-all;
    max-width: 150px;
    max-height: 150px;
    overflow-y: hidden;
    color:black;
	}
	img.cover{	
    width: 100%;
    height: 100%;
	}
	video.cover{	
    width: 100%;
    height: 100%;
	}
	#contents {
	border: 2px solid black;
	width: 60vw;
	min-width: 470px;
	margin: auto;
	padding: 60px 20px 0;
}
.modifyA, .deleteA{
	color:black;
	margin-right:10px;
	font-size:15px;
}
.modifyA:hover, .deleteA:hover{
	font-weight:bold;
	color:black;
}
#search {
   margin: auto;
   text-align: center;
}

#contents {
	margin:0px;
    text-align: center;

}
.row{
	min-width:460px;
    margin-bottom: 30px;
}
.media{	
	width:100%;
	height:100%;
    margin: 0px;
}
.media>p{
	padding:10px;
}
.parent([.title]){
	border:1px solid red;
}
.btn-primary{
   width:100%;
   height:100%;
   min-width:150px;
	min-height:150px;
   background-color:white;
   padding:0px;
   color:black;
   border: 1px solid black;
}
#likeBtn, #bookmarkBtn{
   width:50px;
   height:50px;
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
}
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
    margin: 30px auto 50px;
}
#myFeed{
	color:white;
	font-size:20px;
	text-align:center;
	margin-top:70px;
	font-weight:bold;
}

/* 프로필 */
.profile {
	position: relative;
}

.profileMessageLayout {
	position: relative;
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
    border: 1px solid black;
    border-radius: 180px;
}

.profileImg {
	height: 100%;
	width: 100%;
	border-radius: 160px;
	border: 1px solid black;
}

.profileButton{
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
    max-width: 600px;
    margin: auto;
    font-size: 15px;
	font-family: 'Noto Serif KR', serif;
}

.modal-dialog {
    max-width: 1200px;
    margin: 1.75rem auto;
}
.modal-main{
    display: flex;
    height: 650px;
    border-top: 1px solid #ebebeb;
   	width:99.99%;
}
.carousel-item>img{
	width:100%;
	height:100%;
}
.reply {
		border:1px solid #ebebeb;
		width:99.9%;
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
}
.writerInfo,.parentReply{
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

/* 메뉴바 */
.menubar{
    max-width: 600px;;
    min-width: 464px;
    margin: auto;
}
.menubar>button{
	border:none; 
	background-color:transparent;
    font-size: 20px;
    color:white;
    width: 32.7%;
}

/* 버튼호버 */
.profileButton:hover, .profileImageBox:hover{
  display: -webkit-box;
  display: flex;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
  --borderWidth: 3px;
  position: relative;
}
.profileButton:after, .profileImageBox:after {  
  content: '';
  position: absolute;
  top: calc(-1 * var(--borderWidth));
  left: calc(-1 * var(--borderWidth));
  height: calc(100% + var(--borderWidth) * 2);
  width: calc(100% + var(--borderWidth) * 2);
  background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
  z-index: -1;
  animation: animatedgradient 3s ease alternate infinite;
  background-size: 300% 300%;
  border-radius: 160px;
}


@-webkit-keyframes animatedgradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}


@keyframes animatedgradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

.clock {
	position: absolute; 
    top: -80px;
	left: 50%; 	
    color: #17D4FE;
    font-size: 20px;
    font-family: Orbitron;
    letter-spacing: 7px;
    transition-duration: 0.5s;
    transform: translateX(-50%);
}
.report{	
    position: absolute;
    right: 110px; 	
    top: -50px;
}
.blockFr{	
    width: 30px;
    height: 30px;
}
/* 호버 */
/* All Device */
/* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. */

/* Mobile Device */
/* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device */
@media all and (min-width:768px) {
	/*     사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	body {
		background-color: #171C28;
	}
}

@media all and (max-width:768px) {
	/*     사용자 해상도가 768px 이하일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	.profileButton {
    	width: 70px;
   		height: 70px;
	}
/* 	.row{ */
/* 		margin:0px; */
/* 	} */
	.container-fluid {
    	padding:0px;
    }
/*     .feed{ */
/*     	padding:0px; */
/*     } */
    .profileMessage {
    	max-width: 400px;
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
		background-color: #171C28;
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
			                 data = "<div class='row'>" +data;
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
			                 data = "<div class='row'>" +data;
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
	           data : {"page" : page,"email" : myMail},
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
	              index++;
	            }
	            $("#feeds").append(data); 
	            
	      })
	   }
	 function getScrapList(page){
	       $.ajax({
	           type : 'POST',  
	           dataType : 'json', 
	           data : {"page" : page,"email" : myMail},
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
	              index++;
	            }
	            $("#feeds").append(data); 
	            
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
		<div id="MyClockDisplay" class="clock" onload="showTime()"></div>
		<div class="profile">
			<c:choose>
				<c:when test="${loginInfo.email ne mvo.email}">
				<div class="report">
				        <c:if test="${blockSize == 0  }">
							<img class="blockFr" src="/resources/images/whitex.png" alt="">
						</c:if>
						<c:if test="${blockSize > 0  }">
							<img class="blockFr" src="/resources/images/limex.png" alt="">
						</c:if>
						
					</div>
					<div class="profileLayout">
					
						<div class="profileLayoutLeft">
						<c:if test="${frResult == null || frResult == 0  }">
							<button class="profileButton btn-lg" id="openModalBtn">＋</button>
							<div class="btnText">친구요청</div>
						</c:if>			
							<c:if test="${frResult == 1 }">
						<button class="profileButton btn-lg" id="ingReq">＋</button>
							<div class="btnText">친구요청중</div>
						</c:if>	
						<c:if test="${frResult == 2  }">
							<button class="profileButton btn-lg" id="openFrModal" >＋</button>
							<div class="btnText">친구</div>
						</c:if>	
						
						</div>
						<div class="profileLayoutCenter">
							<div class="profileImageBox">
								<img class="profileImg" src="${mvo.profile_img}" alt="">
						</div>
					</div>
					
					<div class="profileLayoutRight">
						<button class="messageRequest profileButton" id="msgRequest">＋</button>
						<div class="btnText">메세지</div>
					</div>
					</div>
					<div class="profileMessageLayout">
						<div class="profileName">${mvo.nickname }</div>
						<div class="profileMessage">${mvo.profile_msg}</div>
					</div>
				</c:when>
				<c:otherwise>
				
					
					
					
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
				<div class="static" style="margin:auto; text-align:center;">
				<br>
				<table style="width:80%; margin:auto; ">
				<tr>
				<td style="color:gainsboro; font-size:40px;">${fn:length(list)}
				<td style="color:gainsboro; font-size:40px;">${fn:length(flist)}
				</tr>
				<tr>
				<td style="color:grey; font-size:13px;">Posts
				<td style="color:grey; font-size:13px;">Friends
				</tr>
				</table>
				<br>
				</div>
				<div class="menubar">
		<button type="button" id="personalFeed">Personal feed</button>
		<button type="button" id="scrapFeed">scrap feed</button>
		<button type="button" id="registerFeed">게시물 등록</button>	
		</div>
				</c:otherwise>

			</c:choose>
		</div>
					
         <div class="wrapper">			
			<div id="myFeed">
         <c:choose>
            <c:when test="${fn:length(list) <1}">
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
					<input type=radio name="relation" value="3"> 절친<br>
					<input type=radio name="relation" value="2"> 친구<br>
					<input type=radio name="relation" value="1" checked="checked"> 아는 사람<br>
						 
						 
					
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
	        <h5 class="modal-title" id="exampleModalLabel" style=""></h5>
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
	      	<div class="footer-btns" style="display:flex;width:50%;height:10%;"></div>
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
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body1">
					<input type=radio name="arelation" value="3"> 절친<br>
					<input type=radio name="arelation" value="2"> 친구<br> 
					<input type=radio name="arelation" value="1" checked="checked"> 아는 사람<br>
					
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
					
						<button type=button class="frcutfr" name="${mvo.email }">친구 끊기</button> 
						
						
					
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" id="closeModalBtn2">확인</button>
				</div>
			</div>
		</div>
	</div>

	
	<div id="modalBox4" class="modal fade" id="myModal"
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

				<div class="modal-body4">
					
					<input type=radio name="crelation" value="3"> 절친<br> 
					<input type=radio name="crelation" value="2"> 친구<br> 
					<input type=radio name="crelation" value="1" checked="checked"> 아는 사람<br>
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" id="closeModalBtn4">확인</button>
				</div>
			</div>
		</div>
	</div>

	
	
<!-- 친구 관계 설정 모달 영역 --><!-- 	내 정보 수정 시작 -->
	<div id="modalModifyInfo" class="modal fade" role="dialog" tabindex="-1"
	aria-labelledby="modalModify" style="margin-top: 45px;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header header">
				<h4 class="modal-title" id="modalModify" style="color: white;">My
					Information</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="${pageContext.request.contextPath}/member/changeMyInfo"
					method="post" id="signUpForm">
					<div class="body" style="text-align: center; color: #0D4373;">
						<!-- 이메일 -->
						<label></label>
						<div class="userInput" id="email" name="email"
							style="font-family: fantasy; font-size: 20px;">${loginInfo.email}</div>
						<br> <label>비밀번호</label><br>
						<div id="changePwDiv" style="display: none;">
							<!-- 현재 비밀번호 -->
							<label>현재 비밀번호</label> <input type="password" class="userInput_pw"
								autocomplete="off" id="curPw" maxlength="12">
							<p class="advise" id="adviseCurPw" readonly></p>
							<p class="hiddenResp" id="hiddenRespCurPw" style="display: none;"></p>
							<!-- 변경 비밀번호 -->
							<label>변경 비밀번호</label><span class="required">*</span><br> <input
								type="password" class="userInput_pw" autocomplete="off" id="pw"
								name="pw" maxlength="12" placeholder="비밀번호(영문 대소문자, 숫자 6~15자리)">
							<!-- 변경 비밀번호 확인 -->
							<input type="password" class="userInput_pw" autocomplete="off"
								id="confirmPw" maxlength="12" placeholder="비밀번호 재입력"><br>
							<p class="advise" id="advisePw" readonly></p>
							<p class="hiddenResp" id="hiddenRespPw" style="display: none;"></p>
							<br>
						</div>
						<button type="button" id="changePw">비밀번호 변경</button>
						<br>
						<button type="button" id="cancelChangePw" style="display: none;">이전</button>
						<button type="button" id="changePwComplete" style="display: none;">변경
							완료</button>
						<br>

						<!-- 이름 -->
						<label>이름</label><span class="required">*</span class="required"><br> <input
							type="text" class="userInput" id="username" name="name"
							maxlength="70">
						<p class="advise" id="adviseName" readonly></p>
						<p class="hiddenResp" id="hiddenRespName" style="display: none;"></p>
						<!-- 생년월일 -->
						<label>생년월일</label><span class="required">*</span class="required"><br> <select
							name="year" id="birthYear">
							<option class="bOption1">선택하세요.</option>
						</select> <select name="month" id="birthMonth">
							<option class="bOption2">선택하세요.</option>
						</select> <select name="day" id="birthDay">
							<option class="bOption3">선택하세요.</option>
						</select> <input type="text" id="birth" name="birth" hidden><br>
						<p class="advise" id="adviseBirth" readonly></p>
						<p class="hiddenResp" id="hiddenRespBirth" style="display: none;"></p>
						<!-- 전화번호 -->
						<label>전화번호</label><span class="required">*</span class="required"><br> <select
							id="phone1" style="text-align: center; width: 80px; height: 30px">
							<option class="pOption1" value="010">010</option>
							<option class="pOption1" value="011">011</option>
							<option class="pOption1" value="016">016</option>
							<option class="pOption1" value="017">017</option>
							<option class="pOption1" value="018">018</option>
							<option class="pOption1" value="019">019</option>
						</select> - <input type="text" id="phone2" maxlength="4"
							style="text-align: center; width: 80px;"> - <input
							type="text" id="phone3" maxlength="4"
							style="text-align: center; width: 80px;"> <input
							type="text" id="phone" name="phone" maxlength="11"
							style="display: none;">
						<p class="advise" id="advisePhone" readonly></p>
						<p class="hiddenResp" id="hiddenRespPhone" style="display: none;"></p>
						<!-- 인증번호 -->
						<input type="text" id="verifyCode" name="verifyCode"
							placeholder="인증번호 입력" maxlength="6" style="text-align: center;">
						<button type="button" id="sendCode">인증번호
							전송</button>
						<span id="timer" readonly></span>
						<button type="button" id="resendCode" hidden>인증번호 재전송</button>
						<br>
						<button type="button" id="confirmVerifyCode" hidden>인증번호 확인</button>
						<br>
						<p class="advise" id="adviseVerifCode" readonly></p>
						<p class="hiddenResp" id="hiddenRespVerifCode" hidden></p>
					</div>
					<div class="footer" style="text-align: center;">
						<button type=button id="withdrawMem">회원탈퇴</button>
						<button type=button id="changeMyInfo">수정완료</button>
						<button type=button id="backToFeed">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>	
<!-- 	내 정보 수정 끝 -->

<!-- 내 프로필 수정 시작 -->
<form action="${pageContext.request.contextPath}/member/changeProfile" method="post" enctype="multipart/form-data" id="profileFrm">
        <div class="container">
            <div class="profileContainer">
                <div class="modal fade" id="modalProfile" tabindex="-1" role="dialog" aria-labelledby="modalProfileTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header header" style="color:white;">
                                <h5 class="modal-title" id="title">프로필 편집</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="text-align:center; color:#0D4373;">
                                <label style="margin:auto;">프로필 사진</label><br>
                                <img src="/resources/images/default_profile_img.png" id="setProfile" style="margin:auto; width:30%; border-radius:50%"><br><br>
                                <button type="button" id="deletePic">X</button>
                                <input type="file" id="profileImg" name="profileImg" ><br> 
                                <p class="adviseOut" id="adviseProfile" readonly>*프로필 사진 미등록시 기본이미지로 등록됩니다.</p>
                                <label>닉네임 : </label>
                                <input type="text" id="inputNick" name="nickname" maxlength="20">
                                <label class="adviseIn" id="adviseInNickname" hidden></label><br>
                                <p class="adviseOut" id="adviseNickname" readonly>*4~20자 영문 대 소문자, 숫자, 특수문자(_)만 사용 가능합니다.</p>
                                <label>상태 매세지 : </label>
                                <input type="text" id="inputProfile_msg" name="profile_msg" maxlength="200">
                                <label class="adviseIn" id="adviseInProfile-msg" hidden></label><br>
                                <p class="adviseOut" id="adviseProfile-msg" readonly>*200자 이내로 입력 가능합니다.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="changeProfileBtn" style="color:#0D4373; width:200px; margin-right:5%;">편집 완료</button>
                                <button type="button" id="cancelBtn"  style="color:#0D4373; width:200px; margin-right:5%;">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
<!-- 내 프로필 수정 끝	 -->

	
	<script>	
	var myMail = '${mvo.email }';
		var doc = document;
		var relation = "";
	    $("#registerFeed").on("click", function() {
	    	location.href = "${pageContext.request.contextPath}/feed/writeFeed";
		});
	    
	    
	    // 메시지 보내기 -----------------------------------------------------------
	    // 메시지 보내기 -----------------------------------------------------------
	    // 메시지 보내기 -----------------------------------------------------------
	    $("#msgRequest").on("click",function(){
	    	
	    	$("div[id='view1']").fadeIn(0);
	    	var friendId = '${mvo.email}';
			var nickname = '${mvo.nickname}';
			
				 $.ajax({
					url: "${pageContext.request.contextPath}/message/messageView.msg",
					method: "post",
					data: {
						to_id: friendId
					},
					dataType: "json"
				 }).done(function(resp){
					 $(".pre_top").children().remove();
					 $(".pre_top").append("<div class='pre_back' style='display:none;'><img src='/images/left4.png' class='pre_back_img'></div>"
					            + "<div class='pre_top_pf'></div>"
					            + "<div class='pre_text'><span class='pre_text_name'>"+nickname+"</span></div>");
					 
					 $(".sector_in").children().remove();
					 $(".search").children().remove();
					 for(var i=0; i < resp.length; i++){
						 
						 if(resp[i].from_id=="${loginInfo.email}"){
							 $(".sector_in").append("<ul class='ul_right'>"
						                +"<li class='from_id'>"+resp[i].contents+"</li><span class=time_right>"
						                +resp[i].write_date_edit+"</span><br></ul>");
						 }else{
							 $(".sector_in").append("<ul class='ul_left'>"
						                + "<li class='to_id'>"+resp[i].contents+"</li><span class=time>"
						                +resp[i].write_date_edit+"</span><br></ul>");
						 }
					}
					 var objDiv = document.getElementById("view1");
		        	 objDiv.scrollTop=objDiv.scrollHeight;
		        	 $("#footer").children().remove();
		        	 $("#footer").append("<div id='footer_cont'>"
		                    	+"<input type='text' id='inputtxt' placeholder='Type a message...'>"
		               			+"<button id='sendfly'><img src='/images/send.png' id=sendup></button>"
		            			+"</div>");
		        	
		        	 // 메시지 엔터키 전송
		        	$("#inputtxt").keydown(function(e) {
		                if (e.keyCode == 13) {
		                	document.getElementById("sendfly").click();
		                }
		            });
		        	 
		        	// 메시지 전송
		        	 $("#sendfly").on("click",function(){
		        		 $.ajax({
		        			 url : "${pageContext.request.contextPath}/message/sendFly.msg",
		        			 method : "post",
		        			 data : {
		        				 contents : $("#inputtxt").val(),
		        				 to_id: friendId
		        				 },
        				 dataType : "json"
		        		 }).done(function(resp) {
		        			 $("#inputtxt").val("");
		        			 $(".sector_in").append("<ul class='ul_right'><li class='from_id'>"
		        					 +resp.contents+"</li><span class=time_right></span><span class=readCheck></span><br></ul>");
		        			 var objDiv = document.getElementById("view1");
		        			 objDiv.scrollTop=objDiv.scrollHeight;
		        			 
		        		 }).fail(function(a,b,c){
		        			 console.log(a); console.log(b); console.log(c);
		        		 })
		        	 });
		        	 
		        	 // 대화창에서 목록으로
		        	 $(".pre_back").on("click",function(){
		        		 console.log("뒤로 가기 클릭");
		        		 document.getElementById("ac1_1").click();
	     			 });
				 
				 }).fail(function(a,b,c){
					 console.log(a); console.log(b); console.log(c);
				 })
				
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
                                + " </a> <button type=button class='frInfo cutfr' name=" + list[j].email + ">친구 끊기</button> <button type=button class='frInfo changeRelation' name=" + list[j].email + ">친구 관계 변경</button></div>");
                        }
                    }
                    

                    //친구수락 로직~
                    $("#acceptModalBtn").on("click", function () {
                        var yr_id = $('.acceptfr').attr("name");
                        var arelation = $('input[name=arelation]:checked').val();
                        console.log(yr_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/acceptFndRequest",
                            type: "POST",
                            data: {
                                "yr_id": yr_id,
                                "relation" : arelation
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
                                            + " </a> <button type=button class='frInfo cutfr' name=" + list[j].email + ">친구 끊기</button> <button type=button class='frInfo changeRelation' name=" + list[j].email + ">친구 관계 변경</button></div>");

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
                  //친구 관계 설정
                        $('.changeRelation').on('click', function() {
			             $('#modalBox4').modal('show');
		                 });
                        $("#closeModalBtn4").on("click", function () {
                        var yr_id = $(".changeRelation").attr("name");
                        var crelation = $('input:radio[name="crelation"]:checked').val();
                        console.log(yr_id);
                        console.log(crelation);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/changeRelation",
                            type: "POST",
                            data: {
                                "yr_id": yr_id,"relation" :crelation
                            },
                            dataType: "text",
                            success: function (res) {
                                console.log(res);
                                console.log(yr_id);
                                alert("친구 관계 설정 변경이 완료되었습니다.");
                                $('#modalBox4').modal('hide');

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
                }, //전체 리스트 done 영역
                error: function (request, status, error) {
                    console.log("ajax call went wrong:"
                        + request.responseText);
                }
            });

        });

			
	
		$("#changeProfile").on("click", function() {
			var doc = document;
	        var changeProfile = doc.getElementById("changeProfile");
	        var nickname = doc.getElementById("inputNick");
	        var profile_msg = doc.getElementById("profile_msg");
	        
	        var adviseNickname = doc.getElementById("adviseNickname");
	        var adviseInNickname = doc.getElementById("adviseInNickname");
	        var adviseIn = doc.getElementsByClassName("adviseIn");

	        var deletePic = doc.getElementById("deletePic");
	        var setProfile = doc.getElementById("setProfile");
	        var profile_img = doc.getElementById("profileImg");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/member/goMyProfile",
				type: "post",
				dataType: "json",
				data: {email : "${loginInfo.email}"}
			}).done(function(data){
				var dto = JSON.parse(data.dto)
				$('#modalProfile').modal('show');
				nickname.value = dto.nickname;
				console.log("profile_msg : " + dto.profile_msg);
				if(typeof dto.profile_msg != "undefined"){
					profile_msg.value = dto.profile_msg;
				}
				setProfile.src = dto.profile_img;
								
				 function readURL(input) {
			            if (input.files && input.files[0]) {
			                	var reader = new FileReader();                
			                	reader.onload = function (e) {
				                    console.log(profile_img.value);  // 파일명                
				                    setProfile.src = e.target.result; 
			               		}                
			                reader.readAsDataURL(input.files[0]);
			            }
			        }

			        profile_img.addEventListener("change", function(){
			            readURL(this);
			        });

			        deletePic.addEventListener("click", function(){
			            setProfile.src = "resources/default_profile_img.png";
			        });     

			        nickname.addEventListener("keyup", function(){
			            rawStr = nickname.value;
			            console.log(rawStr);
			            var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{2,18}[A-Za-z0-9]{1}$/;
			            if(regExp.test(rawStr)){
			                console.log("validate");
			                adviseNickname.innerHTML = "";
			                $.ajax({
			                url : "${pageContext.request.contextPath}/guest/checkNickname.do",
			                data : {nickname : rawStr},
			                dataType : "json",
			                type : "post"
			                }).done(function(resp){
			                    console.log(resp);
			                    console.log(resp.result);
			                    if(resp.result == "available"){
			                    	adviseNickname.innerHTML = "사용가능";
			                    	adviseNickname.style.color = "green";
			                        adviseInNickname.innerHTML = "사용가능";
			                    }else{
			                    	adviseNickname.innerHTML = "중복된 닉네임입니다.";
			                    	adviseNickname.style.color = "red";
			                        adviseInNickname.innerHTML = "사용불가";
			                        return false;
			                    }
			                }).fail(function(a,b,c){                	
			                    console.log(a);
			                    console.log(b);
			                    console.log(c);
			                    return false;
			                });
			            }else{
			                adviseNickname.innerHTML = "올바른 닉네임이 아닙니다."
			                adviseNickname.style.color = "red";
			                adviseInNickname.innerHTML = "사용불가";
			                console.log("invalidate");
			            }
			        });
			        
					$("#changeProfileBtn").on("click", function(){
						for(var i = 0; i < adviseIn.length; i++){
			                if(adviseIn[i].innerHTML === "사용불가"){
			                    console.log("유효성 통과 탈락");
			                    return false;
			                }
			            }
			        	if(nickname.value === ""){
			            	adviseNickname.innerHTML = "필수 입력사항입니다."
			                adviseNickname.style.color = "red";
			                return false;
			            }
			            console.log("완성 닉네임 : " + nickname.value);
			            doc.getElementById("profileFrm").submit();
					}); 
			        //submit 직전 유효성 검사

			        $("#cancelBtn").on("click", function() {
							$("#modalProfile").modal("hide");
						});
				
			}).fail(function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
			});
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
			relation = $('input[name=relation]:checked').val();          
            
            $.ajax({
                url: "${pageContext.request.contextPath}/friend/friendRequest?to_id=${mvo.email}",
                type: "POST",
                dataType: "text",
                data: {
                    "relation": relation
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
        //친구 끊기
    $(".frcutfr").on("click", function () {
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
                alert("친구취소가 완료되었습니다.");
                $('#modalBox2').modal('hide');
                $(".btn-lg").remove();
                $(".btnText").remove();
                $(".profileLayoutLeft").append("<button class=btn btn-primary btn-lg id=openModalBtn >＋</button><div class=btnText>친구요청</div>");
               location.reload();
                
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
	
    $(".profileImageBox").mouseenter(function(){
		$("#MyClockDisplay").css("top","0px");
    });
     $(".profileImageBox").mouseleave(function(){ 
 		$("#MyClockDisplay").css("top","-80px");
    }); 
	function showTime(){
	    var date = new Date();
	    var h = date.getHours(); // 0 - 23
	    var m = date.getMinutes(); // 0 - 59
	    var s = date.getSeconds(); // 0 - 59
	    var session = "AM";
	    
	    if(h == 0){
	        h = 12;
	    }
	    
	    if(h > 12){
	        h = h - 12;
	        session = "PM";
	    }
	    
	    h = (h < 10) ? "0" + h : h;
	    m = (m < 10) ? "0" + m : m;
	    s = (s < 10) ? "0" + s : s;
	    
	    var time = h + ":" + m + ":" + s + " " + session;
	    document.getElementById("MyClockDisplay").innerText = time;
	    document.getElementById("MyClockDisplay").textContent = time;
	    
	    setTimeout(showTime, 1000);
	    
	}

	showTime();
	
    var poption1;
    var boption1;
    var boption2;
    var boption3;

    $("#changeInfo").on("click", function () {
        $.ajax({
            url: "${pageCotnext.request.contextPath}/member/goMyInfo",
            data: { email: "${loginInfo.email}" },
            dataType: "json",
            type: "post"
        }).done(function (data) {
            $('#modalModifyInfo').modal('show');
            console.log("email : " + data.dto);
            var dto = JSON.parse(data.dto);
            console.log("dto : " + dto.email);
            $("#username").val(dto.name);
            $("#phone2").val(data.poption2);
            $("#phone3").val(data.poption3);
            poption1 = data.poption1;
            boption1 = data.boption1;
            boption2 = data.boption2;
            boption3 = data.boption3;         
                     
            var dLength = $(".pOption1").length;
            for (var i = 0; i < dLength; i++) {
                if ($(".pOption1:nth-child(" + i + ")").val() == poption1) {
                    $(".pOption1:nth-child(" + i + ")")
                        .attr('selected', 'selected');
                }
            }


	

    var poption1;
    var boption1;
    var boption2;
    var boption3;

    $("#changeInfo").on("click", function () {
        $.ajax({
            url: "${pageCotnext.request.contextPath}/member/goMyInfo",
            data: { email: "${loginInfo.email}" },
            dataType: "json",
            type: "post"
        }).done(function (data) {
            $('#modalModifyInfo').modal('show');
            console.log("email : " + data.dto);
            var dto = JSON.parse(data.dto);
            console.log("dto : " + dto.email);
            $("#username").val(dto.name);
            $("#phone2").val(data.poption2);
            $("#phone3").val(data.poption3);
            poption1 = data.poption1;
            boption1 = data.boption1;
            boption2 = data.boption2;
            boption3 = data.boption3;         

            //생년월일 select option 생성 start
            function appendYear() {
                var date = new Date();
                var year = date.getFullYear();
                var selectVal = doc.getElementById("birthYear");
                var optionIndex = 0;
                for (var i = year - 100; i <= year; i++) {
                    if (boption1 == i) {
                        console.log("boption1 : " + boption1);
                        var opt = new Option(i + "년", i);
                        selectVal.add(opt, optionIndex++);
                        opt.setAttribute("class", "bOption1");
                        opt.setAttribute("selected", "selected");
                    } else {
                        var opt = new Option(i + "년", i);
                        selectVal.add(opt, optionIndex++);
                        opt.setAttribute("class", "bOption1");
                    }
                }
            }

            function appendMonth() {
                var selectVal = doc.getElementById("birthMonth");
                var optionIndex = 0;
                for (var i = 1; i <= 12; i++) {
                    if (boption2 == i) {
                        console.log("boption2 : " + boption2);
                        var opt = new Option(i + "월", i);
                        selectVal.add(opt, optionIndex++);
                        opt.setAttribute("class", "bOption2");
                        opt.setAttribute("selected", "selected");
                    } else {
                        var opt = new Option(i + "월", i);
                        selectVal.add(opt, optionIndex++);
                        opt.setAttribute("class", "bOption2");
                    }
                }
            }

            function appendDay() {
                var selectVal = doc.getElementById("birthDay");
                var optionIndex = 0;
                for (var i = 1; i <= 31; i++) {
                    if (boption3 == i) {
                        console.log("boption3 : " + boption3);
                        var opt = new Option(i + "일", i);
                        selectVal.add(opt, optionIndex++);
                        opt.setAttribute("class", "bOption3");
                        opt.setAttribute("selected", "selected");
                    } else {
                        var opt = new Option(i + "일", i);
                        selectVal.add(opt, optionIndex++);
                        opt.setAttribute("class", "bOption3");
                    }
                }
            }
            //생년월일 select option 생성 end
            
            var dLength = $(".pOption1").length;
            for (var i = 0; i < dLength; i++) {
                if ($(".pOption1:nth-child(" + i + ")").val() == poption1) {
                    $(".pOption1:nth-child(" + i + ")")
                        .attr('selected', 'selected');
                }
            }


            var bLength1 = $(".bOption1").length;
            for (var i = 0; i < bLength1; i++) {
                if ($(".bOption1:nth-child(" + i + ")").val() == boption1) {
                    $(".bOption1:nth-child(" + i + ")")
                        .attr('selected', 'selected');
                }
            }

            var bLength2 = $(".bOption2").length;
            for (var i = 0; i < bLength2; i++) {
                if ($(".bOption2:nth-child(" + i + ")").val() == boption2) {
                    $(".bOption2:nth-child(" + i + ")")
                        .attr('selected', 'selected');
                }
            }

            var bLength3 = $(".bOption3").length;
            for (var i = 0; i < bLength3; i++) {
                if ($(".bOption3:nth-child(" + i + ")").val() == boption3) {
                    $(".bOption3:nth-child(" + i + ")")
                        .attr('selected', 'selected');
                }
            }     
        }).fail(function (a, b, c) {
            console.log(a);
            console.log(b);
            console.log(c);
        });
    });

    appendYear();
    appendMonth();
    appendDay();

    // 내 정보 수정 modal 관련 script 시작
    //입력 변수
    var curPw = doc.getElementById("curPw");
    var pw = doc.getElementById("pw");
    var confirmPw = doc.getElementById("confirmPw");
    var username = doc.getElementById("username");
    var birthYear = doc.getElementById("birthYear");
    var birthMonth = doc.getElementById("birthMonth");
    var birthDay = doc.getElementById("birthDay");
    var birth = doc.getElementById("birth");
    var phone = doc.getElementById("phone");
    var phone1 = doc.getElementById("phone1");
    var phone2 = doc.getElementById("phone2");
    var phone3 = doc.getElementById("phone3");
    var verifyCode = doc.getElementById("verifyCode");
    var sendCode = doc.getElementById("sendCode");
    var resendCode = doc.getElementById("resendCode");
    var confirmVerifyCode = doc.getElementById("confirmVerifyCode");
    var timer = doc.getElementById("timer");
    var changePwDiv = doc.getElementById("changePwDiv");
    var changePw = doc.getElementById("changePw");
    var changePwComplete = doc.getElementById("changePwComplete");
    var cancelChangePw = doc.getElementById("cancelChangePw");

    // 검증 실시간 확인 변수
    var adviseCurPw = doc.getElementById("adviseCurPw");
    var advisePw = doc.getElementById("advisePw");
    var adviseName = doc.getElementById("adviseName");
    var adviseBirth = doc.getElementById("adviseBirth");
    var advisePhone = doc.getElementById("advisePhone");
    var adviseVerifCode = doc.getElementById("adviseVerifCode");

    // 검증결과 변수
    var hiddenResp = doc.getElementsByClassName("hiddenResp");
    var hiddenRespCurPw = doc.getElementById("hiddenRespCurPw");
    var hiddenRespPw = doc.getElementById("hiddenRespPw");
    var hiddenRespName = doc.getElementById("hiddenRespName");
    var hiddenRespBirth = doc.getElementById("hiddenRespBirth");
    var hiddenRespPhone = doc.getElementById("hiddenRespPhone");
    var hiddenVerifCode = doc.getElementById("hiddenVerifCode");

    // 기타 전역 변수
    var setTime = 300;
    var tid = null;
    var rawStr = null;

    changePw.addEventListener("click", function () {
        adviseCurPw.innerHTML = "";
        advisePw.innerHTML = "";
        changePwComplete.style.display = "initial";
        cancelChangePw.style.display = "initial";
        changePw.style.display = "none";
        changePwDiv.style.display = "initial";
    });

    cancelChangePw.addEventListener("click", function () {
        adviseCurPw.innerHTML = "";
        advisePw.innerHTML = "";
        var userInput = doc.querySelectorAll(".userInput_pw");
        clearInput(userInput, userInput.length);
        pw.value = "";
        changePwComplete.style.display = "none";
        cancelChangePw.style.display = "none";
        changePw.style.display = "initial";
        changePwDiv.style.display = "none";
    });

    changePwComplete.addEventListener("click", function () {
        if (pw.value === "") {
            advisePw.innerHTML = "필수 입력사항입니다."
            advisePw.style.color = "red";
            return false;
        }

        if (curPw.value == pw.value) {
            advisePw.innerHTML = "기존 비밀번호와 동일하게 설정 불가합니다."
            advisePw.style.color = "red";
            hiddenRespPw.innerHTML = "사용불가";
            return false;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/member/changePw",
            data: {
                pw: pw.value
            },
            type: "post",
            dataType: "json"
        }).done(function (resp) {
            if (resp.result == "complete") {
                changePwComplete.style.display = "none";
                cancelChangePw.style.display = "none";
                changePw.style.display = "initial";
                changePwDiv.style.display = "none";
                alert("비밀번호가 정상적으로 변경되었습니다.");
                adviseCurPw.innerHTML = "";
                advisePw.innerHTML = "";
                var userInput = doc.querySelectorAll(".userInput_pw");
                clearInput(userInput, userInput.length);
            } else {
                alert("비밀번호 변경에 실패했습니다.");
                adviseCurPw.innerHTML = "";
                advisePw.innerHTML = "";
                var userInput = doc.querySelectorAll(".userInput_pw");
                clearInput(userInput, userInput.length);
            }
        }).fail(function (a, b, c) {
            console.log(a);
            console.log(b);
            console.log(c);
        });
    });

    $("#withdrawMem").on("click", function () {
        if (confirm("정말 탈퇴하시겠습니까?")) {
            location.href = "${pageContext.request.contextPath}/member/withdrawMem";
        }
    });

    $("#backToFeed").on("click", function () {
    	clearInterval(tid);
    	$("#modalModifyInfo").modal('hide');
    });

    //현재 비밀번호 일치여부 검사 start
    curPw.addEventListener("blur", function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/member/identifyMemPw",
            data: {
                pw: curPw.value
            },
            type: "post",
            dataType: "json",
        }).done(function (resp) {
            console.log(resp);
            if (resp.result == "validate") {
                adviseCurPw.innerHTML = "일치"
                adviseCurPw.style.color = "green";
                hiddenRespPw.innerHTML = "사용가능";
            } else if (resp.result == "invalidate") {
                adviseCurPw.innerHTML = "비밀번호를 정확히 입력해 주세요."
                adviseCurPw.style.color = "red";
                hiddenRespPw.innerHTML = "사용불가";
            }
        }).fail(function (a, b, c) {
            console.log(a);
            console.log(b);
            console.log(c);
            hiddenRespPw.innerHTML = "사용불가";
        });
    });

    // 비밀번호 유효성 검사 start
    pw.addEventListener("blur", function () {
        rawStr = pw.value;
        console.log("pw: " + rawStr);
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
        if (rawStr.length != 0) {
            if (regExp.test(rawStr)) {
                if (rawStr === curPw.value) {
                    advisePw.innerHTML = "기존 비밀번호와 동일하게 설정 불가합니다."
                    advisePw.style.color = "red";
                    hiddenRespPw.innerHTML = "사용불가";
                } else {
                    advisePw.innerHTML = "";
                    console.log("pw 유효성 검사결과: validate");
                }

            } else {
                advisePw.innerHTML = "올바른 비밀번호 형식이 아닙니다."
                advisePw.style.color = "red";
                hiddenRespPw.innerHTML = "사용불가";
                console.log("pw 유효성 검사결과: invalidate");
            }
        }
    });

    confirmPw.addEventListener("blur", function () {
        if (rawStr.length != 0) {
            if (confirmPw.value != pw.value) {
                advisePw.innerHTML = "비밀번호가 일치하지 않습니다."
                advisePw.style.color = "red";
                hiddenRespPw.innerHTML = "사용불가";
                confirmPw.value = "";
                console.log("confirmPw 일치여부: invalidate");
            } else {
                advisePw.innerHTML = "";
                hiddenRespPw.innerHTML = "사용가능";
                console.log("confirmPw 일치여부: validate");
            }
        }
    });

    pw.addEventListener("change", function () {
        confirmPw.value = "";
        advisePw.innerHTML = "";
    });
    //비밀번호 유효성 검사 end

    //이름 유효성 검사 start
    username.addEventListener("blur", function () {
        rawStr = username.value;
        console.log("name: " + rawStr);
        var regExp = /^[가-힣]{2,35}$/;
        if (rawStr.length != 0) {
            if (regExp.test(rawStr)) {
                console.log("name 유효성 검사결과: validate");
                adviseName.innerHTML = "";
                hiddenRespName.innerHTML = "사용가능";
            } else {
                adviseName.innerHTML = "올바른 이름이 아닙니다."
                adviseName.style.color = "red";
                hiddenRespName.innerHTML = "사용불가";
                username.focus();
                console.log("name 유효성 검사결과: invalidate");
            }
        }
    });
    username.addEventListener("change", function () {
        adviseName.innerHTML = "";
    });
    //이름 유효성 검사 end

    //전화번호 유효성 검사 start
    phone2.addEventListener("blur", function () {
        rawStr = phone2.value;
        console.log("phone2: " + rawStr);
        var regExp = /^[0-9]{3,4}$/;
        if (rawStr.length != 0) {
            if (regExp.test(rawStr)) {
                console.log("phone2 유효성 검사결과: validate");
                advisePhone.innerHTML = "";
            } else {
                advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                advisePhone.style.color = "red";
                hiddenRespPhone.innerHTML = "사용불가";
                phone2.focus();
                console.log("phone2 유효성 검사결과: invalidate");
            }
        }
    });
    username.addEventListener("change", function () {
        adviseName.innerHTML = "";
    });
    //이름 유효성 검사 end

    //전화번호 유효성 검사 start
    phone2.addEventListener("blur", function () {
        rawStr = phone2.value;
        console.log("phone2: " + rawStr);
        var regExp = /^[0-9]{3,4}$/;
        if (rawStr.length != 0) {
            if (regExp.test(rawStr)) {
                console.log("phone2 유효성 검사결과: validate");
                advisePhone.innerHTML = "";
            } else {
                advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                advisePhone.style.color = "red";
                hiddenRespPhone.innerHTML = "사용불가";
                phone2.focus();
                console.log("phone2 유효성 검사결과: invalidate");
            }
        }
    });

    phone3.addEventListener("blur", function () {
        rawStr = phone3.value;
        console.log("phone3: " + rawStr);
        var regExp = /^[0-9]{4}$/;
        if (rawStr.length != 0) {
            if (regExp.test(rawStr)) {
                console.log("phone3 유효성 검사결과: validate");
                advisePhone.innerHTML = "";
            } else {
                advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                advisePhone.style.color = "red";
                hiddenRespPhone.innerHTML = "사용불가";
                phone3.focus();
                console.log("phone3 유효성 검사결과: invalidate");
            }
        }
    });
    //전화번호 유효성 검사 end   

    //전화번호 중복 검사 start
    $("#sendCode").on("click", function () {
        console.log(tid);
        clearInterval(tid); //기존 카운트다운 삭제
        setTime = 300; //카운트다운 초기화                        
        phone.value = phone1.value + phone2.value + phone3.value;
        if (phone.value != "") {
            $.ajax({
                url: "${pageContext.request.contextPath}/guest/checkOverlap.do",
                data: {
                    phone: phone.value
                },
                dataType: "json",
                type: "post",
            }).done(function (resp) {
                console.log("phone 중복여부 서버 검증 결과: "
                    + resp.result);
                //전화번호 중복 검사 end
                //인증번호 전송 start
                if (resp.result == "available") {
                    tid = setInterval(msg_time, 1000); //인증번호 전송 시 카운트다운 시작
                    sendCode.hidden = true;
                    resendCode.hidden = false;
                    verifyCode.value = "";
                    verifyCode.disabled = false;
                    confirmVerifyCode.hidden = true;
                    //잠시 테스트
                    hiddenRespPhone.innerHTML = "사용가능";
                    //
                    $.ajax({
                        url: "${pageContext.request.contextPath}/guest/sendVerifCode.do",
                        data: {
                            phone: phone.value
                        },
                        dataType: "json",
                        type: "post"
                    }).done(function (resp) {
                        console.log("인증번호 서버 전송 결과: " + resp.result);
                        if (resp.result != "Verify Code sent") {
                            adviseVerifCode.innerHTML("인증번호 전송에 실패했습니다.");
                            adviseVerifCode.style.color = "red";
                            hiddenRespPhone.innerHTML = "사용불가";
                            hiddenRespVerifCode.innerHTML = "인증실패";
                            confirmVerifyCode.hidden = true;
                            sendCode.hidden = false;
                            resendCode.hidden = true;
                            verifyCode.disabled = true;
                        } else {
                            console.log("인증 코드 발송 완료");
                            confirmVerifyCode.hidden = false;
                        }
                    }).fail(function (a, b, c) {
                        console.log(a);
                        console.log(b);
                        console.log(c);
                    });
                } else if (resp.result == "unavailable") {
                    advisePhone.innerHTML = "중복된 번호입니다.";
                    advisePhone.style.color = "red";
                    hiddenRespPhone.innerHTML = "사용불가";
                }
            }).fail(function (a, b, c) {
                console.log(a);
                console.log(b);
                console.log(c);
                return false;
            });
        } else {
            alert("전화번호를 입력해 주세요.");
        }
    });

    //인증번호 제한시간 이벤트 start
    function msg_time() {
        m = addzero(Math.floor(setTime / 60)) + ":" + addzero(setTime % 60);
        console.log(m);
        var msg = m;
        timer.innerHTML = msg;
        setTime--;
        if (setTime < 0) {
            clearInterval(tid);
            adviseVerifCode.innerHTML = "입력시간이 초과되었습니다.";
            adviseVerifCode.style.color = "red";
            hiddenRespPhone.innerHTML = "사용불가";
            hiddenRespVerifCode.innerHTML = "인증실패";
            confirmVerifCode.hidden = true;
            verifyCode.disabled = true;
            $.ajax({
                url: "${pageContext.request.contextPath}/guest/removeVerifSession.do",
                dataType: "json",
                type: "post",
            }).done(function (resp) {
                if (resp.result == "Verif Code removed") {
                    timer.innerHTML = "";
                    sendCode.hidden = false;
                    resendCode.hidden = true;
                    verifyCode.value = "";
                    verifyCode.disabled = false;
                }
                console.log("인증번호 세션 삭제 실패");
            }).fail(function (a, b, c) {
                console.log(a);
                console.log(b);
                console.log(c);
            });
        }
    }

    function addzero(num) {
        if (num < 10) {
            num = "0" + num;
        }
        return num;
    }
    //인증번호 제한시간 이벤트 end  

    //사용자 입력 인증번호 일치여부 검사 start    
    $("#confirmVerifyCode").on("click", function(){
    	$.ajax({
            url: "${pageContext.request.contextPath}/guest/verifyUser.do",
            data: {
                verifyCode: verifyCode.value
            },
            dataType: "json",
            type: "post",
        }).done(function (resp) {
            console.log("인증번호 서버 검증 결과 : " + resp.result);
            if (resp.result == "verified") {
                console.log("인증 완료 ");
                adviseVerifCode.innerHTML = "인증완료";
                adviseVerifCode.style.color = "green";
                hiddenRespPhone.innerHTML = "사용가능";
                hiddenRespVerifCode.innerHTML = "사용가능";
                sendCode.hidden = true;
                resendCode.hidden = true;
                verifyCode.disabled = true;
                
                clearInterval(tid);
                
            } else if (resp.result == "unverified") {
                console.log("인증 실패 ");
                adviseVerifCode.innerHTML = "인증실패";
                adviseVerifCode.style.color = "red";
                hiddenRespPhone.innerHTML = "사용불가";
                hiddenRespVerifCode.innerHTML = "인증실패";
                sendCode.hidden = true;
                resendCode.hidden = false;
                verifyCode.disabled = false;
            };
        }).fail(function (a, b, c) {
            console.log(a);
            console.log(b);
            console.log(c);
            return false;
        });
    });
    //사용자 입력 인증번호 일치여부 검사 end  

    //생년월일 select option 생성 start
    function appendYear() {
        var date = new Date();
        var year = date.getFullYear();
        var selectVal = doc.getElementById("birthYear");
        var optionIndex = 0;
        for (var i = year - 100; i <= year; i++) {
            if (boption1 == i) {
                console.log("boption1 : " + boption1);
                var opt = new Option(i + "년", i);
                selectVal.add(opt, optionIndex++);
                opt.setAttribute("class", "bOption1");
                opt.setAttribute("selected", "selected");
            } else {
                var opt = new Option(i + "년", i);
                selectVal.add(opt, optionIndex++);
                opt.setAttribute("class", "bOption1");
            }
        }
    }

    function appendMonth() {
        var selectVal = doc.getElementById("birthMonth");
        var optionIndex = 0;
        for (var i = 1; i <= 12; i++) {
            if (boption2 == i) {
                console.log("boption2 : " + boption2);
                var opt = new Option(i + "월", i);
                selectVal.add(opt, optionIndex++);
                opt.setAttribute("class", "bOption2");
                opt.setAttribute("selected", "selected");
            } else {
                var opt = new Option(i + "월", i);
                selectVal.add(opt, optionIndex++);
                opt.setAttribute("class", "bOption2");
            }
        }
    }

    function appendDay() {
        var selectVal = doc.getElementById("birthDay");
        var optionIndex = 0;
        for (var i = 1; i <= 31; i++) {
            if (boption3 == i) {
                console.log("boption3 : " + boption3);
                var opt = new Option(i + "일", i);
                selectVal.add(opt, optionIndex++);
                opt.setAttribute("class", "bOption3");
                opt.setAttribute("selected", "selected");
            } else {
                var opt = new Option(i + "일", i);
                selectVal.add(opt, optionIndex++);
                opt.setAttribute("class", "bOption3");
            }
        }
    }
    //생년월일 select option 생성 end

    //회원가입 form submit 이벤트 start
    $("#changeMyInfo").on("click", function () {

        //모든 입력창 유효성 결과 체크 start
        for (var i = 0; i < hiddenResp.length; i++) {
            if (hiddenResp[i].innerHTML === "사용불가") {
                console.log("유효성 통과 탈락");
                alert("잘못된 입력입니다.");
                return false;
            }
        }
        //모든 입력창 유효성 결과 체크 end  

        if (hiddenRespVerifCode.innerHTML == "인증실패") {
            alert("휴대폰 인증에 실패하였습니다. 다시 인증해 주세요.");
            verifyCode.value();
        }

        //모든 입력창 null 체크 start                 
        if (username.value === "") {
            adviseName.innerHTML = "필수 입력사항입니다."
            adviseName.style.color = "red";
            return false;
        } else if (birthYear.value === "선택하세요.") {
            adviseBirth.innerHTML = "필수 입력사항입니다."
            adviseBirth.style.color = "red";
            return false;
        } else if (birthMonth.value === "선택하세요.") {
            adviseBirth.innerHTML = "필수 입력사항입니다."
            adviseBirth.style.color = "red";
            return false;
        } else if (birthDay.value === "선택하세요.") {
            adviseBirth.innerHTML = "필수 입력사항입니다."
            adviseBirth.style.color = "red";
            return false;
        } else if (phone2.value === "") {
            advisePhone.innerHTML = "필수 입력사항입니다."
            advisePhone.style.color = "red";
            return false;
        } else if (phone3.value === "") {
            advisePhone.innerHTML = "필수 입력사항입니다."
            advisePhone.style.color = "red";
            return false;
        }

        phone.value = phone1.value + phone2.value + phone3.value;

        if (dto.phone != phone.value) {
            if (verifyCode.value === "") {
                adviseVerifCode.innerHTML = "휴대폰 인증은 필수입니다."
                adviseVerifCode.style.color = "red";
                return false;
            }
        }
        //모든 입력창 null 체크 end 

        //전화번호, 이메일 한 줄로 조합 start
        var month = birthMonth.value;
        var day = birthDay.value;
        if (month < 10) {
            console.log(month);
            month = "0" + month;
            console.log(month);
        }
        if (day < 10) {
            console.log(day);
            day = "0" + day;
            console.log(day);
        }
        birth.value = birthYear.value + month + day;
        //전화번호, 이메일 한 줄로 조합 end

        console.log("최종 휴대폰 : " + phone.value);
        console.log("최종 비밀번호 : " + pw.value);
        console.log("최종 이름 : " + username.value);
        console.log("최종 생년월일 : " + birth.value);
        
        clearInterval(tid);
        
        doc.getElementById("signUpForm").submit();
    });

    function clearInput(userInput, length) { //pw 입력취소 시 모든 input창 clear
        for (var i = 0; i < length; i++) {
            userInput[i].value = "";
        }
    }
    });
    });
    
  //차단
    $(".blockFr").on("click", function () {
        
        console.log(myMail);
        $.ajax({
            url: "${pageContext.request.contextPath}/member/blockMem",
            type: "POST",
            data: {
                yr_id: myMail
            },
            dataType: "text",
            success: function (res) {
                console.log(res);
                if(res == "notInsert"){
                	 
                     $(".blockFr").attr("src", $(".blockFr").attr("src").replace("/resources/images/whitex.png", "/resources/images/limex.png"));  
                     //location.reload();
                	
                }else{
                	
                    $(".blockFr").attr("src", $(".blockFr").attr("src").replace("/resources/images/limex.png", "/resources/images/whitex.png"));
                    //location.reload();
                }
                

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
    </script>
   	<jsp:include page="/resources/script/myFeedScript.jsp" />
</body>
</html>