<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>

* {
	box-sizing: border-box;
}
.ac1, #cross { cursor: pointer; }
.ac1 {
	width: 50px;
	height: 50px;
	position: relative;
	left: 100px;
}
.ac2 {
	position: fixed;
	bottom: 620px; right: 10px;
	/*            border: 1px solid black;*/
	width: 50px; height: 50px;
}
.pre_top {
	position: fixed;
	bottom: 560px; right: 10px;
	width: 400px; height: 65px;
	background-color: #5d9ef5;
	color: white;
}
#view1 {
	display: none;
	position: fixed;
	bottom: 60px; right: 10px;
	width: 400px; height: 500px;
	border: 1px solid #5d9ef5;
	/*            border-radius: 10px;*/
	overflow: scroll;
	overflow-x: hidden;
}
#cross {
	/*            border: 1px solid red;*/
	float: right;
	width: 30px; height: 30px;
	margin: 10px;
}

.sector {
	/*            border: 1px solid #e6abb5;*/
	min-height: 60px;
}

/* -- pre 시작 ----------------------------------------- */
	[class^=pre] { height: 60px; }
	.pre_line {
	
	}
	.pre_line:hover {
		background-color: #e8e8e8;
		transition-duration: 0.2s;
	}
	.pre_pf {
/*        border: 1px solid pink;*/
		width: 50px;
		float: left;
		margin-left: 3px;
		padding: 2px; padding-top: 10px;
	}
	.pre_pf_img {
		width: 100%; height: 45px;
		border-radius: 30px;
	}
	.pre_text {
		float: left;
		width: 250px;
		font-size: 14px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		padding-right: 15px;
		line-height: 60px;
		padding-left: 10px;
	}
	.pre_text_p{
/*        border: 1px solid red;*/
           float: left;
           width: 250px;
           line-height: 25px;
           font-size: 14px;
           white-space: nowrap;
           overflow: hidden;
           text-overflow: ellipsis;
           padding-left: 5px; padding-right: 5px;
           padding-top: 5px;
       }
	.pre_title {
		font-size: 30px;
		margin-left: 10px;
		float: left;
		line-height: 60px;
	}
	.pre_top_pf {
		width: 50px;
		float: left;
		margin-left: 3px;
		padding: 2px; padding-top: 10px;
	}
	.pre_top_pf_img {
		width: 100%; height: 45px;
		border-radius: 30px;
	}
/* -- pre (messageView) ----------------------------------------- */
	.pre_top_fr_pf {
		width: 50px;
		float: left;
		margin-left: 3px;
		padding: 2px;
		padding-top: 10px;
	}
	.pre_top_fr_pf_img {
		width: 100%;
		height: 45px;
		border-radius: 30px;
	}
	.pre_back_img { width: 80%; height: 40px; }
	.pre_back {
		float: left;
		width: 30px;
		margin-left: 3px;
		padding: 2px; padding-top: 15px;
	}
	.pre_back:hover { cursor: pointer; }
	
/* -- pre 끝 ----------------------------------------- */

li { list-style: none; } 
ul { padding-bottom: 10px; }

.to_id {
	background-color: gray;
	color: white;
	display: inline-block;
	padding: 5px;
	margin-left: -30px;
	margin-right: 20px;
	border-radius: 10px;
	word-break: break-all;
	font-size: 14px;
	box-shadow: 2px 2px 2px #777777;
}
.from_id {
	background-color: cornflowerblue;
	color: white;
	display: inline-block;
	padding: 5px;
	margin-right: 10px;
	border-radius: 10px;
	float: right;
	word-break: break-all;
	font-size: 14px;
	box-shadow: 2px 2px 2px #777777;
}
.time {
	font-size: 8px;
	margin-left: -10px; margin-right: 5px;
}
.time_right {
	font-size: 8px;
	margin-left: 5px;
	margin-right: 5px;
	float: right;
	line-height: 25px;
}
.readCheck {
	float: right;
	font-size: 8px;
	margin-bottom: 10px;
	line-height: 25px;
}
#footer {
	position: fixed;
	bottom: 20px;
/* 	right: 10px; */
	width: 400px; height: 40px;
	float: left;
	background-color: #5d9ef5;
}

#inputtxt {
	width: 300px;
	margin-left: 10px;
	margin-right: 10px;
	border-radius: 30px;
	height: 75%;
	margin-top: 5px;
	padding-left: 15px;
	padding-right: 15px;
	border: none;
}

#sendfly{
    float: right;
    color: white;
    line-height: 40px;
    margin-right: 20px;
    cursor: pointer;
    height: 100%;
    background-color: #5d9ef5;
    border: none;
    font-size: 15px;
}

.pre_time {
	float: left;
	width: 70px;
	text-align: center;
	line-height: 60px;
}
.pre_time_p{
    height: 30px;
/*    border: 1px solid green;*/
    float: left;
    width: 75px;
    text-align: center;
    line-height: 30px;
    font-size: 12px;
    color: #535353;
    white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
    /* -----!---------!---------!------!-------!--------!----!-------!-------- */
.pre_new_p{
/*    border: 1px solid green;*/
    height: 30px;
    float: left;
    width: 75px;
    text-align: right;
    line-height: 30px;
    font-size: 12px;
    color: #535353;
    white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
.pre_new_inside{
/*    border: 1px solid black;*/
    background-color: red;
    padding: 2px; padding-left: 6px; padding-right: 6px;
    margin-right: 10px;
    color: white;
    border-radius: 10px;
}
     /* -----!---------!---------!------!-------!--------!----!-------!-------- */
.pre_start {
	width: 55px;
	height: 50px;
	margin-top: 5px;
}

.pre_start:hover {
	cursor: pointer;
}

/* ---------------------------------------------------------------------------------------- */


@media ( max-width : 700px ) {
	.ac2 {
		position: fixed;
		bottom: 780px;
		right: 10px;
		/*            border: 1px solid black;*/
		width: 50px;
		height: 50px;
	}
	.pre_top {
		/*    border: 1px solid red;*/
		position: fixed;
		bottom: 680px;
		width: 100%;
		height: 75px;
		background-color: #5d9ef5;
		color: white;
	}
	#view1 {
		display: none;
		position: fixed;
		bottom: 80px;
		right: 0px;
		width: 100%;
		height: 600px;
		border: 1px solid #5d9ef5;
		/*            border-radius: 10px;*/
		overflow: scroll;
		overflow-x: hidden;
	}
	#cross {
		/*    border: 1px solid red;*/
		float: right;
		width: 50px;
		height: 50px;
		margin: 10px;
	}
	.sector {
		/*    border: 1px solid #e6abb5;*/
		min-height: 80px;
	}

	/* -- pre 시작 ----------------------------------------- */
	.pre_line {
		/*        border: 1px solid green;*/
		padding-top: 5px;
		height: 80px;
	}
	.pre_line:hover {
		background-color: #e8e8e8;
		transition-duration: 0.2s;
	}
	.pre_pf {
		/*        border: 1px solid red;*/
		width: 80px;
		height: 80px;
		float: left;
		margin-left: 15px;
		padding: 2px;
		padding-top: 0px;
	}
	.pre_pf_img {
		/*        border: 1px solid red;*/
		width: 70px;
		height: 70px;
		border-radius: 50px;
	}
	.pre_text {
		/*        border: 1px solid blue;*/
		float: left;
		width: 50vw;
		line-height: 60px;
		font-size: 20px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		padding-left: 30px;
		padding-right: 15px;
	}
	.pre_text_p {
		/*            border: 1px solid red;*/
		float: left;
		width: 55vw;
		line-height: 25px;
		font-size: 15px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		padding-left: 5px;
		padding-right: 5px;
		padding-top: 5px;
	}
	.pre_title {
		text-align: center;
		font-size: 35px;
		line-height: 70px;
	}
	.pre_top_pf {
		display: none;
	}
	.pre_top_pf_img {
		display: none;
	}
	/* -- pre (messageView) ----------------------------------------- */
	.pre_top_fr_pf {
		width: 60px;
		height: 60px;
		float: left;
		margin-left: 3px;
		padding: 2px;
		padding-top: 10px;
	}
	.pre_top_fr_pf_img {
		width: 55px;
		height: 55px;
		border-radius: 30px;
	}
	.pre_back_img {
		width: 100%;
		height: 45px;
	}
	.pre_back {
		float: left;
		width: 30px;
		margin-left: 10px;
		margin-right: 10px;
		padding: 2px;
		padding-top: 15px;
	}
	/* -- pre 끝 ----------------------------------------- */
	.to_id {
		background-color: gray;
		color: white;
		display: inline-block;
		padding: 5px;
		margin-left: -30px;
		margin-right: 20px;
		border-radius: 10px;
		word-break: break-all;
		font-size: 20px;
		box-shadow: 2px 2px 2px #777777;
	}
	.from_id {
		background-color: cornflowerblue;
		color: white;
		display: inline-block;
		padding: 5px;
		margin-right: 10px;
		border-radius: 10px;
		float: right;
		word-break: break-all;
		font-size: 20px;
		box-shadow: 2px 2px 2px #777777;
	}
	#footer {
		position: fixed;
		bottom: 20px;
		/* 	right: 10px; */
		width: 100%;
		height: 60px;
		float: left;
		background-color: #5d9ef5;
	}
	#inputtxt {
		width: 75vw;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 30px;
		height: 75%;
		margin-top: 5px;
		padding-left: 15px;
		padding-right: 15px;
		border: none;
	}
	#sendfly {
		float: right;
		color: white;
		line-height: 40px;
		margin-right: 20px;
		cursor: pointer;
		height: 100%;
		background-color: #5d9ef5;
		border: none;
		font-size: 18px;
	}
	.pre_time {
		/*    border: 1px solid red;*/
		float: right;
		height: 80px;
		margin-right: 30px;
		width: 70px;
		text-align: center;
		line-height: 60px;
	}
	.pre_time_p {
/*        border: 1px solid pink;*/
		float: left;
		width: 100px;
		text-align: center;
		line-height: 30px;
		font-size: 12px;
		color: #535353;
		white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
    /* -----!---------!---------!------!-------!--------!----!-------!-------- */
    .pre_new_p{
/*        border: 1px solid green;*/
        height: 30px;
        float: left;
        width: 100px;
        text-align: right;
        line-height: 30px;
        font-size: 12px;
        color: #535353;
        white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
    }
    .pre_new_inside{
/*        border: 1px solid black;*/
        background-color: red;
        padding: 2px; padding-left: 6px; padding-right: 6px;
        margin-right: 10px;
        color: white;
        border-radius: 10px;
    }
     /* -----!---------!---------!------!-------!--------!----!-------!-------- */
	.pre_start {
		/*    border: 1px solid pink;*/
		width: 65px;
		height: 60px;
		margin-top: 5px;
	}
}
</style>
</head>
<body>
	
	<div class="ac1" id="ac1_1"><img src="/images/letter.png" style="width:50px;"></div>
	<div id=collection>
		<button id=toCollection>메시지 목록</button>
	</div>
			
	<div id="view1">
		<div class="ac2">
		    <div id=cross>
		    <img src="/images/cross.png" style="width:30px;">
            </div>
		</div>
		<div class="pre_top">
            <div class="pre_top_pf"><img src="/images/default_profile_img.png" class="pre_top_pf_img"></div>
            <div class="pre_title">Messenger</div>
          </div>
          
<!--       <div class="search"> -->
<!--             <input type="text"> <img src="/images/search1.png" style="width: 20px;"> -->
<!--         </div> -->
          
		<div class="sector">
<!--           ------------------------------------------------->
			<div class="sector_in">

<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>yuri</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->
<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/default.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>whoru</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->

<%-- 			<c:forEach var="dto" items="${list}"> --%>
<!--         	<div class="pre_line"> -->
<!--         		<div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div> -->
<%--         		<div class="pre_text"><b>${dto.fr_id}</b></div> --%>
<!--                 <div class="pre_time"> -->
<%--                 <a href="${pageContext.request.contextPath}/message/messageView.msg?fr_id=${dto.fr_id}"> --%>
<%--                 <img src="/images/startMsg.png" class="pre_start" id="${dto.fr_id}"> --%>
<!--                 </a> --> 
<!--                 </div> -->
<!--             </div> -->
<%--        		</c:forEach> --%>
			
			</div>
<!--           ------------------------------------------------->
        <div id="footer">
        </div>
		</div>
    </div>
	
	
	<script>
	 
	$(document).ready(function(){

		// 열기
		$("div[class='ac1']").click(function(){
			$("div[id='view1']").fadeIn(0); 
			
			$.ajax({
 				url:"${pageContext.request.contextPath}/message/friendList.msg",
 				method: "post",
 				data: {},
 				dataType: "json"
 			}).done(function(resp){
 				$(".pre_top").children().remove();
 				$(".pre_top").append("<div class='pre_top'>"
 		 	            +"<div class='pre_top_pf'><img src='/images/default_profile_img.png' class='pre_top_pf_img'></div>"
 		 	            +"<div class='pre_title'>Messenger</div>"
 		 	          	+"</div>");
 				
 				$(".sector_in").children().remove();
 				for(var i=0; i < resp.length; i++){
 					$(".sector_in").append("<div class='pre_line'>"
 							+"<div class='pre_pf'><img src='/images/default_profile_img.png' class='pre_pf_img'></div>"
 			        		+"<div class='pre_text'><b>"+resp[i].fr_id+"</b></div>"
 			                +"<div class='pre_time'>"
 			                +"<img src='/images/startMsg.png' class='pre_start' id='"+resp[i].fr_id+"'>"
 			                +"</div></div>");
				}
 				$("#footer").children().remove();
 				
 				// 메시지 상세 보기
 				$(".pre_start").on("click",function(){
 					var friendId = $(this).attr('id');
 					 $.ajax({
 						url: "${pageContext.request.contextPath}/message/messageView.msg",
 						method: "post",
 						data: {
 							to_id: friendId
 						},
 						dataType: "json"
 					 }).done(function(resp){
 						 $(".pre_top").children().remove();
 						 $(".pre_top").append("<div class='pre_back'><img src='/images/left2.png' class='pre_back_img'></div>"
 						            + "<div class='pre_top_fr_pf'><img src='/images/default_profile_img.png' class='pre_top_fr_pf_img'></div>"
 						            + "<div class='pre_text'><b>"+friendId+"</b></div>");
 						 
 						 $(".sector_in").children().remove();
 						 $(".search").children().remove();
 						 for(var i=0; i < resp.length; i++){
 							 if(resp[i].from_id=='123@123.123'){
 								 $(".sector_in").append("<ul>"
 							                +"<li class='from_id'>"+resp[i].contents+"</li><span class=time_right>"
 							                +resp[i].write_date+"</span><br></ul>");
 							 }else{
 								 $(".sector_in").append("<ul>"
 							                + "<li class='to_id'>"+resp[i].contents+"</li><span class=time>"
 							                +resp[i].write_date+"</span><br></ul>");
 							 }
 						}
 						 var objDiv = document.getElementById("view1");
 			        	 objDiv.scrollTop=objDiv.scrollHeight;
 			        	 $("#footer").children().remove();
 			        	 $("#footer").append("<input type='text' id='inputtxt' name='contents'>"
 			        	            +"<button id='sendfly' type='submit'><b>SEND</b></button>");
 			        	
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
 			        			 $(".sector_in").append("<ul><li class='from_id'>"
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
 				
 				// 미리 보기 리스트
 				$("#toCollection").on("click",function(){
 					$.ajax({
 		 				url:"${pageContext.request.contextPath}/message/previewList.msg",
 		 				method: "post",
 		 				data: {
 		 					
 		 				},
 		 				dataType: "json"
 		 			}).done(function(resp){
 		 				$(".pre_top").children().remove();
 		 				$(".pre_top").append("<div class='pre_top'>"
 		 		 	            +"<div class='pre_top_pf'><img src='/images/default_profile_img.png' class='pre_top_pf_img'></div>"
 		 		 	            +"<div class='pre_title'>Messenger</div>"
 		 		 	          	+"</div>");
 		 				
 		 				$(".sector_in").children().remove();
 						 for(var i=0; i < resp.length; i++){
 							 
//  							 // 안읽 없음
//  							 $(".sector_in").append("<div class='pre_line'>"
//  									 +"<div class='pre_pf'><img src='/images/default_profile_img.png' class='pre_pf_img'></div>"
//  									 +"<div class='pre_text_p' id='"+resp[i].to_id+"'><b>"+resp[i].to_id+"</b><br>"+resp[i].contents+"</div>"
//  									 +"<span class='pre_time_p'>"+resp[i].write_date+"</span>"
//  									 + "<span class='pre_new_p'></span>"
//  									 +"</div>");
 							 
//  							 // 안읽 있음
//  							$(".sector_in").append("<div class='pre_line'>"
// 									 +"<div class='pre_pf'><img src='/images/default_profile_img.png' class='pre_pf_img'></div>"
// 									 +"<div class='pre_text_p' id='"+resp[i].to_id+"'><b>"+resp[i].to_id+"</b><br>"+resp[i].contents+"</div>"
// 									 +"<span class='pre_time_p'>"+resp[i].write_date+"</span>"
// 									 + "<span class='pre_new_p'><span class='pre_new_inside'>"+ "안 읽은 숫자" +"</span></span>"
// 									 +"</div>");
 						}
 						$("#footer").children().remove();
 						
 						// 미리 보기 클릭 후 상세 보기로 가기
 						$(".pre_text_p").on("click",function(){
 							var friendId = $(this).attr('id');
 							
 							$.ajax({
		 						url: "${pageContext.request.contextPath}/message/messageView.msg",
		 						method: "post",
		 						data: {
		 							to_id: friendId
		 						},
		 						dataType: "json"
		 					 }).done(function(resp){
		 						 $(".pre_top").children().remove();
		 						 $(".pre_top").append("<div class='pre_back'><img src='/images/left2.png' class='pre_back_img'></div>"
		 						            + "<div class='pre_top_fr_pf'><img src='/images/default_profile_img.png' class='pre_top_fr_pf_img'></div>"
		 						            + "<div class='pre_text'><b>"+friendId+"</b></div>");
		 						 
		 						 $(".sector_in").children().remove();
		 						 $(".search").children().remove();
		 						 for(var i=0; i < resp.length; i++){
		 							 if(resp[i].from_id=='123@123.123'){
		 								 $(".sector_in").append("<ul><li class='from_id'>"
		 										 +resp[i].contents+"</li><span class=time_right>"
		 										 +resp[i].write_date+"</span><br></ul>");
		 							 }else{
		 								 $(".sector_in").append("<ul><li class='to_id'>"
		 										 +resp[i].contents+"</li><span class=time>"
		 										 +resp[i].write_date+"</span><br></ul>");
		 							 }
		 						}
		 						 var objDiv = document.getElementById("view1");
		 			        	 objDiv.scrollTop=objDiv.scrollHeight;
		 			        	 
		 			        	 $("#footer").children().remove();
		 			        	 $("#footer").append("<input type='text' id='inputtxt' name='contents'>"
		 			        	            +"<button id='sendfly' type='submit'><b>SEND</b></button>");
		 			        	
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
		 			        			 $(".sector_in").append("<ul><li class='from_id'>"
		 			        					 +resp.contents+"</li><span class=time_right></span><span class=readCheck></span><br></ul>");
		 			        			 var objDiv = document.getElementById("view1");
		 			        			 objDiv.scrollTop=objDiv.scrollHeight;
		 			        			 
		 			        		 }).fail(function(a,b,c){
		 			        			 console.log(a); console.log(b); console.log(c);
		 			        		 })
		 			        	 });
		 			        	
		 			        	// 대화창에서 목록으로
		 			        	$(".pre_back").on("click",function(){
		 			        		document.getElementById("toCollection").click();
		 			        	});
		 			        	
		 					 }).fail(function(a,b,c){
		 						 console.log(a); console.log(b); console.log(c);
		 					 })
		 					 
 						})
 						
 		 			}).fail(function(a,b,c){
 		 				console.log(a); console.log(b); console.log(c);
 		 	        })
 		 	        
 				});
 				
 				
 				
 			}).fail(function(a,b,c){
 				console.log(a); console.log(b); console.log(c);
 			});
		
		});
		
// 		-----------------------------------------------------------------------------
		
		// 접기
		$("div[id='cross']").click(function(){
			$("div[id='view1']").fadeOut(0);
			$(".sector_in").children().remove();
			
		});
	});
	
	
	</script>
	
</body>
</html>