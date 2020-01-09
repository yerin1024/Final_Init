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
	#alarmContainer{
		width:350px; height: 200px;
	}
</style>
</head>
<body>
	<button id=showAlarm>알람 확인하기</button> <button id=closeAlarm>알람 끄기</button>
	<div id="alarmContainer"></div>
	
	<script>
	$(document).ready(function(){
		
	
		$("#showAlarm").on("click",function(){
			$("#alarmContainer").fadeIn(0);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/alarm/test.al",
				method: "post",
				data: {
					
				},
				dataType: "json"
			}).done(function(resp){
// 	        	 $("#alarmContainer").append("<ul><li class='from_id'>"+resp.contents+"</li><span class=time_right></span><span class=readCheck></span><br></ul>");
	        	 console.log(resp);
	        	 console.log(resp[1]);
	        	 console.log(resp[1].alarm_seq);
	        	 
	        	 $("#alarmContainer").children().remove();
	        	 
	        	 for(var i=0; i<resp.length; i++){
	        	 $("#alarmContainer").append("<div style='background-color:skyblue; color:white;'> code : "+resp[i].type+" -- date : "+resp[i].reg_date+"</div>");
	        	 if(resp[i].type == 'L'){
	        		 
	        		 $("#alarmContainer").append("<div style='background-color:pink; color:white;'> 좋아요가 추가된 게시글이 있습니다.</div>");
	        	 }else if(resp[i].type == 'R'){
	        		 $("#alarmContainer").append("<div style='background-color:pink; color:white;'> 댓글이 달린 게시글이 있습니다. </div>");
	        	 }
	        	 }
				
			}).fail(function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
			})
			
		});
		
		$("#closeAlarm").click(function(){
			   $("#alarmContainer").fadeOut(0);
			   });
		
	});
	</script>

</body>
</html>