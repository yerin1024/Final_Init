<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" href="/resources/css/nav.css">
<style>
*{ box-sizing: border-box; }
        .a_ac1, #a_cross{ cursor:pointer; }
        .a_ac1{
            width: 50px; height: 50px;
            position: relative;
            left: 100px;
        }
        .a_ac2{
            position: fixed;
            top: 65px; right: 10px;
/*            border: 1px solid black;*/
            width: 50px;
            height: 50px;
        }
        #a_view1{
            display:none;
            position: fixed;
            top: 110px; right: 10px;
            width: 450px; height: 300px;
            border:1px solid #9f9f9f;
/*            border-radius: 10px;*/
            overflow: scroll;
            overflow-x: hidden;
        }
        #a_cross{
/*            border: 1px solid red;*/
            float: right;
            width: 30px; height: 30px;
            margin: 10px;
        }
        .a_sector{
/*            border: 1px solid #e6abb5;*/
            min-height: 60px;
        }
        [class^=a_pre]{
            height: 50px;
        }
        .a_pre_line{
/*            border: 1px solid red;*/
        }
        .a_pre_pf{
/*            border: 1px solid #1bd369;*/
            width: 50px;
            float: left;
            margin-left: 2px;
            padding: 2px; padding-top: 2px;
        }
        .a_pre_pf_img{
            width: 100%; height: 45px;
            border-radius: 30px;
        }
        .a_pre_pf_img_nr{
            width: 30px; height: 30px;
            position: relative;
            left: 5px; top: 8px;
        }
        .a_pre_text{
/*            border: 1px solid #4500ff;*/
            float: left;
            width: 250px;
            line-height: 40px;
            font-size: 13px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            padding-left: 5px; padding-right: 5px;
            padding-top: 5px;
        }
        .a_pre_time{
/*            border: 1px solid #764b91;*/
            float: left;
            width: 95px;
            text-align: center;
            line-height: 40px;
            font-size: 12px;
            color: #535353;
            white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
        }
.delAlarm{
    border: none;
	width: 25px; height:25px;
	cursor: pointer;
	background-color: white;
    float: right
}
#noAlarmExist{
	text-align: center;
	height: 290px;
	line-height: 300px;
}
</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp"/>
	<div style="padding-top:60px;">
		<button id=showAlarm>알람 확인하기</button> <button id=closeAlarm>알람 끄기</button>
		<div id="alarmPreContainer">
			<div id="alarmContainer"></div>
		</div>
		
		
<!-- 		<div class="a_ac1" id="a_ac1_1"><img src="/images/letter.png" style="width:50px;"></div> -->

	<div id="a_view1">
		<div class="a_ac2">
		    <div id=a_cross>
		    <img src="/images/cross.png" style="width:30px;">
            </div>
		</div>
          
		<div class="a_sector">
<!--           ------------------------------------------------->
<!--           ------------------------------------------------->
		</div>
    </div>
    
	</div>
	
	
	<script>
	$(document).ready(function(){
		
		// 알림 확인하기 클릭
		$(".a_ac1_nav").click(function(){
			$("div[id='a_view1']").fadeIn(0);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/alarm/alarmList.al",
				method: "post",
				data: {},
				dataType: "json"
			}).done(function(resp){
	        	 $(".a_sector").children().remove();
	        	 
	        	 if(resp.length <1){
	        		 $(".a_sector").append("<div id='noAlarmExist'>알림 목록이 없습니다.</div>");
	        	 }
	        	 
	        	 for(var i=0; i<resp.length; i++){
	        		 
		        	 if(resp[i].type == 'L'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		             
		        		 if(resp[i].alarm_check == 'N'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"' style='background-color:#e9f1f5; color:black;'>"
		        			 		+ "<div class='a_pre_pf'><img src='/images/likeAfter.png' class='a_pre_pf_img_nr'></div>"
		        			 		+ "<div class='a_pre_text'>" + resp[i].nickname_m +"님이 회원님의 게시글을 좋아합니다.</div>"
		        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
		        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/likeAfter.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'>" + resp[i].nickname_m +"님이 회원님의 게시글을 좋아합니다.</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
			        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 }else if(resp[i].type == 'R'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		        		 
		        		 if(resp[i].alarm_check == 'N'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"' style='background-color:#e9f1f5; color:black;'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><b>" + resp[i].email_r +" </b>"+resp[i].contents+"</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
			        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        			 
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><b>" + resp[i].email_r +" </b>"+resp[i].contents+"</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
			        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 }else if(resp[i].type == 'F'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		             
		        		 if(resp[i].alarm_check == 'N'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"' style='background-color:#e9f1f5; color:black;'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/friendAlarm.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'>" + resp[i].nickname_m +"님의 친구 요청이 있습니다. </div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
			        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        			 
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/friendAlarm.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'>" + resp[i].nickname_m +"님의 친구 요청이 있습니다. </div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
			        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 
		        	 }
	        	 }
	        	 
	        	 // 알림 삭제
	        	 $(".delAlarm").on("click",function(){
	        		 var seq = this.value;
	        		 console.log("클릭 테스트");
	        		 console.log(this.value);
	        		 
	        		 $.ajax({
	     				url:"${pageContext.request.contextPath}/alarm/delete.al",
	     				method: "post",
	     				data: {
	     					alarm_seq: seq
	     				},
	     				dataType: "json"
	     			}).done(function(resp){
	     				document.getElementById("a_ac1_1").click();
	     				
	     			}).fail(function(a,b,c){
	     				console.log(a); console.log(b); console.log(c);
	     			});
	        		 
     			 });
				
			}).fail(function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
			})
			
		});
		
		// 알림 닫기
		$("div[id='a_cross']").click(function(){
			$("div[id='a_view1']").fadeOut(0);
			$(".a_sector").children().remove();
			
			// 알림 확인
			$.ajax({
 				url:"${pageContext.request.contextPath}/alarm/alarmCheck.al",
 				method: "post",
 				data: {},
 				dataType: "json"
 			}).done(function(resp){
 				console("알림 체크 성공");
 				
 			}).fail(function(a,b,c){
 				console.log(a); console.log(b); console.log(c);
 			});
			
			
		});
		
	});
	</script>

</body>
</html>