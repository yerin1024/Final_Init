<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/css/nav.css?new">
	<link rel="stylesheet" href="/resources/css/msg.css">
	<link rel="stylesheet" href="/resources/css/alr.css">
	<link rel="stylesheet" href="/resources/css/test.css">
	<style>
	
	#profileBigger{
/*            border: 1px solid black;*/
            width: 200px; height: 200px;
            margin: 30px auto 30px auto;
        }
        #profileBiggerImg{
            border-radius: 150px;
            width: 100%;
        }
        
        .userToWhere{
/*            border: 1px solid black;*/
            width: 250px; height: 90px;
            margin: auto;
            margin-bottom: 30px;
        }
        #toUserFeed, #toUserMsg{
/*            border: 1px solid red;*/
            float: left;
            width: 50%; height: 100%;
            text-align: center;
            font-size: 13px;
            line-height: 40px;
            color: gray;
        }
        #toUserMsgImg{
            margin-top: 5px;
        }
        .imgContainer{
/*            border: 1px solid green;*/
            width: 60px; height: 60px;
            margin: auto;
        }
        #toUserFeedImg, #toUserMsgImg{
            width: 100%; height: 
        }
        
/*         ---- 이 위까지 모달 -------------------------------------------------------------------------------------------------------  */
	
	@media (min-width: 700px){
           .navbar-hbg {
                display: none;
            }
        }
        .navbar-hbg-icon{
            display: inline-block;
/*            border: 1px solid red;*/
            width: 35px; height: 35px;
        }
        .navbar-hbg-icon>img{
            width: 100%;
        }
        .navbar-hbg{
            border: none;
            background-color: rgba(255, 255, 255, 0);
        }
        
        
        
    #noFriendExist{
/*        border: 1px solid red;*/
        position: absolute;
        left: 50px; top: 150px;
        color: #656565;
        height: 100px;
        text-align: center;
    }
        #searchTitle{
/*            border: 1px solid blue;*/
            height: 30px;
            margin-bottom: 20px;
        }
        #searchFriend1{
/*            border: 1px solid #d96d00;*/
            float: left;
            width: 20px; height: 20px;
            margin-left: 16px; margin-right: 3px;
            margin-top: 5px;
        }
        #searchFriendImg{
            width: 100%;
        }
        #searchFriend2{
/*            border: 1px solid black;*/
            float: left;
            width: 120px; height: 30px;
            line-height: 30px;
            color: white;
            font-size: 14px;
        }
        #noFriendInside{
/*            border: 1px solid green;*/
            height: 50px; width: 170px;
            margin: auto;
            padding-top: 8px;
            background-color: #3f62a0;
            border-radius: 10px;
        }
        #noMessageExist{
/*        border: 1px solid red;*/
        color: #717171;
        height: 400px;
        line-height: 400px;
        text-align: center;
    }
        

    @media ( max-width : 700px ){
        #noFriendExist{
/*            border: 1px solid green;*/
            position: static;
            height: 100px;
            text-align: center;
            margin-top: 170px;
        }
        #noMessageExist{
/*            border: 1px solid green;*/
            height: 400px;
            text-align: center;
        }
    }
    
    
    
    
	</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp"/>
<%-- 	<jsp:include page="/resources/jsp/alr.jsp"/> --%>
<%-- 	<jsp:include page="/resources/jsp/msg.jsp"/> --%>
	
<!-- 	<div class="ac1" id="ac1_1"><img src="/images/letter.png" style="width:50px;"></div> -->
	<div id=collection>
		<button id=toCollection class=toColl>메시지 목록</button>
	</div>
	
	
	<div class="jolyClass" data-toggle="modal" data-target="#toWhereModal" value='toWhereModal' style="width:700px; height:700px; background-color: green;">이거 클릭하면 모달 띄우기</div>

<!-- Modal -->
<div>
	<div class="modal fade" id="toWhereModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document" style="width: 400px;">
	    <div class="modal-content" >
	      <div class="modal-header modal-header-nickname" >
	        <h5 class="modal-title modal-nickname" id="modal-nickname-title"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	<!--       ----------------- -->
	        <div id='profileBigger'>
<!-- 	        <img src='/images/sadCat.jpg' id='profileBiggerImg'> -->
	        </div>
	        
	        <div class='userToWhere'>
	            <div id='toUserFeed'>
	                <div class='imgContainer'>
	                <img src='/images/toUserFeed.png' id='toUserFeedImg'>
	                </div>
	                <b>피드 가기</b>
	            </div>
	            
	            <div id='toUserMsg'>
	                <div class='imgContainer'>
	                <img src='/images/toUserMsg.png' id='toUserMsgImg'>
	                </div>
	                <b>메시지 보내기</b>
	            </div>
	        </div>
	<!--       ----------------- -->
	      </div>
	      <div class="modal-footer">
	<!--        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
	      </div>
	    </div>
	  </div>
	</div>
</div>



			
	<div id="view1">
		<div class="ac2">
		    <div id=cross>
		    <img src="/images/close2.png" style="width:100%;">
            </div>
		</div>
		<div class="pre_top">
            <div class="pre_top_pf"><img src="/images/default_profile_img.png" class="pre_top_pf_img"></div>
            <div class="pre_title">친구</div>
          </div>
          
		<div class="sector">
<!--           ------------------------------------------------->
			<div class="sector_in">

<!--             <div class="pre_line"> -->
<!--                 <div class="pre_pf"><img src="images/b1.png" class="pre_pf_img"></div> -->
<!--                 <div class="pre_text"><b>yuri</b></div> -->
<!--                 <div class="pre_time"><img src="images/startMsg.png" class="pre_start"></div> -->
<!--             </div> -->
			
			</div>
<!--           ------------------------------------------------->
        <div id="footer">
        </div>
		</div>
    </div>
	
	
	<script>
	 
	$(document).ready(function(){

		// 열기
		$(".ac1").click(function(){
			$("div[id='view1']").fadeIn(0); 
			
			$.ajax({
 				url:"${pageContext.request.contextPath}/message/friendList.msg",
 				method: "post",
 				data: {},
 				dataType: "json"
 			}).done(function(resp){
 				$(".pre_top").children().remove();
 				$(".pre_top").append("<div class='pre_top_pf'><img src='/images/default_profile_img.png' class='pre_top_pf_img'></div>"
 		 	            +"<div class='pre_title'>친구</div>");
 				
 				$(".sector_in").children().remove();
 				// 친구 목록
 				if(resp.length < 1){
 					$(".sector_in").append("<div id='noFriendExist'>"
 				              +"<div id='searchTitle'><b>지금 새로운 친구를 만들어 보세요!</b></div>"
 				              +"<a href='${pageContext.request.contextPath}/feed/wholeFeed'>"
 				               +"<div id='noFriendInside'>"
 				               +"<div id='searchFriend1'><img src='/images/searchFriend.png' id='searchFriendImg'></div>"
 				               +"<div id='searchFriend2'>친구 찾으러 가기</div>"
 				               +"</div></a></div>");
 				}
 				
 				for(var i=0; i < resp.length; i++){
 					$(".sector_in").append("<div class='ppre_line'>"		// img src 안에다가 dto 꺼내듯이 쓰면 됨
 							+"<div class='pre_pf'><img src='"+resp[i].profile_img+"' class='pre_pf_img'></div>"
 			        		+"<div class='pre_text' id='"+resp[i].fr_id+"' value='"+resp[i].nickname+"' name='"+resp[i].profile_img+"'>"+resp[i].nickname+"</div>"
 			                +"<div class='pre_time'>"
 			                +"<img src='/images/startMsg2.png' class='pre_start' id='"+resp[i].fr_id+"' value='"+resp[i].nickname+"' name='"+resp[i].profile_img+"'>"
 			                +"</div></div>");
				}
 				
 				// 모달 띄우기
 				$(".pre_text").on("click", function(){
 					$('#toWhereModal').modal('show');
 					var friendId = $(this).attr('id');
 					var friendNick = $(this).attr('value');
 					var friendImg = $(this).attr('name');
 					console.log(friendId);
 					console.log(friendNick);
 					console.log(friendImg);
 					console.log("프로필 모달 가지고 왔어");
 					
//  					$(".modal-nickname").children().remove();
//  					$(".modal-nickname").append(friendNick);
					$(".modal-header-nickname").children().remove();
					$(".modal-header-nickname").append("<h5 class='modal-title modal-nickname' id='modal-nickname-title'>"+friendNick+"</h5>"
							+"<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
							+"<span aria-hidden='true'>&times;</span>"
							+"</button>");
					
 					$("#profileBigger").children().remove();
 					$("#profileBigger").append("<img src='"+friendImg+"' id='profileBiggerImg'>");
 					
 					
 					$("#toUserFeed").children().remove();
 					$("#toUserFeed").append("<div id='toUserFeed'>"
 			                +"<div class='imgContainer'>"
 			                +"<img src='/images/toUserFeed.png' id='toUserFeedImg'>"
 			                +"</div>"
 			                +"<b>피드 가기</b>"
 			            +"</div>");
 					
 					$(".userToWhere").children().remove();
 					$(".userToWhere").append("<div class='userToWhere'>"
 							+"<a href='${pageContext.request.contextPath}/feed/myFeed?email="+friendId+"'>"
 		 		            +"<div id='toUserFeed'>"
 		 		            +"<div class='imgContainer'>"
 		 		            +"<img src='/images/toUserFeed.png' id='toUserFeedImg'>"
 		 		            +"</div>"
 		 		            +"<b>피드 가기</b>"
 		 		            +"</div>"
 		 		            +"</a>"
 		 		            
 		 		            +"<a href='#'>"
 		 		            +"<div id='toUserMsg'>"
 		 		            +"<div class='imgContainer'>"
 		 		            +"<img src='/images/toUserMsg.png' id='toUserMsgImg'>"
 		 		            +"</div>"
 		 		            +"<b>메시지 보내기</b>"
 		 		            +"</div>"
 		 		            +"</a>"
 		 		            +"</div>");
 					
 					$("#toUserMsg").on("click",function(){
 						$("img[id='"+friendId+"']").click();
 						$('#toWhereModal').modal('hide');
 						
 					});
 					
 				});
 				
 				
 				$("#footer").children().remove();
 				$("#footer").append("<div class='toWhere ac1'><img src='/images/toFr_cl.png' id='toFrIcon'></div>"
 			            +"<div id='toBetween'></div>"
 			            +"<div class='toWhere toColl'><img src='/images/toMsg_un.png' id='toMsgIcon'></div>");
 				
 				// 메시지 상세 보기
 				$(".pre_start").on("click",function(){
 					var friendId = $(this).attr('id');
 					var friendNick = $(this).attr('value');
 					var friendImg = $(this).attr('name');
 					 $.ajax({
 						url: "${pageContext.request.contextPath}/message/messageView.msg",
 						method: "post",
 						data: {
 							to_id: friendId
 						},
 						dataType: "json"
 					 }).done(function(resp){
 						 $(".pre_top").children().remove();
 						 $(".pre_top").append("<div class='pre_back'><img src='/images/left4.png' class='pre_back_img'></div>"
 						            + "<div class='pre_top_pf'><img src='"+friendImg+"' class='pre_top_pf_img'></div>"
 						            + "<div class='pre_text'><span class='pre_text_name'>"+friendNick+"</span></div>");
 						 
 						 $(".sector_in").children().remove();
 						 $(".search").children().remove();
 						 for(var i=0; i < resp.length; i++){
 							 
 							 if(resp[i].from_id=="${loginInfo.email}"){
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
 			        	 $("#footer").append("<div id='footer_cont'>"
 			                    	+"<input type='text' id='inputtxt' placeholder='Type a message...'>"
 			               			+"<button id='sendfly'><img src='/images/send.png' id=sendup></button>"
 			            			+"</div>");
 			        	
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
 				$(".toColl").on("click",function(){
 					$.ajax({
 		 				url:"${pageContext.request.contextPath}/message/previewList.msg",
 		 				method: "post",
 		 				data: {
 		 					
 		 				},
 		 				dataType: "json"
 		 			}).done(function(resp){
 		 				$(".pre_top").children().remove();
 		 				$(".pre_top").append("<div class='pre_top_pf'><img src='/images/default_profile_img.png' class='pre_top_pf_img'></div>"
 		 		 	            +"<div class='pre_title'>채팅</div>");
 		 				
 		 				$(".sector_in").children().remove();
 		 				if(resp.length < 1){
 		 					$(".sector_in").append("<div id='noMessageExist'>진행 중인 대화가 없습니다.</div>");
 		 				}
 						 for(var i=0; i < resp.length; i++){
 							 
 							 // data 없음
 							 if(resp[i]==null){
 								$(".sector_in").append("<div class='pre_line_none'>"
	 									 +"<div class='pre_pf'><img src='/images/default_profile_img.png' class='pre_pf_img'></div>"
	 									 +"<div class='pre_text_p'><b>none</b><br>none</div>"
	 									 +"<span class='pre_time_p'>none</span>"
	 									 + "<span class='pre_new_p'>none</span>"
	 									 +"</div>");
 							 }
 							 // 안읽 있음
 							 else if(resp[i].unread_count>0){
								$(".sector_in").append("<div class='pre_line'>"
 										 +"<div class='pre_pf'><img src='"+resp[i].profile_img+"' class='pre_pf_img'></div>"
 										 +"<div class='pre_text_p' id='"+resp[i].email+"' value='"+resp[i].nickname+"' name='"+resp[i].profile_img+"'><b>"+resp[i].nickname+"</b><br>"+resp[i].contents+"</div>"
 										 +"<span class='pre_time_p'>"+resp[i].write_date+"</span>"
 										 + "<span class='pre_new_p'><span class='pre_new_inside'>"+resp[i].unread_count+"</span></span>"
 										 +"</div>");
 							 }// 안읽 없음
 							 else{
								$(".sector_in").append("<div class='pre_line'>"
 	 									 +"<div class='pre_pf'><img src='"+resp[i].profile_img+"' class='pre_pf_img'></div>"
 	 									 +"<div class='pre_text_p' id='"+resp[i].email+"' value='"+resp[i].nickname+"' name='"+resp[i].profile_img+"'><b>"+resp[i].nickname+"</b><br>"+resp[i].contents+"</div>"
 	 									 +"<span class='pre_time_p'>"+resp[i].write_date+"</span>"
 	 									 + "<span class='pre_new_p'></span>"
 	 									 +"</div>");
 							 }
 							 
 						}
 						$("#footer").children().remove();
 						$("#footer").append("<div class='userToWhere ac1'><img src='/images/toFr_un.png' id='toFrIcon'></div>"
 		 			            +"<div id='toBetween'></div>"
 		 			            +"<div class='userToWhere toColl'><img src='/images/toMsg_cl.png' id='toMsgIcon'></div>");
 						
 						$(".ac1").on("click",function(){
 							document.getElementById("ac1_1").click();
 						});
 						
 						// 미리 보기 클릭 후 상세 보기로 가기
 						$(".pre_text_p").on("click",function(){
 							var friendId = $(this).attr('id');
 							var friendNick = $(this).attr('value');
 							var friendImg = $(this).attr('name');
 							console.log(friendId)
 							
 							$.ajax({
		 						url: "${pageContext.request.contextPath}/message/messageView.msg",
		 						method: "post",
		 						data: {
		 							to_id: friendId
		 						},
		 						dataType: "json"
		 					 }).done(function(resp){
		 						 $(".pre_top").children().remove();
		 						$(".pre_top").append("<div class='pre_back'><img src='/images/left4.png' class='pre_back_img'></div>"
	 						            + "<div class='pre_top_pf'><img src='"+friendImg+"' class='pre_top_pf_img'></div>"
	 						            + "<div class='pre_text'><span class='pre_text_name'>"+friendNick+"</span></div>");
		 						 
		 						 $(".sector_in").children().remove();
		 						 $(".search").children().remove();
		 						 for(var i=0; i < resp.length; i++){
		 							 if(resp[i].from_id=='${loginInfo.email}'){
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
		 			        	 $("#footer").append("<div id='footer_cont'>"
	 			                    	+"<input type='text' id='inputtxt' placeholder='Type a message...'>"
	 			               			+"<button id='sendfly'><img src='/images/send.png' id=sendup></button>"
	 			            			+"</div>");
		 			        	
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
	
</body>
</html>