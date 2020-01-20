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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

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
	
	html, body {
	background-color: #1D4E89;

	margin: 0px;
	padding: 0px;
	height: 2000px;
}

* {
	box-sizing: border-box;
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
.modal-dialog {
    max-width: 935px;
    margin: 1.75rem auto;
}
.row{
	margin:0px;
}
.modal-main{
    display: flex;
    height: 500px;
}
.carousel-item>img{
	width:500px;
	height:500px;
}
.reply {
        height: 90%;
        padding: 16px;
        overflow-y: scroll;
}

.reply::-webkit-scrollbar {
        width: 0 !important
}
.reply>ul {
        padding: 0px;
}

.reply>ul>li {
        list-style: none;
}
.writerProfile,.userProfile,.myProfile{	
    margin-right: 16px;
}
.writerProfileImg,.userProfileImg{
	width:50px;
	height:50px;
	border-radius: 160px;
    border: 1px solid black;
}
.modal-btns{
	height:50px;
	line-height:50px;
    padding: 0px 16px;
}
.writerInfo,.userInfo{
    margin-left: -12px;
    margin-right: 0;
    padding: 12px 16px 0px 16px;
    display: flex;
}
.userProfileID,.writerProfileID{
	font-weight: 600;
    padding-left: 5px;
    margin: 0px 5px 0px -5px;
}
.userReply,.text>p{
        word-break: break-all;	
}
.writeReplyBox{
	display:flex;
}
.modal-title{
	line-height: 50px;
}
.writeReply{	
    border: 1px solid black;
    width: 700px;
    margin: 0px 20px;
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
    var feedState = 0; // 0:PersonalFeed 1:ScrapFeed
    var myMail = '${mvo.email }';
	$(function() {
		$("#registerFeed").on("click", function() {
			location.href = "writeFeed";
		})
	})
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
	$(function() {
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


</script>
</head>

<body>
    <jsp:include page="/resources/jsp/nav.jsp" />
	<div class="container-fluid">
		<div class="profile">
			<c:choose>
				<c:when test="${loginInfo.email ne mvo.email}">
					<div class="profileLayoutLeft">
						<button class="btn btn-primary btn-lg" id="openModalBtn">＋</button>
						<div class="btnText">친구요청</div>
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

					<div class="report">
						<button type="button" id="reportBtn">ㆍㆍㆍ</button>
					</div>
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
						<div class="profileLayoutRight">
							<button class="profileButton" id="changeInfo">＋</button>
							<div class="btnText">회원정보</div>
						</div>
					</div>
					<div class="profileMessageLayout">
						<div class="profileName">${mvo.nickname }</div>
						<div class="profileMessage">${mvo.profile_msg}</div>
					</div>
					
				</c:otherwise>

			</c:choose>
		</div>
		<div class=menubar style="height:200px;">
		<button type="button" id="personalFeed">Personal feed</button>
		<button type="button" id="scrapFeed">scrap feed</button>
		
		<button type="button" id="registerFeed">게시물 등록</button>
	
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
      
		
		

</div>

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
						action="${pageContext.request.contextPath}/friend/friendRequest?to_id=${mvo.email}"
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
	         <span class="writerProfile"></span>
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
                    		<span class="writerProfile"></span>
                     		<span class="writerProfileID">asdsadas</span>
                    </div>
                    <div class="userInfo">
                    		<span class="userProfile"><img class="userProfileImg" src="${pageContext.request.contextPath }/resources/images/dog.jpg" alt=""></span>
                     		<span class="userProfileID">asdsadas</span>
                    		<span class="userReply"></span>
                    </div>   
                     <div class="userInfo">
                    		<span class="userProfile"><img class="userProfileImg" src="${pageContext.request.contextPath }/resources/images/dog.jpg" alt=""></span>
                     		<span class="userProfileID">asdsadas</span>
                    		<span class="userReply"></span>
                    </div>          
                </div>
                <div class="modal-btns">KobeKim</div>
            </div>
        </div>
	      <div class="modal-header">
				<div class="writeReplyBox">					
	         		<span class="myProfile"><img class="userProfileImg" src="${pageContext.request.contextPath }/resources/images/dog.jpg" alt=""></span>
	       			 <h5 class="modal-title" id="exampleModalLabel">${loginInfo.nickname }</h5>
	       			 <div class="writeReply" style="border:1px solid black;"></div>
	       			 <button type="button" class="registerReplyBtn">등록</button>
				</div>
	      </div>
	    </div>
	  </div>
	  </div>
	
		
	<script type="text/javascript">
	
	    $("#registerFeed").on(
						"click",
						function() {location.href = "${pageContext.request.contextPath}/feed/writeFeed";
						})	
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
			var textRow = $("<span class='row text'></span>");
			textRow.append(dto.contents);
			$(".writerInfo").append(textRow);
			
			
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
			
			$(".modal-btns").html("");
			$(".modal-btns").append(likeA);
			$(".modal-btns").append(bookmarkA);

			$(".writerProfile").html("<img src="+writerProfile+" class='writerProfileImg'>");
			
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

																	"<div class=frInfo><a href='${pageContext.request.contextPath}/feed/myFeed?email="
																			+ waitlist[j].email
																			+ "'>"
																			+ waitlist[j].email
																			+ " </a> <button type=button class=frInfo id=acceptfr name="+waitlist[j].email+">친구 추가</button><button type=button class=frInfo id=cancelfr name="+waitlist[j].email+">취소</button></div>");

												}
											}
											if (res.list != null) {
												var list = JSON.parse(res.list);
												for (var j = 0; j < list.length; j++) {
													$('.modal-body2')
															.append(

																	"<div class=frInfo><a href='${pageContext.request.contextPath}/feed/myFeed?email="
																			+ list[j].email
																			+ "'>"
																			+ list[j].email
																			+ " </a> <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

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
																										"<div class=frInfo id=wfrNum"+j+"><a href='${pageContext.request.contextPath}/feed/myFeed?email="
																												+ waitlist[j].email
																												+ "'>"
																												+ waitlist[j].email
																												+ " </a> <button type=button class=frInfo id=acceptfr name="+waitlist[j].email+">친구 추가</button><button type=button class=frInfo id=cancelfr name="+waitlist[j].email+">취소</button></div>");

																					}
																				}
																				if (res.list != null) {
																					var list = JSON
																							.parse(res.list);
																					for (var j = 0; j < list.length; j++) {
																						$(
																								'.modal-body2')
																								.append(

																										"<div class=frInfo id=frNum"+j+"><a href='${pageContext.request.contextPath}/feed/myFeed?email="
																												+ list[j].email
																												+ "'>"
																												+ list[j].email
																												+ " </a> <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

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