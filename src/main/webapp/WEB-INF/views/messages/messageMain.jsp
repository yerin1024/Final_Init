<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		line-height: 55px;
		font-size: 14px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		padding-left: 15px; padding-right: 15px;
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
	.pre_back_img { width: 80%; }
	.pre_back {
		float: left;
		width: 30px;
		margin-left: 3px;
		padding: 2px; padding-top: 15px;
	}
	.pre_back:hover { cursor: pointer; }
	.pre_text {
		float: left;
		line-height: 60px;
		padding-left: 10px;
	}
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
	margin-left: 5px;
	margin-right: 5px;
	margin-left: -10px;
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

.search {
	position: fixed;
	height: 100px;
}

.pre_time {
	float: left;
	width: 70px;
	text-align: center;
	line-height: 60px;
}

.pre_start {
	width: 55px;
	height: 50px;
	margin-top: 5px;
}

.pre_start:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	
	<div class="ac1"><img src="images/letter.png" style="width:50px;"></div>
	
	<div id="view1">
		<div class="ac2">
		    <div id=cross>
		    <img src="/images/cross.png" style="width:30px;">
            </div>
		</div>
		<div class="pre_top">
            <div class="pre_top_pf"><img src="images/b4.png" class="pre_top_pf_img"></div>
            <div class="pre_title">Messenger</div>
          </div>
          
      <div class="search">
            <input type="text"> <img src="/images/search1.png" style="width: 20px;">
        </div>
          
		<div class="sector">
<!--           ------------------------------------------------->

<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>yuri</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->
<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/b4.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>k_jjjjks</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->
<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/b3.jpg" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>123j_yu</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->
<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/default.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>whoru</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->
<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/default.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>collapse</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->

			<c:forEach var="dto" items="${list}">
        	<div class="pre_line">
        		<div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div>
        		<div class="pre_text"><b>${dto.fr_id}</b></div>
                <div class="pre_time">
<%--                 <a href="${pageContext.request.contextPath}/message/messageView.msg?fr_id=${dto.fr_id}"> --%>
                <img src="/images/startMsg.png" class="pre_start" id=${fr_id}">
<!--                 </a> -->
                </div>
            </div>
       		</c:forEach>
			
<!--           ------------------------------------------------->
        <div id="footer">
        </div>
		</div>
    </div>
	
	
	<script>
	 
	$(document).ready(function(){
		// 열기 - 접기
		$("div[class='ac1']").click(function(){ $("div[id='view1']").fadeIn(0); });
		$("div[id='cross']").click(function(){ $("div[id='view1']").fadeOut(0); });
	});
	
	$(document).ready(function(){
		$(".pre_start").on("click",function(){
			
			var bbsreplll = $(this).attr('id'); 
			alert(bbsreplll);
			
		});
		
	});
	
	
	$(document).ready(function(){
		
		$(".pre_start").on("click",function(){
			
			var matches = document.getElementsByClassName("pre_start");
			var seq = document.getElementsByClassName("pre_start").value;
			console.log(this.value);
			console.log(seq);
			
// 			for (var i=0; i<matches.length; i++) {
// 				  matches[i].classList.remove('colorbox');
// 				  matches.item(i).classList.add('hueframe');
// 				  }
			
			
// 			 var url = "${pageContext.request.contextPath}/message/messageView.msg?fr_id=${dto.fr_id}";
// 			 var url2 = "${pageContext.request.contextPath}/message/messageView.msg?fr_id='098@123.123'";
// 			 var url3 = "${pageContext.request.contextPath}/message/messageView.msg?fr_id=098@123.123";
// 			 console.log(url);
// 			 console.log(url2);
// 			 console.log(url3);
			 
// 			 $.ajax({
// 				url: "${pageContext.request.contextPath}/message/messageView.msg",
// 				method: "get",
// 				data: {
// 					to_id: "098@123.123"
// 				},
// 				dataType: "json"
// 			 }).done(function(resp){
// 				 console.log("성공!!")
// 				 console.log(resp.result);
// 				 for(var i=0 in resp){
// 					 console.log(resp[i].result);
// 					 }

		       	
// 			 }).fail(function(a,b,c){
// 				 console.log("실패!")
// 		        	console.log(a);
// 		        	console.log(b);
// 		        	console.log(c);
// 		      })
			 
		 });
		
		
	});
	
	
	
	</script>
	
</body>
</html>