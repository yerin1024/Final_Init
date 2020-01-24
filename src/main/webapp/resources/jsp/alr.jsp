<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="padding-top:60px;">
<!-- 		<button id=showAlarm>알람 확인하기</button> <button id=closeAlarm>알람 끄기</button> -->
		<div id="alarmPreContainer">
			<div id="alarmContainer"></div>
		</div>
		
		
<!-- 		<div class="a_ac1" id="a_ac1_1"><img src="/images/letter.png" style="width:50px;"></div> -->

	<div id="a_view1" style="background-color:white; z-index:9;">
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
			        			 		+ "<div class='a_pre_text'><b>" + resp[i].nickname_m +" </b>"+resp[i].contents+"</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date +"</div>"
			        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        			 
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><b>" + resp[i].nickname_m +" </b>"+resp[i].contents+"</div>"
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