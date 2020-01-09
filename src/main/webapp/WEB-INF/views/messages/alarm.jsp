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
		border: 1px solid black;
		width:200px; height: 200px;
	}
</style>
</head>
<body>
	<button id=showAlarm>알람 확인하기</button>
	<div id="alarmContainer"></div>
	
	<script>
		$("#showAlarm").on("click",function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/alarm/test.al",
				method: "post",
				data: {
					
				},
				dataType: "json"
			}).done(function(resp){
	        	 $("#alarmContainer").append("<ul><li class='from_id'>"+resp.contents+"</li><span class=time_right></span><span class=readCheck></span><br></ul>");
	        	 
				
			}).fail(function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
			})
			
		});
	</script>

</body>
</html>