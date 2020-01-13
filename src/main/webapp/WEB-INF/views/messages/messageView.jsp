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
	/*            border: 1px solid red;*/
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
	/*            border:1px solid black;*/
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
	width: 400px;
	height: 40px;
	float: left;
	/*            border: 1px solid black;*/
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

.pre_back {
	float: left;
	width: 30px;
	margin-left: 3px;
	padding: 2px;
	padding-top: 15px;
}

.pre_back:hover {
	cursor: pointer;
}

.pre_top_fr_pf {
	/*            border: 1px solid #1bd369;*/
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

.pre_back_img {
	width: 80%;
}

.pre_text {
	float: left;
	line-height: 60px;
	padding-left: 10px;
	/*            border: 1px solid yellow;*/
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
            <div class="pre_back"><img src="images/left2.png" class="pre_back_img"></div>
            <div class="pre_top_fr_pf"><img src="images/b1.png" class="pre_top_fr_pf_img"></div>
            <div class="pre_text"><b>yuri</b></div>
          </div>
          
		<div class="sector">
<!--           ------------------------------------------------->
           <div class="sector_in">
<!--             <ul> -->
<!--                 <li class="from_id">ㅏㅏㅓㅏㅓㅏㅓㅏ</li><span class=time>10:39</span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="to_id">집가고싶다</li><span class=time_right>10:39</span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="to_id">집가고싶다</li><span class=time_right>10:39</span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="to_id">집가고싶다</li><span class=time_right>10:39</span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="from_id">시험용 싯ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅjjjjjjjjjjjjjjjjjjjjjjjㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅕㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ시험용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time>10:39</span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck></span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck></span><br> -->
<!--             </ul> -->
<!--             <ul> -->
<!--                 <li class="to_id">시험용 시험ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li><span class=time_right>10:39</span><span class=readCheck></span><br> -->
<!--             </ul> -->

		<c:forEach var="dto" items="${list}">
			
			<c:choose>
			   <c:when test="${dto.from_id eq '123@123.123'}">
			     <ul>
	                <li class="from_id">${dto.contents}</li><span class=time_right>${dto.write_date}</span>
	                <span class=readCheck>${dto.receive_read}</span><br>
	            </ul>
			   </c:when>
			   
			   <c:otherwise>
	            <ul>
	                <li class="to_id">${dto.contents}</li><span class=time>${dto.write_date}</span><br>
	            </ul>
			   </c:otherwise>
			</c:choose>

       	</c:forEach>
            
            
            </div>
<!--           ------------------------------------------------->
        <div id="footer"><input type="text" id="inputtxt" name="contents">
            <button id="sendfly" type="submit"><b>SEND</b></button>
        </div>
        
		</div>
    </div>
	
	
	<script>
	$(document).ready(function(){
		
// 		$("#view1").scrollTop($("#view1")[0].scrollHeight);
		
	   $("div[class='ac1']").click(function(){
	   $("div[id='view1']").fadeIn(0);
	   });
	   
	 $("div[id='cross']").click(function(){
	   $("div[id='view1']").fadeOut(0);
	   });
	 
// 	 $("#sendfly").on("click",function(){
// 		 sumbit();
// 	 });
	 
	});
	
	
	
	 $(document).on("click", "#sendfly", function(){
         $.ajax({
            url : "${pageContext.request.contextPath}/message/sendFly.msg",
            method : "post",
            data : {
               contents : $("#inputtxt").val(),
               to_id: "098@123.123"
            },
            dataType : "json"
         }).done(function(resp) {
        	 $("#inputtxt").val("");
        	 $(".sector_in").append("<ul><li class='from_id'>"+resp.contents+"</li><span class=time_right></span><span class=readCheck></span><br></ul>");
        	 
        	 var objDiv = document.getElementById("view1");
        	 objDiv.scrollTop=objDiv.scrollHeight;
        	 
        }).fail(function(a,b,c){
        	console.log(a);
        	console.log(b);
        	console.log(c);
        })
        
      })
	</script>
	
</body>
</html>