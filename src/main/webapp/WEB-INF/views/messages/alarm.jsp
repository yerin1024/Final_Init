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
	#alarmPreContainer{
		width:500px; height: 200px;
	}
	#alarmContainer{
		width:500px; height: 200px;
		overflow: scroll;
		overflow-x: hidden;
	}
	.alarmCont{
		width: 500px;
	}
	.alarmMsg{
		width: 450px; height:40px;
		line-height: 40px;
		float: left
	}
	.delAlarm{
		width: 30px; height:40px;
		cursor: pointer;
		border: none;
		background-color: white;
	}
</style>
</head>
<body>
	<button id=showAlarm>알람 확인하기</button> <button id=closeAlarm>알람 끄기</button>
	<div id="alarmPreContainer">
		<div id="alarmContainer"></div>
	</div>
	
	<script>
	$(document).ready(function(){
		
		// 알림 확인하기 클릭
		$("#showAlarm").on("click",function(){
			$("#alarmPreContainer").fadeIn(0);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/alarm/alarmList.al",
				method: "post",
				data: {},
				dataType: "json"
			}).done(function(resp){
	        	 $("#alarmContainer").children().remove();
	        	 
	        	 for(var i=0; i<resp.length; i++){
	        		 
		        	 if(resp[i].type == 'L'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		        		 
		        		 if(resp[i].alarm_check == 'N'){
		        			 $("#alarmContainer").append("<div class="+seqId+"><div class=alarmMsg style='background-color:#e8f7ff; color:black;'>"
		        			 		+ resp[i].nickname_m +"님이 회원님의 게시글을 좋아합니다.</div>"
		        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $("#alarmContainer").append("<div class="+seqId+"><div class=alarmMsg style='color:black;'>"
		        			 		+ resp[i].nickname_m+"님이 회원님의 게시글을 좋아합니다.</div>"
		        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 }else if(resp[i].type == 'R'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		        		 
		        		 if(resp[i].alarm_check == 'N'){
		        			 $("#alarmContainer").append("<div class="+seqId+"><div class=alarmMsg style='background-color:#e8f7ff; color:black;'><b>"
		        			 		+ resp[i].nickname_r+" </b>"+resp[i].contents+"</div>"
		        			 		+ "<button class=delAlarm value="+seq+">X</button></div>");
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $("#alarmContainer").append("<div class="+seqId+"><div class=alarmMsg style='color:black;'><b>"
		        			 		+ resp[i].nickname_r+" </b>"+resp[i].contents+"</div>"
		        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 }else if(resp[i].type == 'F'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		        		 
		        		 if(resp[i].alarm_check == 'N'){
		        			 $("#alarmContainer").append("<div class="+seqId+"><div class=alarmMsg style='background-color:#e8f7ff; color:black;'>"
		        			 		+resp[i].from_id+"님의 친구 요청이 있습니다. </div>"
		        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $("#alarmContainer").append("<div class="+seqId+"><div class=alarmMsg style='color:black;'>"
		        			 		+resp[i].from_id+"님의 친구 요청이 있습니다. </div>"
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
	     				document.getElementById("showAlarm").click();
	     				
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
		$("#closeAlarm").click(function(){
			   $("#alarmPreContainer").fadeOut(0);
			   });
		
	});
	</script>

</body>
</html>