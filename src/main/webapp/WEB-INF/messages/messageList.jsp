<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messenger</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
* {
	box-sizing: border-box;
}
.ac1, #cross {
	cursor: pointer;
}
.ac1 {
	width: 50px;
	height: 50px;
	position: relative;
	left: 100px;
}
.ac2 {
	position: fixed;
	bottom: 620px;
	right: 10px;
	/*            border: 1px solid black;*/
	width: 50px;
	height: 50px;
}
.pre_top {
	position: fixed;
	bottom: 560px;
	right: 10px;
	width: 400px;
	height: 65px;
	background-color: #5d9ef5;
	color: white;
}
#view1 {
	display: none;
	position: fixed;
	bottom: 60px;
	right: 10px;
	width: 400px;
	height: 500px;
	border: 1px solid #5d9ef5;
	/*            border-radius: 10px;*/
	overflow: scroll;
	overflow-x: hidden;
}
#cross {
	/*            border: 1px solid red;*/
	float: right;
	width: 30px;
	height: 30px;
	margin: 10px;
}
.sector {
	/*            border: 1px solid #e6abb5;*/
	min-height: 60px;
}
[class^=pre] {
	height: 60px;
}
.pre_line {
	/*            border: 1px solid red;*/
	
}
.pre_line:hover {
	/*            border: 1px solid red;*/
	background-color: #e5e5e5;
	transition-duration: 0.2s;
	cursor: pointer;
}
.pre_pf {
	/*            border: 1px solid #1bd369;*/
	width: 50px;
	float: left;
	margin-left: 3px;
	padding: 2px;
	padding-top: 10px;
}
.pre_pf_img {
	width: 100%;
	height: 45px;
	border-radius: 30px;
}
.pre_text {
	/*            border: 1px solid #4500ff;*/
	float: left;
	width: 250px;
	line-height: 25px;
	font-size: 14px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-left: 5px; padding-right: 5px; padding-top: 5px;
}
.pre_time {
	/*            border: 1px solid #764b91;*/
	float: left;
	width: 75px;
	text-align: center;
	line-height: 60px;
	font-size: 14px;
	color: #535353;
}
.pre_title {
	font-size: 30px;
	margin-left: 10px;
	float: left;
	line-height: 60px;
}
.pre_back {
	float: left;
	width: 30px;
	margin-left: 3px;
	padding: 2px; padding-top: 15px;
}
.pre_back:hover {
	cursor: pointer;
}
.pre_top_pf {
	/*            border: 1px solid #1bd369;*/
	width: 50px;
	float: left;
	margin-left: 3px;
	padding: 2px; padding-top: 10px;
}
.pre_top_pf_img {
	width: 100%;
	height: 45px;
	border-radius: 30px;
}
#footer {
	position: fixed;
	bottom: 20px;
	right: 10px;
	width: 400px; height: 40px;
	float: left;
	/*            border: 1px solid black;*/
	background-color: #5d9ef5;
}
#inputtxt {
	width: 300px;
	margin-left: 10px; margin-right: 10px; margin-top: 5px;
	border-radius: 30px;
	height: 75%;
	padding-left: 15px; padding-right: 15px;
	border: none;
}

#sendfly {
	float: right;
	color: white;
	line-height: 40px;
	margin-right: 20px;
}
</style>
</head>
<body>
	
	<div class="ac1"><img src="/images/letter.png" style="width:50px;"></div>

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
          
		<div class="sector">
<!--           ------------------------------------------------->
            <div class="pre_line">
            <a href="detail.msg=">
                <div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div>
                <div class="pre_text"><b>yuri</b><br>뭐 먹고 싶은지 정해 놓으면 내가 나중에 사 갈게</div>
                <div class="pre_time">14:16</div>
            </a>
            </div>
            <div class="pre_line">
                <div class="pre_pf"><img src="images/b4.png" class="pre_pf_img"></div>
                <div class="pre_text"><b>k_jjjjks</b><br>그럼 수요일에 어디 들렀다 갈 거야?</div>
                <div class="pre_time">19.01.03</div>
            </div>
            <div class="pre_line">
                <div class="pre_pf"><img src="images/b3.jpg" class="pre_pf_img"></div>
                <div class="pre_text"><b>123j_yu</b><br>오키</div>
                <div class="pre_time">19.01.03</div>
            </div>
            <div class="pre_line">
                <div class="pre_pf"><img src="images/default.png" class="pre_pf_img"></div>
                <div class="pre_text"><b>n</b><br>기본</div>
                <div class="pre_time">19.01.03</div>
            </div>
            
            <div class="pre_line">
                <div class="pre_pf"><img src="images/default.png" class="pre_pf_img"></div>
                <div class="pre_text"><b>collapse</b><br>♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡</div>
                <div class="pre_time">19.01.03</div>
            </div>
            
<!--           ------------------------------------------------->
        <div id="footer">
        	
        </div>
		</div>
    </div>
	
	
	<script>
	$(document).ready(function(){
		
	   $("div[class='ac1']").click(function(){
	   $("div[id='view1']").fadeIn(0);
	   });
	   
	 $("div[id='cross']").click(function(){
	   $("div[id='view1']").fadeOut(0);
	   });
	 
	});
	</script>
	
	
</body>
</html>