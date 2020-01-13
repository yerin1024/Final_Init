<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 	
<div class="container-fluid" >
        <div class="header">
           <div class="inner">
            <div class="nav-left">
                <div class="logo">i n ; t</div>
            </div>
            <div class="nav-center"></div>
        <div class="nav-right">
        <ul class="nav justify-content-end">
            <li class="nav-item">
              <a class="nav-link active" href="#" style="padding-top: 12px;"><img id="total_feed" src="/resources/images/friends.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="padding-top: 15px;"><img id="notification" src="/resources/images/notification.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="padding-top: 15px;"><img id="msg" src="/resources/images/msg.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="padding-top: 12px;"><img id="my_feed" src="/resources/images/user.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="padding-top: 12px;"><img id="logout" src="/resources/images/logout.png"></a>
            </li>
          </ul>
            </div>
        </div>
        </div>
    </div>
<script>
     $(".header").mouseenter(function(){
        $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends.png", "/resources/images/friends2.png"));  
        $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification.png", "/resources/images/notification2.png"));  
        $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg.png", "/resources/images/msg2.png"));  
        $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user.png", "/resources/images/user2.png"));  
        $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout.png", "/resources/images/logout2.png"));  
        $(".logo").css("color"," #1D4E89");
     });
     $(".header").mouseleave(function(){
        $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends2.png", "/resources/images/friends.png"));  
        $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification2.png", "/resources/images/notification.png"));  
        $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg2.png", "/resources/images/msg.png"));  
        $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user2.png", "/resources/images/user.png"));  
        $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout2.png", "/resources/images/logout.png")); 
        $(".logo").css("color"," #FFFFFF");
     });
    $("#total_feed").mouseenter(function(){
         $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends2.png", "/resources/images/friends3.png"));  
    });
     $("#total_feed").mouseleave(function(){
         $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends3.png", "/resources/images/friends2.png"));  
    });  
     $("#notification").mouseenter(function(){
         $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification2.png", "/resources/images/notification3.png"));  
        });
     $("#notification").mouseleave(function(){
         $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification3.png", "/resources/images/notification2.png"));  
    });
     $("#msg").mouseenter(function(){
         $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg2.png", "/resources/images/msg3.png"));  
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
    </script>