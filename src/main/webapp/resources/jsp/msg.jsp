<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="ac1" id="ac1_1">
	<img src="/images/letter.png" style="width: 50px;">
</div>
<div id=collection>
	<button id=toCollection>메시지 목록</button>
</div>

<div id="view1">
	<div class="ac2">
		<div id=cross>
			<img src="/images/cross.png" style="width: 30px;">
		</div>
	</div>
	<div class="pre_top">
		<div class="pre_top_pf">
			<img src="/images/default_profile_img.png" class="pre_top_pf_img">
		</div>
		<div class="pre_title">Messenger</div>
	</div>

	<!--       <div class="search"> -->
	<!--             <input type="text"> <img src="/images/search1.png" style="width: 20px;"> -->
	<!--         </div> -->

	<div class="sector">
		<!--           ------------------------------------------------->
		<div class="sector_in">
		
		</div>
		<!--           ------------------------------------------------->
		<div id="footer"></div>
	</div>
</div>


<script>
	 
	$(document).ready(function(){

		// 열기
		$(".ac1_nav").click(function(){
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
 								 $(".sector_in").append("<ul class='ul_right'>"
 							                +"<li class='from_id'>"+resp[i].contents+"</li><span class=time_right>"
 							                +resp[i].write_date+"</span><br></ul>");
 							 }else{
 								 $(".sector_in").append("<ul class='ul_left'>"
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
 			        			 $(".sector_in").append("<ul class='ul_right'><li class='from_id'>"
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
 							 
 							 // 안읽 있음
 							 if(resp[i].unread_count>0){
 								$(".sector_in").append("<div class='pre_line'>"
 										 +"<div class='pre_pf'><img src='/images/default_profile_img.png' class='pre_pf_img'></div>"
 										 +"<div class='pre_text_p' id='"+resp[i].to_id+"'><b>"+resp[i].to_id+"</b><br>"+resp[i].contents+"</div>"
 										 +"<span class='pre_time_p'>"+resp[i].write_date+"</span>"
 										 + "<span class='pre_new_p'><span class='pre_new_inside'>"+resp[i].unread_count+"</span></span>"
 										 +"</div>");
 								// 안읽 없음
 							 }else{
 								$(".sector_in").append("<div class='pre_line'>"
 	 									 +"<div class='pre_pf'><img src='/images/default_profile_img.png' class='pre_pf_img'></div>"
 	 									 +"<div class='pre_text_p' id='"+resp[i].to_id+"'><b>"+resp[i].to_id+"</b><br>"+resp[i].contents+"</div>"
 	 									 +"<span class='pre_time_p'>"+resp[i].write_date+"</span>"
 	 									 + "<span class='pre_new_p'></span>"
 	 									 +"</div>");
 							 }
 							 
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
		 								 $(".sector_in").append("<ul class='ul_right'><li class='from_id'>"
		 										 +resp[i].contents+"</li><span class=time_right>"
		 										 +resp[i].write_date+"</span><br></ul>");
		 							 }else{
		 								 $(".sector_in").append("<ul class='ul_left'><li class='to_id'>"
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
		 			        			 $(".sector_in").append("<ul class='ul_right'><li class='from_id'>"
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