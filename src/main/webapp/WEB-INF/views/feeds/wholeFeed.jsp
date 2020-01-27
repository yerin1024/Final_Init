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
<link rel="stylesheet" href="/resources/css/alr.css">
<link rel="stylesheet" href="/resources/css/msg.css">
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
/* 	width:60vw; */
	margin:0px;
/*     margin: auto; */
    text-align: center;

}
.row{
	width:100%;
	height:100%;
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

.cover{
	width:100%;
	height:100%;
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
    width:100%;
    height:100%;
}

.feed{
	min-width:150px;
	min-height: 150px;
	max-height:200px;
	height:26vw;
	width:25vw;
}
#likeBtn, #bookmarkBtn{
   width:50px;
   height:50px;
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
	max-width: 1200px;
	margin: auto;
	height: 1200px;
}
.btn-primary1:hover, .btn-primary1:hover{
   background-color:white;
}
.btn-primary1:not(:disabled):not(.disabled).active, .btn-primary1:not(:disabled):not(.disabled):active, .show>.btn-primary1.dropdown-toggle{
   border:none;
   background-color:white;
}

.btn-primary1{
   width:100%;
   height:100%;
   border-color:white;
   background-color:white;
   padding:0px;
   color:black;
}

/* 프로필 */
.profile {
	position: relative;
}

.profileMessageLayout {
	position: relative;
}

.report {
	position: relative;
	text-align: right;
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
.btn-primary1{
	width:100%;
	height:100%;
	border-color:white;
	background-color:white;
	padding:0px;
	color:black;
}
.modal-dialog {
    max-width: 1200px;
    margin: 1.75rem auto;
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
.writeReplyBox{
	display:flex;
    width: 50%;
    height:50%;
}
.modal-title{
	line-height: 50px;
}
#writeReply{	
    line-height:80px;
    margin: 0px 20px;
    min-height: 50px;
    font-size: 16px;
    width: 100%;
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
.modal-content{	
    border-radius: 30px;
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
.media{
	width:100%;
	height:100%;
	margin:0px;
}
/* .reply { */
/*         height: 90%; */
/*         padding: 16px; */
/*         overflow-y: scroll; */
/* } */

/* .reply::-webkit-scrollbar { */
/*         width: 0 !important */
/* } */

/* .writerProfile,.userProfile,.myProfile{	 */
/*     margin-right: 16px; */
/* } */
/* .writerProfileImg,.userProfileImg{ */
/* 	width:40px; */
/* 	height:40px; */
/* 	border-radius: 160px; */
/*     border: 1px solid black; */
/* } */
/* .childProfileImg{ */
/* 	width:24px; */
/* 	height:24px; */
/* 	border-radius: 160px; */
/*     border: 1px solid black; */
/* } */
/* .modal-btns{ */
/* 	height:50px; */
/* 	line-height:50px; */
/*     padding: 0px 16px; */
/* } */
/* .writerInfo,.userInfo{ */
/*     margin-left: -12px; */
/*     margin-right: 0; */
/*     padding: 12px 16px 0px 16px; */
/*     display:flex; */
/* } */
/* .childReply{ */
/*     margin-right: 0; */
/*     padding: 12px 16px 0px 60px; */
/*     display: flex; */
/*     flex-wrap: wrap; */
/* } */
/* .userProfileID,.writerProfileID{ */
/* 	font-weight: 600; */
/*     padding-left: 5px; */
/*     margin: 0px 5px 0px -5px; */
/* } */
/* .userReply,.text>p{ */
/*     border-radius: 16px; */
/*     border: 1px solid rgb(239, 239, 239); */
/*     width: 100%; */
/*     line-height: 50px; */
/*     width: 400px; */
/*     margin: 0px 20px; */
/*     word-break: break-all;	 */
/*     display: inherit; */
/* } */
/* } */
/* .childContentsBox{ */
/* 	width:322px; */
/*     border: 1px solid rgb(239, 239, 239); */
/*     border-radius: 16px; */
/*     transition: all 1000ms ease 0s; */
/* } */
/* .writeReplyBox{ */
/* 	display:flex; */
/*     width: 100%; */
/* } */
/* .modal-title{ */
/* 	line-height: 50px; */
/* } */
/* #writeReply{	 */
/*     border-radius: 16px; */
/*     border: 1px solid rgb(239, 239, 239); */
/*     width: 100%; */
/*     line-height:50px; */
/*     margin: 0px 20px; */
/* } */
/* .replyContents{	 */
/*     background: transparent; */
/*     border: 0px; */
/*     display: inline-block; */
/*     min-height: 50px; */
/*     font-size: 16px; */
/*     outline: 0px; */
/*     overflow-x: hidden; */
/*     resize: none; */
/*     white-space: pre-wrap; */
/*     width: 100%; */
/*     word-break: break-all; */
/*     padding: 12px; */
/* } */
/* .modal-body1{ */
/* 	width:55%; */
/*     height: 100%; */
/* } */
/* .modal-title{ */
/* 	width:45%; */
/* } */
/* .media{ */
/* 	width:100%; */
/* 	height:100%; */
/* 	margin:0px; */
/* } */
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
			data = data + "<div class='col-4 feed' ><a class='btn btn-primary' style='height:100%;' data-toggle='modal' data-target='#exampleModal' href='#' data-id='"+list[index].feed_seq+"'>"+cover[index]+"</a></div>";
			console.log(i);
			if(i%3==1){
				console.log(i+"는 1");
				data = "<div class='row'>" +data;
			}
			if(i%3==0){
				console.log(i+"는0");
				data = data + "</div>";

		    	$("#feeds").append(data); 
		    	var data = "";
			}
			index++;
    	}
    	
	})
}
</script>
</head>
<body>
 <jsp:include page="/resources/jsp/nav.jsp" />
 <jsp:include page="/resources/jsp/alr.jsp"/>
<jsp:include page="/resources/jsp/msg.jsp"/>
	<div id="wrapper">
		<div id="search">
			<br><br>
			<form action="wholeFeed" method="post">
				<input type="text" name="keyword" id="keyword">&nbsp;&nbsp;
				<button id="searchBtn">검색</button>
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
						<div class="row fRow">
							<div class="col-4 img">
								<img src="${friend.profile_img}" style="width:60px;height:60px;">
							</div>
							<div class="col-8 nickname">
								<a class="nicknameA" href="${pageContext.request.contextPath}/feed/myFeed?email=${friend.email}">${friend.nickname}</a>
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
									<a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" href="#" data-id="${feed.feed_seq }" style="min-height: 150px;">${cover[status.count-1] }</a>
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

	
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px;">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	         <span class="writerProfile"><img class="userProfileImg" src="${loginInfo.profile_img }" alt=""></span>
	        <h5 class="modal-title" id="exampleModalLabel">DETAIL VIEW</h5>
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
	<script>
	
	
	function replyBtnOnclick(email) {
		var writeReply = $("#writeReply");
		var contents = writeReply.html();
		if(contents == ""){ //컨텐츠가 null 값일 경우 등록 동작
			return false;
		}
		var feed_seq = $("#exampleModal").attr("feed_seq");
		console.log(feed_seq + " ## ?");
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/feed/registerReply",
			data : {
				feed_seq : feed_seq,
				contents : contents,
				email : email
			},
			dataType : "json"
			}).done(function(data) {
				console.log(data);
				var html = "";
				html += "<div class=\"userInfo\" reply_seq="+data.reply_seq+">"
				html += "<div class=\"profileDiv\"><span class=\"userProfile\"><img class=\"userProfileImg\" src=\"${loginInfo.profile_img }\" alt=\"\"></span><span class=\"userProfileID\">"+data.email+"</span><span class=\"userReply\"><div class=\"replyContents\">"+data.contents+"</div></span></div>"
				html += "<div class=\"replyBtns\">"
				html += "<button type=\"button\" class=\"modifyReply\">수정</button>"
				html += "<button type=\"button\" class=\"deleteReply\">삭제</button>"
				html += "<button type=\"button\" class=\"registerChildBtn\">답글</button>"
				html += "</div>"
      			html += "</div>"
				$(".reply").append(html);
				writeReply.html("");
		}).fail(function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		})
	}
	
	var temporaryReply;
	var clickCnt;
	var childReplyButton;

	//답글숨기기
	var showReply = $("<button></button>");
	showReply.addClass("showReply");
	showReply.html("ㅡ답글보이기");
	

	//답글숨기기
	var hideReply = $("<button></button>");
	hideReply.addClass("hideReply");
	hideReply.html("ㅡ답글숨기기");
	
	
	//답글등록버튼
	var registerReplyBtn = $("<button></button>");
	registerReplyBtn.html("등록")
	registerReplyBtn.addClass("registerChildReply");
	
	//답글삭제버튼
	var deleteChildReplyBtn = $("<button></button>");
	deleteChildReplyBtn.html("삭제")
	deleteChildReplyBtn.addClass("deleteChildReplyBtn");
	
	
	//답글취소버튼
	var childReplyCancel = $("<button></button>");
	childReplyCancel.html("취소")
	childReplyCancel.addClass("childReplyCancel");
	
	
	//답글수정버튼
	var modifyChildBtn = $("<button></button>");
	modifyChildBtn.html("수정")
	modifyChildBtn.addClass("modifyChildBtn");

	//답글수정완료버튼
	var modifyChildReplySuccess = $("<button></button>");
	modifyChildReplySuccess.html("완료")
	modifyChildReplySuccess.addClass("modifyChildReplySuccess");

	//답글수정취소버튼
	var modifyChildReplyCancel = $("<button></button>");
	modifyChildReplyCancel.html("취소")
	modifyChildReplyCancel.addClass("modifyChildReplyCancel");

	//수정버튼
	var modifyBtn = $("<button></button>");
	modifyBtn.html("수정")
	modifyBtn.addClass("modifyReply");

	//삭제버튼
	var deleteBtn = $("<button></button>");
	deleteBtn.html("삭제")
	deleteBtn.addClass("deleteReply");

	//답글버튼
	var registerChildBtn = $("<button></button>");
	registerChildBtn.html("답글")
	registerChildBtn.addClass("registerChildBtn");
	
	//수정완료버튼
	var modifyCompleteBtn = $("<button></button>");
	modifyCompleteBtn.html("수정완료");
	modifyCompleteBtn.addClass("modifyReplySuccess");

	//수정취소버튼
	var modifyCancelBtn = $("<button></button>");
	modifyCancelBtn.html("취소")
	modifyCancelBtn.addClass("modifyReplyCancel");
	
	$(document).on("click",".modifyReply", function(){
		$("div[value=1]").remove();
		if(childReplyButton != null){
			childReplyButton.attr("hidden", false);
		}			
		var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");
		oriReply.attr("contentEditable","true");
		temporaryReply = oriReply.html();
		var replyBtns = $(this).closest(".replyBtns"); 
		
		oriReply.focus();
		
		$(this).closest(".replyBtns").children().remove();			

		replyBtns.prepend(modifyCancelBtn);
		replyBtns.prepend(modifyCompleteBtn);
	});
	
	$(document).on("click",".modifyReplySuccess", function(){
		
		childReplyButton.attr("hidden", false);
		
		var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");
		var replyContents = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents").html();
		var currentReply = oriReply.html();
		var replyBtns = $(this).closest(".replyBtns");
		var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
		
		if(temporaryReply == currentReply){
			oriReply.html(temporaryReply);
		}else{
			$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath }/feed/modifyReply",
					data : {reply_seq:reply_seq,contents:replyContents}	
				}).done(function(resp){
					if(resp == 1){
						console.log("성공!");
					}else{
						console.log("오류");
					}
				}).fail(function(){
					console.log("댓글 수정 오류!!!");
				})
		}
		
		oriReply.attr("contentEditable","false");

		$(this).closest(".replyBtns").children().remove();			
		replyBtns.prepend(registerChildBtn);
		replyBtns.prepend(deleteBtn);
		replyBtns.prepend(modifyBtn);	
	});

	$(document).on("click",".modifyReplyCancel", function(){
		var replyBtns = $(this).closest(".replyBtns");
		var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");	
		console.log()
		oriReply.html(temporaryReply);
		oriReply.attr("contentEditable","false");
		
		$(this).closest(".replyBtns").children().remove();
		
		
		var registerChildBtn = $("<button></button>");
		registerChildBtn.html("답글")
		registerChildBtn.addClass("registerChildBtn");

		replyBtns.prepend(registerChildBtn);
		replyBtns.prepend(deleteBtn);
		replyBtns.prepend(modifyBtn);
	});
	
	//댓글 삭제 버튼
	$(document).on("click",".deleteReply", function(){
		var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
		var deleteDiv = $(this).closest(".userInfo");
		console.log(deleteDiv.attr("child"));
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/feed/deleteReply",
			data : {reply_seq:reply_seq}				
		}).done(function(resp) {
			console.log(resp + "행 댓글이 지워짐!");
			deleteDiv.remove();
		}).fail(function(){
			alert("yes!");
		})
	});

	//답글버튼 눌렀을 때 이벤트
	$(document).on("click",".registerChildBtn", function(){
		childReplyButton = $(this);
		childReplyButton.attr("hidden", true);
		console.log("답글클릭 : cnt : " + clickCnt);
			if(clickCnt == 0){	
					console.log("왜 출력안돼;")
					console.log("this 출력 : " + $(this));
					$("div[value=1]").remove();
					childReplyButton.attr("hidden", false);
			}
		clickCnt = 0;
		
		var userNickname = '${loginInfo.nickname }';
		var replyWriter = $(this).closest(".replyBtns").siblings(".userProfileID").html(); //부모댓글의 닉네임
		var userInfo = $(this).closest(".userInfo");
		var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
		//--------------------------------------------------------
		var registerChildDiv = $("<div value='1'></div>");
		registerChildDiv.addClass("childReply");
		
		var userProfile = $("<span></span>");
		userProfile.addClass("userProfile");
		
		var childProfileImg = $("<img></img>");
		childProfileImg.addClass("userProfileImg");
		childProfileImg.attr("src","${loginInfo.profile_img}");
		childProfileImg.attr("alt","사진오류");			

		var userProfileID = $("<span></span>");
		userProfileID.addClass("userProfileID");
		userProfileID.html("${loginInfo.nickname}");
		
		//답글 쓰는 공간을 감싸는 span
		var userReply = $("<span></span>");
		userReply.addClass("userReply");			
		
		//답글 쓰는 공간
		var replyContents = $("<div></div>");
		replyContents.addClass("replyContents");
		replyContents.attr("contenteditable","true");
		
		
		//답글버튼추가
		var replyBtns = $("<div></div>");
		replyBtns.addClass("replyBtns");			
		
		//버튼DIV 추가
		replyBtns.append(registerReplyBtn);
		replyBtns.append(childReplyCancel);
		
		userProfile.append(childProfileImg);
		
		registerChildDiv.append(userProfile);			
		registerChildDiv.append(userProfileID);
		registerChildDiv.append(userReply);
		registerChildDiv.append(replyBtns);
		userReply.append(replyContents);
		userInfo.append(registerChildDiv); //유저인포밑에 어펜드..		
		//--------------------------------------------------------  		
	});
	
	//
	$('#exampleModal').on('shown.bs.modal', function (event) {
		var seq= $(event.relatedTarget).data('id');
		var feed_seq = $("#exampleModal").attr("feed_seq",seq);
		$.ajax({
			type:"post",
			url:"/feed/detailView",
			data:{
				feed_seqS:seq
			},
			dataType:"json"
		}).done(function(data){
			$(".reply").children().remove(); // 클릭할때마다 다른 게시글에 댓글지우기 
			console.log(data);
			var writerProfile = data.writerProfile;
			var likeCheck = data.likeCheck;
			var bookmarkCheck = data.bookmarkCheck;
			var mediaList = JSON.parse(data.media);
			var replyList = JSON.parse(data.replyList);
			var dto = JSON.parse(data.dto);
			//디테일뷰 미디어
			console.log("mediaList.length : "+mediaList.length);
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
				prevA.append("<span class='carousel-control-prev-icon' aria-hidden='true'></span>");
				prevA.append("<span class='sr-only'>Previous</span>");
				var nextA = $("<a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'></a>");
				nextA.append("<span class='carousel-control-next-icon' aria-hidden='true'></span>");
				nextA.append("<span class='sr-only'>Next</span>");
				cInner.append(prevA);
				cInner.append(nextA);
				cei.append(cInner);
				mediaRow.append(cei);				
				
			}else{
				var mediaRow = $("<div class='media' style='height:100%;size:20px;position:relative;></div>");
				mediaRow.append(mediaList[0]);
			}
			$(".modal-body1").html(mediaRow);
			
			
			var replyhtml = "";
			for(var i=0; i<replyList.length; i++){
				if(replyList[i].parent == 0){
					replyhtml += "<div class='userInfo' reply_seq='"+replyList[i].reply_seq+"'>"							
					replyhtml += "<div class='profileDiv'>"
					replyhtml += "<span class='userProfile'>"
					replyhtml += 		"<img class='userProfileImg' src=${loginInfo.profile_img } alt=''>"
					replyhtml +=   "</span>"
					replyhtml +=         	"<span class='userProfileID'>${loginInfo.nickname }</span>"
					replyhtml +=          "<span class='userReply'>"
	             	replyhtml +=       	  "<div class='replyContents'>"+replyList[i].contents+"</div>"
	             	replyhtml +=       "</span>"
	             	replyhtml +=        "</div>"	               
	             	replyhtml +=        "<div class='replyBtns'>"
	             	replyhtml +=        		"<button type='button' class='modifyReply'>수정</button><button type='button' class='deleteReply'>삭제</button>"
	             	replyhtml +=        		"<button type='button' class='registerChildBtn'>답글</button>"
	             	replyhtml +=       "</div>"			             	
	             	replyhtml +=   "</div>";
				}
			}

			
			if(mediaList.length>0){
				var dtoContents = $("<div class='dtoContents' style='display:inline-block;border:2px solid red;min-height:100px;width: 100%;padding-left: 10px;padding-top: 10px;padding-right: 10px;word-break: break-all;'></div>");
				dtoContents.append(dto.contents);
				$(".reply").append(dtoContents);

			}
			$(".reply").append(replyhtml);
			for(var i=0; i<replyList.length; i++){
				if(replyList[i].parent != 0){
					var childhtml = "";
					var currentSeq = replyList[i].parent;
					childhtml +=       "<div class='childReply' style='display:none' reply_seq='"+replyList[i].reply_seq+"' parent_seq='"+replyList[i].parent+"'>"
					childhtml +=     		"<span class='userProfile'>"
					childhtml +=     			"<img class='userProfileImg' src=${loginInfo.profile_img } alt='사진오류'>"
					childhtml +=      		"</span>"
					childhtml +=      		"<span class='userProfileID'>"+replyList[i].email+"</span>"
					childhtml +=      "<span class='userReply'>"
					childhtml +=      		"<div class='replyContents' contenteditable='false'>"+replyList[i].contents+"</div>"
			       	childhtml +=      "</span>"
			        childhtml +=      "<div class='replyBtns'>"
			        childhtml +=      		"<button class='modifyChildBtn'>수정</button>"
	           		childhtml +=      		"<button class='deleteChildReplyBtn'>삭제</button>"
		       		childhtml +=      "</div>"
             		childhtml +=      "</div>";
             		$(".userInfo[reply_seq="+currentSeq+"]").append(childhtml);
					if($(".userInfo[reply_seq="+currentSeq+"]").find(".childReply").length > 0){
						$(".userInfo[reply_seq="+currentSeq+"]").attr("child",1);
					}
				}
			}
			//댓글숨기기 
			console.log($(".userInfo").attr("child"));
			$(".userInfo[child=1]").children(".replyBtns").append(showReply);
			
			
			//디테일뷰 글
			var textRow = $("<span class='row text'></span>");
			textRow.html(dto.contents);
			$(".writerInfo").html(textRow);
			
			
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
			
			var modifyA = $("<a href='modifyFeedView?feed_seq="+dto.feed_seq+"'>수정</a>");
			var deleteA = $("<a href='deleteProc?feed_seq="+dto.feed_seq+"'>삭제</a>");
			
			var sessionEmail = "${loginInfo.email}";
			var writer = dto.email;
			console.log(sessionEmail);
			console.log(writer);
			
			if(sessionEmail==writer){ //좋아요스크랩은 없애고 수정삭제만 있음
				console.log("작성자 본인입니다.");
				$(".footer-btns").html("");
				$(".footer-btns").append(modifyA);
				$(".footer-btns").append(deleteA);
			}else{
				console.log("작성자가 아닙니다.")
				$(".footer-btns").html("");
				$(".footer-btns").append(likeA);
				$(".footer-btns").append(bookmarkA);
			}
		
			
			$(".writerProfile").html("<img src="+writerProfile+" class='writerProfileImg'>");
			
		}).fail(function(a,b,c){
			console.log("실패 : "+b);s
		})
		$('#myInput').trigger('focus');
		
	})
	
		//답글보이기
			$(document).on("click",".showReply", function(){
			var parent_seq = $(this).closest(".userInfo").attr("reply_seq");
			var parentDiv = $(".userInfo[reply_seq="+parent_seq+"]");
			console.log(parent_seq + " ###### showReply");
			if($(".userInfo[reply_seq="+parent_seq+"]").find(".childReply").length == 0){
				userInfoDiv.attr("child",0);
			}
			parentDiv.find(".childReply").show();
			parentDiv.find(".replyBtns").children(".showReply").remove();
			parentDiv.children(".replyBtns").append(hideReply);
		});

		//답글숨기기
			$(document).on("click",".hideReply", function(){
			var parent_seq = $(this).closest(".userInfo").attr("reply_seq");
			var parentDiv = $(".userInfo[reply_seq="+parent_seq+"]");
			console.log(parent_seq + " ###### hideReply");
			if($(".userInfo[reply_seq="+parent_seq+"]").find(".childReply").length == 0){
				userInfoDiv.attr("child",0);							
				}
			childReplyButton.attr("hidden", false);
			$("div[value=1]").remove();
			parentDiv.find(".childReply").hide();
			parentDiv.find(".replyBtns").children(".hideReply").remove();
			parentDiv.children(".replyBtns").append(showReply);
		});
		
		//답글등록버튼
		$(document).on("click",".registerChildReply", function(){
			console.log(childReplyButton + "## >>>????");
			if($(".replyContents").html.length > 0){
				childReplyButton.attr("hidden", false);
			}		
			clickCnt = 1;
			var feed_seq = $("#exampleModal").attr("feed_seq");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			var childReply = $(this).closest(".childReply");
			
			childReply.attr("value", 0);
			
			var replyWriter = $(this).closest(".childReply").siblings(".profileDiv").find(".userProfileID").html(); //부모댓글의 닉네임
			var childReplyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents").html();
			var replyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var replyBtns = $(this).closest(".replyBtns");
			replyBtns.attr("value", 1);
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data : {feed_seq:feed_seq,email:'${loginInfo.email}',contents:childReplyContents,depth:1,parent:reply_seq},
				dataType:"json"		
			}).done(function(resp) {
				console.log('성공적으로 성공');
				$(".userInfo[reply_seq="+resp.parent+"]").attr("child",1);
				$(".userInfo[reply_seq="+resp.parent+"]").children(".replyBtns").append(hideReply);
				childReply.attr("parent_seq",resp.parent);
				$("div[value=1]").remove();
				replyBtns.children().remove();
				replyBtns.append(modifyChildBtn);
				replyBtns.append(deleteChildReplyBtn);
				replyContents.attr("contentEditable","false");
				childReply.attr("reply_seq",resp.reply_seq);
				clickCnt = 2;
				console.log("등록완료 : cnt : " + clickCnt);
			}).fail(function(){
				console.log("실패!");
			});
		});
		//답글삭제버튼
		$(document).on("click",".deleteChildReplyBtn", function(){
			var reply_seq = $(this).closest(".childReply").attr("reply_seq");
			var deleteDiv = $(this).closest(".childReply");
			var userInfoDiv = $(this).closest(".userInfo");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/deleteReply",
				data : {reply_seq:reply_seq}				
			}).done(function(resp) {
				console.log(resp + "행 댓글이 지워짐!");
				deleteDiv.remove();
				if($(".userInfo[reply_seq="+parent_seq+"]").find(".childReply").length == 0){
					userInfoDiv.attr("value",0);
					userInfoDiv.find(".showReply").remove();
				}
			}).fail(function(){
				alert("yes!");
			})
		});
		//답글을 취소했을 때
		$(document).on("click",".childReplyCancel", function() {
			childReplyButton.attr("hidden", false);
			$(this).closest(".childReply").remove();			
		})
		//답글버튼 눌렀을 떄
		$(document).on("click",".modifyChildBtn", function() {
			$("div[value=1]").remove(); // 빈답글 지우기
			childReplyButton.attr("hidden", false); // 답글버튼 보이기
			var oriReply = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var replyBtns = $(this).closest(".replyBtns");
			temporaryReply = oriReply.html();
			oriReply.attr("contentEditable","true");
			replyBtns.children().remove(); //버튼들 지우기~		
			replyBtns.append(modifyChildReplySuccess);
			replyBtns.append(modifyChildReplyCancel);
		})
		//답글수정취소버튼을 눌렀을 때
		$(document).on("click",".modifyChildReplyCancel", function(){
			var replyBtns = $(this).closest(".replyBtns");
			var oriReply = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			console.log(temporaryReply + "##답글수정취소버튼!");
			oriReply.html(temporaryReply);
			oriReply.attr("contentEditable","false");			
			replyBtns.children().remove(); //버튼들 지우기~
			replyBtns.append(modifyChildBtn);
			replyBtns.append(deleteChildReplyBtn);
		});
		//답글수정완료버튼을 눌렀을 때
		$(document).on("click",".modifyChildReplySuccess", function(){
			var reply_seq = $(this).closest(".childReply").attr("reply_seq");
			var oriReply = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var replyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents").html();
			var currentReply = oriReply.html();
			var replyBtns = $(this).closest(".replyBtns");
			
			if(temporaryReply == currentReply){
				oriReply.html(temporaryReply);
			}else{
				$.ajax({
 					type : "POST",
 					url : "${pageContext.request.contextPath }/feed/modifyReply",
 					data : {reply_seq:reply_seq,contents:replyContents}	
 				}).done(function(resp){
 					if(resp == 1){
 						console.log("성공!");
 					}else{
 						console.log("오류");
 					}
 				}).fail(function(){
 					console.log("댓글 수정 오류!!!");
 				})
			}			
			oriReply.attr("contentEditable","false");
			$(this).closest(".replyBtns").children().remove();			
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			replyBtns.append(modifyChildBtn);
			replyBtns.append(deleteChildReplyBtn);
		});
	
	
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
		});
		
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
				
		});
	</script>
</body>
</html>