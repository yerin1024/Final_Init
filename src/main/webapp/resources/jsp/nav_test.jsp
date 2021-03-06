<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 	
<div class="navBar" >
        <div class="header">
        
        <button class="navbar-hbg" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-hbg-icon"><img src='/images/hbg.png'></span>
		  </button>
  
           <div class="inner">
            <div class="nav-left">
                <div class="logo">
					<a class="nav-link active" id="logoA"
						href="${pageContext.request.contextPath}/feed/getFriendFeed">i n ; t</a>
				</div>
            </div>
            
            <button class="navbar-hbg" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-hbg-icon"><img src='/images/hbg.png'></span>
			  </button>
            
            <div class="nav-center"></div>
        <div class="nav-right navbar-collapse" id="navbarSupportedContent">
        <ul class="nav justify-content-end bubblemenu navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link active" href="${pageContext.request.contextPath}/feed/wholeFeed" style="padding-top: 12px;"><img id="total_feed" src="/resources/images/friends.png"></a>
            </li>
            <li class="nav-item a_ac1_nav" id="a_ac1_1">
              <a class="nav-link gold" id="alarm_exist" style="padding-top: 15px;">
              <img id="notification" src="/resources/images/notification.png"></a>
            </li>
			
            <li class="nav-item ac1" id="ac1_1">
              <a class="nav-link gold" id="msg_exist" style="padding-top: 15px;">
              <img id="msg" src="/resources/images/msg.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/feed/myFeed" style="padding-top: 12px;"><img id="my_feed" src="/resources/images/user.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do" style="padding-top: 12px;"><img id="logout" src="/resources/images/logout.png"></a>
            </li>
          </ul>
            </div>
        </div>
        </div>
    </div>
<script>
$(function() {
     $(".header").mouseenter(function(){
    	 $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends.png", "/resources/images/friends2.png"));  
         $("#notification").attr("src", "/resources/images/notification2.png");  
         $("#msg").attr("src", "/resources/images/msg2.png");  
         $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user.png", "/resources/images/user2.png"));  
         $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout.png", "/resources/images/logout2.png"));
        $("#logoA").css("background-position","right center"); 
   	 	$("#logoA").css("color","#0f4c81");
     });
     $(".header").mouseleave(function(){
        $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends2.png", "/resources/images/friends.png"));  
        $("#notification").attr("src", "/resources/images/notification.png");  
        $("#msg").attr("src", "/resources/images/msg.png");  
        $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user2.png", "/resources/images/user.png"));  
        $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout2.png", "/resources/images/logout.png"));
        $("#logoA").css("background-position","right center"); 
        $("#logoA").css("color","white");
     });
    $("#total_feed").mouseenter(function(){
         $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends2.png", "/resources/images/friends3.png"));  
    });
     $("#total_feed").mouseleave(function(){
         $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends3.png", "/resources/images/friends2.png"));  
    });  
     $("#notification").mouseenter(function(){
         
         $.ajax({
				url:"${pageContext.request.contextPath}/alarm/isNewAlarm.al",
				method: "post",
				data: {},
				dataType: "json"
			}).done(function(resp){
				console.log(resp);
				$("#alarm_exist").attr("data-bubble",resp);
// 				 $("#a_ac1_1").children().remove();
// 		         $("#a_ac1_1").append("<a class='nav-link gold' id='alarm_exist' style='padding-top: 15px;' data-bubble='"+resp+"'>"
// 		         			+"<img id='notification' src='/resources/images/notification2.png'></a>");
		         $("#notification").attr("src", "/resources/images/notification3.png");  
		         $("#notification").mouseleave(function(){
		        	 $("#notification").attr("src", "/resources/images/notification2.png");
// 		             $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification3.png", "/resources/images/notification2.png"));
		        });
			}).fail(function(a,b,c){
				console.log(a); console.log(b); console.log(c);
			})
     
     });
     $("#notification").mouseleave(function(){
         $("#notification").attr("src","/resources/images/notification2.png");
    });
     $("#msg").mouseenter(function(){
         $("#msg").attr("src", "/resources/images/msg3.png");  
         
         $.ajax({
				url:"${pageContext.request.contextPath}/message/isNewMsg.msg",
				method: "post",
				data: {},
				dataType: "json"
			}).done(function(resp){
				console.log(resp);
// 				 $("#ac1_1").children().remove();
// 		         $("#ac1_1").append("<a class='nav-link gold' id='msg_exist' style='padding-top: 15px;' data-bubble='"+resp+"'>"
// 		         			+"<img id='msg' src='/resources/images/msg3.png'></a>");
				$("#msg_exist").attr("data-bubble", resp);
		         $("#msg").mouseleave(function(){
		             $("#msg").attr("src", "/resources/images/msg2.png");  
		        });
			}).fail(function(a,b,c){
				console.log(a); console.log(b); console.log(c);
			})
			
        });
     $("#msg").mouseleave(function(){
         $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg3.png", "/resources/images/msg2.png"));  
    });
    $("#my_feed").mouseenter(function(){
         $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user2.png", "/resources/images/user3.png"));  
    });
     $("#my_feed").mouseleave(function(){
         $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user3.png", "/resources/images/user2.png"));  
    }); 
    $("#logout").mouseenter(function(){
         $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout2.png", "/resources/images/logout3.png"));  
    });
     $("#logout").mouseleave(function(){
         $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout3.png", "/resources/images/logout2.png"));  
    });
});
     
     
     
    </script>