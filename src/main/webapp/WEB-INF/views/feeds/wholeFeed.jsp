<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/msg.css"> 
<link rel="stylesheet" href="/resources/css/alr.css"> 
<link rel="stylesheet" href="/resources/css/test.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
#exampleModal{
	width:1200px;
	margin:auto;
}
body{
   background-color:#171C28;
}
#searchBtn{
	border:2.5px solid white;
	border-radius:5px;
	height:30px;
	background:none;
	color:white;
	margin-left:10px;
}
#wrapper {
   margin: auto;
   padding: 60px 20px 0;
   min-width:540px;
}

#search {
   margin: auto;
   text-align: center;
}

#contents {
/*    width:60vw; */
   margin:0px;
/*     margin: auto; */
    text-align: center;
    color:white;
    font-size:20px;

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

.row{
	width:100%;
	height:100%;
	margin-bottom:30px;
}

.parent([.title]){
   border:1px solid red;
}

.btn-primary{
   width:100%;
   height:100%;
   min-width:150px;
   min-height:150px;
   border:none;
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
	width:450px;
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

img.cover{	
    width: 100%;
    height: 100%;
}
video.cover{	
    width: 100%;
    height: 100%;
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
    font-size:17px;
    font-weight:600;
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
    border: 1px solid #ebebeb;
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
.modal-body5{
	width:55%;
    height: 100%;
    position: relative;
/*     border:1px solid black; */
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
.media>p{
	padding:30px;
	word-break:break-all;
	text-align:left;
	font-size:20px;
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

/* Desktop Device */
@media all and (min-width:1025px) {
   /*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */

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
	      <div class="modal-header" style="width:99.9%;">
	         <span class="writerProfile"><img class="userProfileImg" src="${writerProfile.profile_img }" alt=""></span>
	         <h5 class="modal-title" id="exampleModalLabel" style="font-size:30px;font-weight:bold;"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		<div class="modal-main">			
	      	<div class="modal-body5">
	      	</div>
	      	
            <div class="title">
                <div class="reply">
               		<div class="writerInfo">
                    		<span class="writerProfile"><img class="userProfileImg" src="${writerProfile.profile_img }" alt=""></span>
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
      <jsp:include page="/resources/script/myFeedScript.jsp" />
      
      <script>
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
      </script>
</body>
</html>