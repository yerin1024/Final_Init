<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
<style>
*{ box-sizing: border-box; }
.ac1, #cross{ cursor:pointer; }
.ac1{
    width: 50px; height: 50px;
    position: relative;
    left: 100px;
}
.ac2{
    position: fixed;
    bottom: 620px; right: 10px;
    width: 50px;
    height: 50px;
}
.pre_line{
    position: fixed;
    bottom: 560px; right: 10px;
    width: 400px;
    height: 65px;
    background-color: #5d9ef5;
    color: white;
}
#view1{
    display:none;
    position: fixed;
    bottom: 60px; right: 10px;
    width: 400px; height: 500px;
    overflow: scroll;
    overflow-x: hidden;
}
#cross{
    float: right;
    width: 30px; height: 30px;
    margin: 10px;
}
.sector{
    min-height: 60px;
}

li{
    list-style: none;
}
ul{
    padding-bottom: 10px;
}
.from_id{
    background-color: gray;
    color: white;
    display: inline-block;
    padding: 5px;
    margin-left: -30px; margin-right: 20px;
    border-radius: 10px;
    word-break: break-all;
    font-size: 14px;
    box-shadow: 2px 2px 2px #777777;
}
.to_id{
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
.time{
    font-size: 8px;
    margin-left: 5px; margin-right: 5px;
    margin-left: -10px;
}
.time_right{
    font-size: 8px;
    margin-left: 5px; margin-right: 5px;
    float: right;
    line-height: 25px;
}
.readCheck{
    float: right;
    font-size: 8px;
    margin-bottom: 10px;
    line-height: 25px;
}
#footer{
    position: fixed;
    bottom: 20px;
    width: 400px;
    height: 40px;
    float: left;
    background-color: #5d9ef5;
}
#inputtxt{
    width: 300px;
    margin-left: 10px; margin-right: 10px;
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
}
.pre_back{
    float: left;
    width: 30px;
    margin-left: 3px;
    padding: 2px; padding-top: 15px;
}
.pre_back:hover{
    cursor: pointer;
}
.pre_pf{
    width: 50px;
    float: left;
    margin-left: 3px;
    padding: 2px; padding-top: 10px;
}
.pre_pf_img{
    width: 100%; height: 45px;
    border-radius: 30px;
}
.pre_back_img{
    width: 80%;
}
.pre_text{
    float: left;
    line-height: 60px;
    padding-left: 10px;
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
		<div class="pre_line">
            <div class="pre_back"><img src="images/left2.png" class="pre_back_img"></div>
            <div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div>
            <div class="pre_text"><b>yuri</b></div>
          </div>
          
		<div class="sector">
<!--           ------------------------------------------------->
          
           <div class="sector_in">
            <ul>
                <li class="from_id">ㅏㅏㅓㅏㅓㅏㅓㅏ</li><span class=time>10:39</span><br>
            </ul>
            <ul>
                <li class="to_id">집가고싶다</li><span class=time_right>10:39</span><br>
            </ul>
            <ul>
                <li class="to_id">집가고싶다</li><span class=time_right>10:39</span><br>
            </ul>
            <ul>
                <li class="to_id">집가고싶다</li><span class=time_right>10:39</span><br>
            </ul>
            <ul>
                <li class="from_id">시험용 싯ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅjjjjjjjjjjjjjjjjjjjjjjjㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ시험용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time>10:39</span><br>
            </ul>
            <ul>
                <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck></span><br>
            </ul>
            <ul>
                <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck></span><br>
            </ul>
            <ul>
                <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck></span><br>
            </ul>
            <ul>
                <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck>읽지 않음</span><br>
            </ul>
            </div>
<!--           ------------------------------------------------->
		<form action="sendFly.msg">
        <div id="footer"><input type="text" id="inputtxt">
            <div id="sendfly"><b>SEND</b></div>
        </div>
        </form>
        
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
	 
	 
	 $("#sendfly").on("click",function(){
		 
	 });
	 
	});
	</script>
	
</body>
</html>