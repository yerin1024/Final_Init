<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/msg.css"> 
<link rel="stylesheet" href="/resources/css/alr.css"> 
<link rel="stylesheet" href="/resources/css/test.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
body{
	background-color:#171C28;
    color: white;
}
#wrapper {
   margin: auto;
   color:white;
}

html,body {
   padding: 0px;
   margin: 0px;
}

* {
   box-sizing: border-box;
}

.feed {
   border: 3px solid white;
   margin-bottom:30px;
}

.dz-default {
   border: 2px solid black;
}

.dz-preview {
   display: none;
}
/* 
#carouselExampleIndicators {
    width: 100%; 
} */

.carousel-inner {
   /* width: 720px;  */
   width: 100%;
   height:600px;
   overflow: hidden;
   }

.carousel-item {
   margin: auto;
   /* width: 720px; */
   width: 100%;
   text-align: center;
}

.carousel-item * {
   width: 99.5%;
   height:600px; 
}
.slide {
   width: 99.5%;
}

.btnss * {
   width: 100px;
   height: 100px;
}

.likeImg>img {
	width: 35px;
	height: 35px;
	margin-left: 10px;
}

.bookmarkImg>img {
	width: 35px;
	height: 35px;
	margin-left: 10px;
}

.row {
   margin: 0px;
}

.profileNickname {
   position: absolute;
   left: 80px;
   font-size:20px;
   font-weight:600;
}

.profile {
   justify-content: center;
   flex-direction: column;
   height: 50px;
   display: flex;
}

.profileImg {
   border: 1px solid black;
   border-radius: 75px;
   width: 50px;
   height: 50px;
}

.profileImg>img {
   width: 100%;
   height: 100%;
   border-radius: 75px;
   margin: 0px;
}

.contents, .profile {
   margin: 10px;
}

.profilefeedDeclaration {
   position: absolute;
   right: 20px;
}

.sirenImg {
   width: 27px;
   height: 28px;
}

.sirenBtn {
   border: none;
   background: none;
}

/* 댓글 */
.reply{	
    overflow: scroll;
    border-top: 1px solid white;
    border-bottom: 1px solid white;
    max-height: 300px;
}
.reply::-webkit-scrollbar {
        width: 0 !important
}
.myProfileImgBox,.userProfile{
	margin:10px 20px;
}
.myNickName,.userProfileID{	
    font-size: 20px;
    line-height: 70px;
}
.writeReply{
    background: transparent;
    font-size: 16px;
    margin: 12px 12px;
    width: 100%;
    height: 50px;
    border-radius: 16px;
    border: 1px solid rgb(239, 239, 239);
    padding: 10px 10px;
    overflow-y: scroll;
}

.writeReply::-webkit-scrollbar {
        width: 0 !important
}
.replyContents{	
    background: transparent;
    font-size: 16px;
    margin: 12px 12px;
    width: 95%;
    border-radius: 16px;
    border: 1px solid rgb(239, 239, 239);
    padding: 0px 10px;
    line-height: 48px;
}
.userProfileImg{
	width:50px;
	height:50px;
	border-radius: 160px;
    border: 1px solid black;
}
.writeReplyBox{
	display: flex;
    border-top: 1px solid black;
}
.replyBtn{	    
    border: 1px solid #999;
    background: transparent;
    font-size: 16px;
    width: 65px;
    border-radius: 11px;
    margin: 12px;
    color: #999;
}
.replyBtns{	
    margin: 10px 20px;
    text-align:right;
}
.profileDiv{
	display:flex;
}
.childReply{
    margin: 10px 50px;
}
.userReply{	
    display: inline-block;
    width: 100%;
}
.replyBtns>button:not(.showReply):not(.hideReply){	
    border: 1px solid #999;
    background: transparent;
    font-size: 16px;
    border-radius: 11px;
    color: #999;
}
.contentsBox{
	width:100%;
}
.showReply,.hideReply{
	display: block;
	width:100%;
    border: none;
    background: transparent;
    color:#999;
}
/* .modal {
          text-align: center;
        } */
/* @@media screen and (min-width: 768px) {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
          }
        } */
/* .modal-dialog {
     display: inline-block;
     text-align: left;
     vertical-align: middle;
} */

/* All Device */
/* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. */

/* Mobile Device */
/* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device */
@media all and (min-width:768px) {
   /*     사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
   #wrapper {
      width: 720px;
   }
 
   .media {
      max-width: 720px;
   } 
}

@media all and (max-width:500px) {
   /*     사용자 해상도가 768px 이하일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
   #wrapper {
      max-width: 720px;
   }
    .media {
      max-width: 720px;
   }
   .carousel-inner {
   max-width: 720px; 
   min-width:520px;
    max-height:720px;
   min-height:520px; 
   height: 600px; 
   overflow: hidden;
   }
   
   .carousel-item * {
   width: 100%;
   max-height:720px;
   min-height:520px; 
   } 
}

/* Tablet Device */
@media all and (min-width:500px) and (max-width:768px) {
   /*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
   #wrapper {
      max-width: 720px;
   }
    .media {
      max-width: 720px;
   }
   .carousel-inner {
   max-width: 720px; 
   min-width:520px;
   /* height:600px;  */
   max-height:720px;
   min-height:520px; 
   overflow: hidden;
   }
   
   .carousel-item * {
   /* width: 100%; */
   max-width: 720px; 
   min-width:520px;
   /* height:600px;  */
   max-height:720px;
   min-height:520px; 
   } 
}

/* Desktop Device */
@media all and (min-width:1025px) {
   /*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
   #wrapper {
      max-width: 720px;
   }
    .media {
      max-width: 720px;
   } 
}
</style>
<script>
   var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
   
   $(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
       if(page==1){ 
        page++;
       }else{
          getList(page);
          page++;
       }
   }); 
    
   $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
      console.log($(window).scrollTop());
      console.log($(document).height());
      console.log($(window).height());
      if($(window).scrollTop() >= $(document).height()-$(window).height()- 5 ){
         console.log("스크롤 감지");
         if(page==1){ 
              page++;
             }else{
                getList(page);
                page++;
             }
        } 
   });

   $(window).scroll(
         function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
            if ($(window).scrollTop() >= $(document).height()
                  - $(window).height()) {
               if (page == 1) {
                  page++;
               } else {
                  getList(page);
                  page++;
               }
            }
         });

   function getList(page) {
      $.ajax({
         type : 'POST',
         dataType : 'json',
         data : {
            "page" : page
               },
         url : "/feed/getFriendFeedAjax",
         dataType : "JSON"
            }).done(function(data) {
               if (data.result == 'false') {
                        console.log("false");
                        return 'false';
                     }

                     var list = JSON.parse(data.list);
                     console.log(list);
                     var mediaList = JSON.parse(data.mediaList);
                     var replyList = JSON.parse(data.replyList);
                     var likeCheckList = JSON.parse(data.likeCheckList);
                     var bookmarkCheckList = JSON.parse(data.bookmarkCheckList);
                     var profile_imgList = JSON.parse(data.profile_imgList);
                     var declareCheckList = JSON.parse(data.declareCheckList);
                     console.log(replyList[7] + "##");
                     for (var i = 0; i < list.length; i++) {
                         var feed = $("<div class='feed' feed_seq="+list[i].feed_seq+"></div>");
                         var profile = $("<div class='row profile'></div>");
                         var Img = $("<div class='row profileImg'></div>") 
                         Img.append(profile_imgList[i]); 
                         profile.append(Img);

                         var nick = $("<div class='row profileNickname'></div>");
                         nick.append(list[i].nickname);
                         profile.append(nick);
                         if(list[i].email != "${loginInfo.email}"){
                         var feedDeclaration = $("<div class='row profilefeedDeclaration'></div>");
                         feedDeclaration.attr("seq",list[i].feed_seq);
                         var afterDec = $("<img class='sirenImg' src='${pageContext.request.contextPath}/resources/images/siren2.png'>")
                         afterDec.attr("id","srI2_"+list[i].feed_seq);
                         var beforeDec = $("<button type='button' class='sirenBtn' role='btton' data-toggle='modal' data-target='#declareModal' data-backdrop='static'></button>");   
                         beforeDec.attr("seq",list[i].feed_seq);
                         beforeDec.attr("id","srB_"+list[i].feed_seq);
                         console.log("srB_"+list[i].feed_seq);
                         var beforeDecImg = $("<img class='sirenImg' src='${pageContext.request.contextPath}/resources/images/siren.png'>");
                         beforeDecImg.attr("id","srI_"+list[i].feed_seq);
                         console.log("srI_"+list[i].feed_seq);
                         beforeDec.append(beforeDecImg);
                         if(declareCheckList[i] == 1){
                            feedDeclaration.append(afterDec);    
                            profile.append(feedDeclaration); 
                         }else{
                            feedDeclaration.append(beforeDec);    
                            profile.append(feedDeclaration); 
                         }

                         }else{ }                         

                        feed.append(profile);
                        //ajax media가 있으면 carousel 없으면 바로 contents
                        if(mediaList[i].length != 0){
                        var media = $("<div class='row media'></div>");
                        var CEI = $("<div class='carousel slide' data-interval='false'></div>");
                        CEI.attr("id",'carouselExampleIndicators'+list[i].feed_seq);
                        media.append(CEI);
                        //ajax 사진이 두 장 이상일 경우 indicators와 control O 
                        if(mediaList[i].length >1){
                        var olCEI = $("<ol class='carousel-indicators'></ol>");
                        for (var m = 0; m < mediaList[i].length; m++) {
                           var liCEI = $("<li></li>");
                           liCEI.attr("data-target",'#carouselExampleIndicators'+list[i].feed_seq);
                           if (m == 0) {
                              liCEI.attr("data-slide-to", 0);
                              liCEI.addClass("active");
                           } else {
                              liCEI.attr("data-slide-to", m);
                           }
                           olCEI.append(liCEI);
                        }
                        CEI.append(olCEI);
                        }else{}
                        media.append(CEI);
                        var ci = $("<div class='carousel-inner' style='height:600px; overflow: hidden;'></div>");
                        for (var m = 0; m < mediaList[i].length; m++) {
                           var divCI = $("<div class='carousel-item'></div>");
                           if (m == 0) {
                              divCI.addClass("active");
                              var pic = $(mediaList[i][m]);
                              pic.attr("style",'height:600px;');
                              divCI.append(pic);
                           } else {
                              var pic = $(mediaList[i][m]);
                              pic.attr("style",'height:600px;');
                              divCI.append(pic);
                           }
                           ci.append(divCI)
                           CEI.append(ci);
                           media.append(CEI);
                        }
                        if(mediaList[i].length >1){
                        var prevC = $("<a class='carousel-control-prev' role='button' data-slide='prev'></a>");
                        prevC.attr("href",'#carouselExampleIndicators'+list[i].feed_seq);
                        prevC.append("<span class='carousel-control-prev-icon' aria-hidden='true'></span><span class='sr-only'>Previous</span>");
                        CEI.append(prevC);
                        var nextC = $("<a class='carousel-control-next' role='button' data-slide='next'></a>");
                        nextC.attr("href",'#carouselExampleIndicators'+list[i].feed_seq);
                        nextC.append("<span class='carousel-control-next-icon' aria-hidden='true'></span> <span class='sr-only'>Next</span>");
                        CEI.append(nextC);
                        media.append(CEI);
                        }else{}
                        feed.append(media);
                        }else{}
                        var contents = $("<div class='row contents' style='min-height:100px; max-height:400px;'></div>");
                        contents.append(list[i].contents);
                        feed.append(contents);


                        var btns = $("<div class='row btns'></div>");

                        if (likeCheckList[i] == 0) {
                           var imgBTNS = $("<img class='likeBtn' value='likeBefore' src='${pageContext.request.contextPath }/resources/images/likeBefore.png'>");
                           var spanBTNS = $("<span class='likeImg' ></span>");
                           imgBTNS.attr("seq", list[i].feed_seq);
                           spanBTNS.append(imgBTNS);
                           spanBTNS.attr("seq", list[i].feed_seq);

                           var aBTNS = $("<a href='#' class='like' onclick='return false'></a>");
                           aBTNS.attr("id", list[i].feed_seq);
                           aBTNS.append(spanBTNS);
                           btns.append(aBTNS);
                        } else {
                           var imgBTNS = $("<img class='likeBtn' value='likeAfter' src='${pageContext.request.contextPath }/resources/images/likeAfter.png'>");
                           var spanBTNS = $("<span class='likeImg'></span>");
                           imgBTNS.attr("seq", list[i].feed_seq);
                           spanBTNS.append(imgBTNS);
                           spanBTNS.attr("seq", list[i].feed_seq);

                           var aBTNS = $("<a href='#' class='like' onclick='return false'></a>");
                           aBTNS.attr("id", list[i].feed_seq);
                           aBTNS.append(spanBTNS);
                           btns.append(aBTNS);
                        }

                        if (bookmarkCheckList[i] == 0) {
                           var imgBTNS = $("<img class='bookmarkBtn' value='bookmarkBefore' src='${pageContext.request.contextPath }/resources/images/bookmarkBefore.png'>");
                           var spanBTNS = $("<span class='bookmarkImg' ></span>");
                           imgBTNS.attr("seq", list[i].feed_seq);
                           spanBTNS.append(imgBTNS);
                           spanBTNS.attr("seq", list[i].feed_seq);

                           var aBTNS = $("<a href='#' class='bookmark' onclick='return false'></a>");
                           aBTNS.attr("id", list[i].feed_seq);
                           aBTNS.append(spanBTNS);
                           btns.append(aBTNS);
                        } else {
                           var imgBTNS = $("<img class='bookmarkBtn' value='bookmarkAfter' src='${pageContext.request.contextPath }/resources/images/bookmarkAfter.png'>");
                           var spanBTNS = $("<span class='bookmarkImg' ></span>");
                           imgBTNS.attr("seq", list[i].feed_seq);
                           spanBTNS.append(imgBTNS);
                           spanBTNS.attr("seq", list[i].feed_seq);

                           var aBTNS = $("<a href='#' class='bookmark' onclick='return false'></a>");
                           aBTNS.attr("id", list[i].feed_seq);
                           aBTNS.append(spanBTNS);
                           btns.append(aBTNS);
                        }
                        feed.append(btns);
                        $("#wrapper").append(feed);

                        
                        var replyDiv = $("<div class='reply'></div>") 
                        feed.append(replyDiv);
                        
                        if(replyList[i].length != 0){
                        	
                            var replyhtml = "";          
                    		for(var z=0; z<replyList[i].length; z++){
                    			if(replyList[i][z].parent == 0){
                    				replyhtml += "<div class='parentReply' reply_seq='"+replyList[i][z].reply_seq+"'>"							
                    				replyhtml += "<div class='profileDiv'>"
                    				replyhtml += "<span class='userProfile'>"
                    				replyhtml += 		"<img class='userProfileImg' src="+replyList[i][z].profile_img+" alt=''>"
                    				replyhtml +=   "</span>"
                    				replyhtml +=         	"<span class='userProfileID'>"+replyList[i][z].nickname+"</span>"
                    				replyhtml +=          "<span class='userReply'>"
                                 	replyhtml +=       	  "<div class='replyContents'>"+replyList[i][z].contents+"</div>"
                                 	replyhtml +=       "</span>"
                                 	replyhtml +=        "</div>"	            
                                 	replyhtml +=        "<div class='replyBtns'>"
                                    if('${loginInfo.email}' == replyList[i][z].email){   
                                 	replyhtml +=  				"<button type='button' class='deleteReply'>삭제</button>"		
                                    }             	
                                 	replyhtml +=        		"<button type='button' class='registerChildBtn'>답글</button>"
                                    replyhtml += 				"<button type=\"button\" class=\"showReply\" style='display:none'>ㅡ답글보기</button>"
                                    replyhtml += 				"<button type=\"button\" class=\"hideReply\" style='display:none'>ㅡ답글숨기기</button>"
                                 	replyhtml +=       "</div>"	
                                 	replyhtml +=   "</div>";
                    		}
                    		}
                    		
                    		replyDiv.append(replyhtml);
                    		
                    		for(var z=0; z<replyList[i].length; z++){
                    			if(replyList[i].parent != 0){
                    				var childhtml = "";
                    				var currentSeq = replyList[i][z].parent;
                    				console.log(currentSeq +"시퀀스값??");
                    				childhtml +=       "<div class='childReply' value=1 style='display:none' reply_seq='"+replyList[i][z].reply_seq+"' parent_seq='"+replyList[i][z].parent+"'>"
                    				childhtml +=     		"<span class='userProfile'>"
                    				childhtml +=     			"<img class='userProfileImg' src="+replyList[i][z].profile_img+" alt='사진오류'>"
                    				childhtml +=      		"</span>"
                    				childhtml +=      		"<span class='userProfileID'>"+replyList[i][z].nickname+"</span>"
                    				childhtml +=      "<span class='userReply'>"
                    				childhtml +=      		"<div class='replyContents' contenteditable='false'>"+replyList[i][z].contents+"</div>"
                    		       	childhtml +=      "</span>"
                    		        childhtml +=      "<div class='replyBtns'>"
                    			    if('${loginInfo.email}' ==  replyList[i][z].email){
                               		childhtml +=      		"<button class='deleteChildReplyBtn'>삭제</button>"
                    		        }
                    	       		childhtml +=      "</div>"
                             		childhtml +=      "</div>";
                             		$(".parentReply[reply_seq="+currentSeq+"]").append(childhtml);
                    				if($(".parentReply[reply_seq="+currentSeq+"]").find(".childReply").length > 0){
                    					$(".parentReply[reply_seq="+currentSeq+"]").attr("child",1);
                    					$(".parentReply[reply_seq="+currentSeq+"]").find(".showReply").show();
                    				}
                    			}
                    		}
                        }
                        var writehtml = "";
                        writehtml += "<div class='writeReplyBox'>"
                        writehtml += "<span class='myProfileImgBox'><img class='userProfileImg' src='${loginInfo.profile_img}' alt=''></span>"
                        writehtml += "<div class='myNickName'>${loginInfo.nickname}</div>"
                        writehtml += "<div class='writeReply' id='writeReplyContents' contenteditable='true'></div>"
                        writehtml += 	"<button class='replyBtn' onclick=\"replyBtnOnclick('${loginInfo.email}','"+list[i].feed_seq+"','${loginInfo.nickname}',this);\">등록</button>"
                        writehtml += "</div>"
                        feed.append(writehtml);
                     };
                  })
   }
</script>
</head>
<body>
   <jsp:include page="/resources/jsp/nav.jsp" />
   <jsp:include page="/resources/jsp/msg.jsp" />
   <jsp:include page="/resources/jsp/alr.jsp" />
   <div id="wrapper" style="position: relative; top: 7px">
      <!-- <h1>친구피드</h1> -->
      <c:choose>
         <c:when test="${fn:length(list) <1}">
            <div>게시물이 없습니다.</div>
         </c:when>
         <c:otherwise>
            <c:forEach items="${list}" var="feed" varStatus="status">

               <div class="feed" feed_seq=${feed.feed_seq }>
                  <div class="row profile">
                     <div class="row profileImg">
                        ${profile_imgList[status.index]}</div>
                     <div class="row profileNickname">${feed.nickname}</div>

               <c:choose>
               <c:when test="${feed.email ne loginInfo.email}">
                     <div class="row profilefeedDeclaration" seq="${feed.feed_seq}">
                        <c:choose>
                           <c:when test="${declareCheckList[status.index] == 1}">
                              <img class="sirenImg" id="srI2_${feed.feed_seq}"
                                 src="${pageContext.request.contextPath }/resources/images/siren2.png">
                           </c:when>
                           <c:otherwise>
                              <button type="button" id="srB_${feed.feed_seq}" role="btton"
                                 seq="${feed.feed_seq}" class="sirenBtn" data-toggle="modal"
                                 data-target="#declareModal" data-backdrop="static">
                                 <img class="sirenImg" id="srI_${feed.feed_seq}"
                                    src="${pageContext.request.contextPath }/resources/images/siren.png">
                              </button>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </c:when>
                  </c:choose>   
                  </div>
               <c:choose>
               <c:when test="${mediaList[status.index].size() != 0}">
               <div class="row media">
                  <div id="carouselExampleIndicators${feed.feed_seq }" class="carousel slide" data-interval="false">
                  <c:choose>
                  <c:when test="${mediaList[status.index].size() > 1}">
                        <ol class="carousel-indicators">
                           <c:forEach items="${mediaList[status.index] }" var="media" varStatus="status1">
                              <c:if test="${status1.index ==0}">
                                 <li data-target="#carouselExampleIndicators${feed.feed_seq }" data-slide-to="0"
                                    class="active"></li>
                              </c:if>
                              <c:if test="${status1.index !=0}">
                                 <li data-target="#carouselExampleIndicators${feed.feed_seq }"
                                    data-slide-to="${status1.index }"></li>
                              </c:if>
                           </c:forEach>
                        </ol>
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
                  </c:choose>
                        <div class="carousel-inner">
                        <c:forEach items="${mediaList[status.index] }" var="media" varStatus="status1">
                           <c:if test="${status1.index ==0}">
                              <div class="carousel-item active">${media}</div>
                           </c:if>
                           <c:if test="${status1.index !=0}">
                              <div class="carousel-item">${media }</div>
                           </c:if>
                        </c:forEach>
                        </div>
                     <c:choose>
                     <c:when test="${mediaList[status.index].size() > 1}">
                        <a class="carousel-control-prev"
                           href="#carouselExampleIndicators${feed.feed_seq}" role="button" data-slide="prev"> 
                           <span class="carousel-control-prev-icon"
                           aria-hidden="true"></span> 
                           <span class="sr-only">Previous</span>
                        </a> 
                        <a class="carousel-control-next"
                           href="#carouselExampleIndicators${feed.feed_seq}" role="button"
                           data-slide="next"> <span class="carousel-control-next-icon"
                           aria-hidden="true"></span> <span class="sr-only">Next</span>
                        </a>
                     </c:when>
                     <c:otherwise>
                     </c:otherwise>
                     </c:choose>
                  </div>
               </div>
               </c:when>   
               <c:when test="${mediaList[status.index].size() == 0}"></c:when>
               </c:choose>
                  <div class="row contents" style="min-height: 100px; max-height: 400px;">
                     ${feed.contents }</div>

                     <div class="reply">
							<c:forEach items="${replyList[status.index] }" var="reply">								
								<c:if test="${reply.parent == 0}">							
								<div class="parentReply" reply_seq="${reply.reply_seq }" >
									<div class="profileDiv">
										<span class="userProfile"> 
										<img class="userProfileImg"	src="${reply.profile_img}" alt=""></span> 
										<span class="userProfileID">${reply.nickname }</span> 
										<span class="userReply">
											<div class="replyContents" contenteditable="false">${reply.contents }</div>
										</span>
									</div>
									<div class="replyBtns">
									<c:if test="${loginInfo.email eq reply.email}">
										<button type="button" class="deleteReply" style="">삭제</button>
									</c:if>
										<button type="button" class="registerChildBtn" style="">답글</button>
										<button type="button" class="showReply" style="display: none">──────────────  답글보기</button>
										<button type="button" class="hideReply" style="display: none">────────────── 답글숨기기</button>
									</div>
									<c:forEach items="${replyList[status.index] }" var="childReply">	
										<c:if test="${childReply.parent == reply.reply_seq}">											
											<div class="childReply" value="1" parent_seq="${childReply.parent }" reply_seq="${childReply.reply_seq }" style="display:none">
												<span class="userProfile"> 
												<img class="userProfileImg"src="${reply.profile_img}" alt="사진오류"></span> 
													<span class="userProfileID">${childReply.nickname }</span> 
													<span class="userReply contentsBox"><div class="replyContents" contenteditable="false">${childReply.contents }</div>
												</span>
												<div class="replyBtns">
													<button class="registerChildReply" style="display: none;">등록</button>
													<button class="childReplyCancel" style="display: none;">취소</button>													
													<c:if test="${loginInfo.email eq reply.email}">
													<button class="deleteChildReplyBtn">삭제</button>
													</c:if>
												</div>
											</div>
											<script>	
												$("div[parent_seq=${childReply.parent }]").parent().attr("child",1); 
												if($("div[parent_seq=${childReply.parent }]").parent().attr("child") == 1){
													$("div[parent_seq=${childReply.parent }]").parent().find(".showReply").show();
													$("div[parent_seq=${childReply.parent }]").parent().siblings(".allReply").show();
												}
											</script>
										</c:if>		
									</c:forEach>									
								</div>
								
								</c:if>								
							</c:forEach>				
						</div>
						
						<div class="writeReplyBox">
							<span class="myProfileImgBox"><img class="userProfileImg"
								src="${loginInfo.profile_img }" alt=""></span>
							<div class="myNickName">${loginInfo.nickname }</div>
							<div class="writeReply" id="writeReplyContents" contenteditable="true"></div>
							<button class="replyBtn" onclick="replyBtnOnclick('${loginInfo.email}','${feed.feed_seq }','${loginInfo.nickname }',this);">등록</button>
						</div>                 
                  
                  <c:choose>
                  <c:when test="${feed.email ne loginInfo.email}">
                  <div class="row btns" style="">
                     <c:choose>
                        <c:when test="${likeCheckList[status.index]==0 }">
                           <a href="#" id="${feed.feed_seq }" class="like"
                              onclick="return false"> <span class="likeImg"
                              seq="${feed.feed_seq }"><img class="likeBtn"
                                 seq="${feed.feed_seq }" value="likeBefore"
                                 src="${pageContext.request.contextPath }/resources/images/likeBefore.png"></span>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a href="#" id="${feed.feed_seq }" class="like"
                              onclick="return false"> <span class="likeImg"
                              seq="${feed.feed_seq }"><img class="likeBtn"
                                 seq="${feed.feed_seq }" value="likeAfter"
                                 src="${pageContext.request.contextPath }/resources/images/likeAfter.png"></span>
                           </a>
                        </c:otherwise>
                     </c:choose>

                     <c:choose>
                        <c:when test="${bookmarkCheckList[status.index]==0 }">
                           <a href="#" id="${feed.feed_seq }" class="bookmark"
                              onclick="return false"> <span class="bookmarkImg"
                              seq="${feed.feed_seq }"><img class="bookmarkBtn"
                                 seq="${feed.feed_seq }" value="bookmarkBefore"
                                 src="${pageContext.request.contextPath }/resources/images/bookmarkBefore.png"></span>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a href="#" id="${feed.feed_seq }" class="bookmark"
                              onclick="return false"> <span class="bookmarkImg"
                              seq="${feed.feed_seq }"><img class="bookmarkBtn"
                                 seq=" ${feed.feed_seq }" value="bookmarkAfter"
                                 src="${pageContext.request.contextPath }/resources/images/bookmarkAfter.png"></span>
                           </a>
                        </c:otherwise>
                     </c:choose>
                  </div>
                  </c:when>
                  </c:choose>
                  
               </div>


               <!--  신고확인 기능 모달-->
               <div class="modal fade" id="declareModal" role="dialog"
                  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h3 class="modal-title" id="exampleModalCenterTitle">신고알림창</h3>
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
                           <div class="form-group">
                              <div class="declareQ">정말로 신고하시겠습니까?</div>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" id="declareCheck" role="button"
                              class="btn btn-primary" data-toggle="modal"
                              data-target="#declareReasonModal" data-backdrop="static"
                              seq="${feed.feed_seq}">네</button>
                           <button type="button" class="btn btn-secondary"
                              data-dismiss="modal">아니오</button>
                        </div>
                     </div>
                  </div>
               </div>

               <!--  신고사유 기능 모달-->
               <div class="modal fade" id="declareReasonModal" role="dialog"
                  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h3 class="modal-title" id="exampleModalCenterTitle">신고사유</h3>
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
                           <div class="form-group">
                              <div class="declareR">
                                 <input type="radio" name=declare_reason
                                    value="권리침해 및 왕따/약자에 대한 사이버 괴롭힘">권리침해 및 왕따/약자에 대한
                                 사이버 괴롭힘 <br> <input type="radio" name=declare_reason
                                    value="명의 도용">명의 도용<br> <input type="radio"
                                    name=declare_reason value="폭력적 위협">폭력적 위협<br> <input
                                    type="radio" name=declare_reason value="아동 학대">아동 학대<br>
                                 <input type="radio" name=declare_reason
                                    value="보호집단에 대한 증오심 표현">보호집단에 대한 증오심 표현<br> <input
                                    type="radio" name=declare_reason value="스팸 및 사기">스팸
                                 및 사기<br> <input type="radio" name=declare_reason
                                    value="사생활 침해">사생활 침해<br> <input type="radio"
                                    name=declare_reason value="해당사항 없음">해당사항 없음<br>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="declareN">※ 반복적으로 신고가 들어올 경우 계정 해지 조치가 취해질 수
                                 있습니다.</div>
                           </div>
                        </div>
                        <%--                 id="dr_${feed.feed_seq}" --%>
                        <div class="modal-footer">
                           <button type="button" role="button"
                              class="btn btn-danger declareReason" id="dr">신고</button>
                           <button type="button" class="btn btn-secondary" id="cancelBtn"
                              data-dismiss="modal">취소</button>
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </c:otherwise>
      </c:choose>
   </div>

   <script>
   //신고확인 기능 모달
   $(document).on("click",".sirenBtn",function(){
        var seq = $(this).attr("id");
       seq = $("#dr").val(seq);
       console.log(seq);
      $("#declareModal").modal('show');
      $(".profileDisplay").html(seq);
   }) 
   //신고사유 기능 모달
   $("#declareCheck").on("click", function(){
      $("#declareModal").modal('hide');
      $("#declareReasonModal").modal('show');
   })
   
   //사유데이터 처리
   $(".declareReason").on("click", function(){
       var seq = $("#dr").val();
      var reason = $("input:radio[name=declare_reason]:checked").val();
       console.log(seq);
       console.log(reason);
         $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/declareReasonProc.do",
            data : {
               dr_seq : seq,
               declare_reason : reason
            }
         }).done(function(resp){
            if(resp = 'declare'){
               console.log(seq);
               $("#"+seq).html("<img class=\"sirenImg\" seq=\""+seq+"\" src=\"${pageContext.request.contextPath }/resources/images/siren2.png\">");
               $("#declareReasonModal").modal('hide');
            }
         })    
      })
   
      $(document).on("click",".like",function() {
         var seq = $(this).attr("id");
         var likeCheck = $(".likeBtn[seq=" + seq + "]").attr("value");
            console.log(seq);
            console.log(likeCheck);
         if (likeCheck == "likeBefore") { //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
            $.ajax({
               type : "POST",
               url : "/feed/insertLike",
               data : {
                  feed_seq : seq
                     }
                  }).done(function() {
               $(".likeImg[seq="+ seq + "]").html("<img class=\"likeBtn\" seq=\""+seq+"\" value=\"likeAfter\" src=\"${pageContext.request.contextPath }/resources/images/likeAfter.png\">");
                  })
         } else {
            $.ajax({
               type : "POST",
               url : "/feed/deleteLike",
               data : {
                  feed_seq : seq
                     }
                  }).done(function() {
               $(".likeImg[seq="+ seq + "]").html("<img class=\"likeBtn\" seq=\""+seq+"\" value=\"likeBefore\" src=\"${pageContext.request.contextPath }/resources/images/likeBefore.png\">");
               })
               }
         })

      $(document).on("click",".bookmark",function() {
         var seq = $(this).attr("id");
         var bookmarkCheck = $(".bookmarkBtn[seq=" + seq + "]").attr("value");
         if (bookmarkCheck == "bookmarkBefore") { //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
            $.ajax({
               type : "POST",
               url : "/feed/insertBookmark",
               data : {
               feed_seq : seq
                     }
                  }).done(function() {
               $(".bookmarkImg[seq="+ seq + "]").html("<img class=\"bookmarkBtn\" seq=\""+seq+"\"  value=\"bookmarkAfter\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkAfter.png\">");
               })
            } else {
               $.ajax({
                  type : "POST",
                  url : "/feed/deleteBookmark",
                  data : {
                  feed_seq : seq
                  }
               }).done(function() {
                  $(".bookmarkImg[seq="+ seq + "]").html("<img class=\"bookmarkBtn\" seq=\""+seq+"\"  value=\"bookmarkBefore\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkBefore.png\">");
                  })
                  }
            })
            
            //댓글 스크립트
        
		function replyBtnOnclick(email,feed_seq,nickname,my) {
  			var writeReply = $(my).siblings(".writeReply");
			var contentsHtml = $(my).siblings(".writeReply").html();
			var contents = contentsHtml.replace(/(<div>|<\/div>|<br>)/g, '\r\n');
			if(contents == ""){ //컨텐츠가 null 값일 경우 등록 동작
				return false;
			}else if(contents.length>100){
	            alert("댓글은 100글자 이하로 작성해주세요");
	            return;
	         }
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data : {
					feed_seq : feed_seq,
					contents : contents,
					email : email
				},
				dataType : "json"
				}).done(function(data) {
					console.log(data);
					var parentReply = "";
					parentReply += "<div class=\"parentReply\" reply_seq="+data.reply_seq+">"
					parentReply += "<div class=\"profileDiv\"><span class=\"userProfile\"><img class=\"userProfileImg\" src=\"${loginInfo.profile_img }\" alt=\"\"></span><span class=\"userProfileID\">"+nickname+"</span><span class=\"userReply\"><div class=\"replyContents\">"+data.contents+"</div></span></div>"
					parentReply += "<div class=\"replyBtns\">"
					parentReply += "<button type=\"button\" class=\"deleteReply\">삭제</button>"
					parentReply += "<button type=\"button\" class=\"registerChildBtn\">답글</button>"
					parentReply += "<button type=\"button\" class=\"showReply\" style='display:none'>────────────── 답글보기</button>"
					parentReply += "<button type=\"button\" class=\"hideReply\" style='display:none'>────────────── 답글숨기기</button>"	
					parentReply += "</div>"		
					parentReply += "</div>"
					$(my).closest(".feed").find(".reply").append(parentReply);
					writeReply.html("");
			}).fail(function(a, b, c) {
				console.log(a);
				console.log(b);
				console.log(c);
			})
		}
		
		//댓글 삭제 버튼
		$(document).on("click",".deleteReply", function(){
			var reply_seq = $(this).closest(".parentReply").attr("reply_seq");
			console.log(reply_seq);
			var deleteDiv = $(this).closest(".parentReply");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/deleteReply",
				data : {reply_seq:reply_seq}				
			}).done(function(resp) {
				console.log(resp + "행 댓글이 지워짐!");
				deleteDiv.remove();
			}).fail(function(){
				alert("yes!");
			})
		});

		
		
		
		//답글버튼 눌렀을 때 이벤트
		$(document).on("click",".registerChildBtn", function(){
			$(".childReply[value=0]").remove();
			var parentReply = $(this).closest(".parentReply");
			var reply_seq = $(this).closest(".parentReply").attr("reply_seq");
			var childhtml = "";
			childhtml +=       "<div class='childReply' value='0' parent_seq='"+reply_seq+"'>"
			childhtml +=     		"<span class='userProfile'>"
			childhtml +=     			"<img class='userProfileImg' src=${loginInfo.profile_img } alt='사진오류'>"
			childhtml +=      		"</span>"
			childhtml +=      		"<span class='userProfileID'>${loginInfo.nickname }</span>"
			childhtml +=      "<span class='userReply'>"
			childhtml +=      		"<div class='replyContents' contenteditable='true'></div>"
	       	childhtml +=      "</span>"
	        childhtml +=      "<div class='replyBtns'>"
	        childhtml +=      		"<button class='registerChildReply'>등록</button>"
		  	childhtml +=      		"<button class='childReplyCancel'>취소</button>"
       		childhtml +=      		"<button class='deleteChildReplyBtn' style='display:none'>삭제</button>"
       		childhtml +=      "</div>"
     		childhtml +=      "</div>";
			if(parentReply.find(".childReply").length == 0){
				parentReply.find(".showReply").hide();
				parentReply.find(".hideReply").hide();
			}
     		$(this).closest(".parentReply").append(childhtml);
			$(this).closest(".parentReply").find(".replyContents").focus();
		});
		
		
		//답글보이기
		$(document).on("click",".showReply", function(){
			var parentReply = $(this).closest(".parentReply");
			$(this).parent(".replyBtns").children(".hideReply").show();	
			$(this).parent(".replyBtns").children(".showReply").hide();
			$(this).closest(".parentReply").find(".childReply").show();
			
			if(parentReply.find(".childReply").length == 0){
				parentReply.find(".showReply").hide();
				parentReply.find(".hideReply").hide();
			}	
		});

		//답글숨기기
		$(document).on("click",".hideReply", function(){
			$(".childReply[value=0]").remove();
			$(this).parent(".replyBtns").children(".showReply").show();	
			$(this).parent(".replyBtns").children(".hideReply").hide();
			$(this).closest(".parentReply").find(".childReply").hide();
			var parentReply = $(this).closest(".parentReply");
			
			if(parentReply.find(".childReply").length == 0){
				parentReply.find(".showReply").hide();
				parentReply.find(".hideReply").hide();
			}	
		});
		
		//답글등록버튼
		$(document).on("click",".registerChildReply", function(){
			var feed_seq = $(this).closest(".feed").attr("feed_seq"); //게시글의 번호
			console.log(feed_seq);
			var reply_seq = $(this).closest(".parentReply").attr("reply_seq"); //부모댓글의 번호
			var replyWriter = $(this).closest(".childReply").siblings(".profileDiv").find(".userProfileID").html(); //부모댓글의 닉네임
			var childReplyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents").html(); // 댓글 콘텐츠
			var replyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var childReply = $(this).closest(".childReply");
			
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data : {feed_seq:feed_seq,email:'${loginInfo.email}',contents:childReplyContents,depth:1,parent:reply_seq},
				dataType:"json"		
			}).done(function(resp) {				
				childReply.attr("reply_seq",resp.reply_seq); //자식댓글의 번호넣기
				$(".parentReply[reply_seq="+resp.parent+"]").attr("child",1); // 대댓글이 생기면 child = 1 을 넣어줌
				childReply.attr("parent_seq",resp.parent); //자식댓글의 부모번호 넣기	
				childReply.attr("value",1); //자식댓글의 번호넣기
				replyContents.attr("contentEditable","false");
			}).fail(function(){
				console.log("실패!");
			});
			$(this).parent(".replyBtns").children(".registerChildReply").hide();	
			$(this).parent(".replyBtns").children(".childReplyCancel").hide();
			$(this).parent(".replyBtns").children(".deleteChildReplyBtn").show();
			console.log($(this).closest(".parentReply").find(".showReply").attr("style") + ">>>????");
			if($(this).closest(".parentReply").find(".showReply").attr("style") == ""){
				$(this).closest(".parentReply").find(".hideReply").hide();
				$(this).closest(".parentReply").find(".showReply").show();
				console.log("YESS!!");
			}else{
				$(this).closest(".parentReply").find(".hideReply").show();
				$(this).closest(".parentReply").find(".showReply").hide();
				
			}
		});
		//답글삭제버튼
		$(document).on("click",".deleteChildReplyBtn", function(){
			var reply_seq = $(this).closest(".childReply").attr("reply_seq");
			var deleteDiv = $(this).closest(".childReply");
			var parentReply = $(this).closest(".parentReply");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/deleteReply",
				data : {reply_seq:reply_seq}				
			}).done(function(resp) {
				deleteDiv.remove();
// 				if(parentReply.find(".childReply").length <= 1){
// 					$(this).closest(".parentReply").attr("child",0);
// 				}
				console.log(parentReply.find(".childReply").length +"답글삭제?????");
				if(parentReply.find(".childReply").length == 0){
					parentReply.attr("child",0);
					parentReply.find(".showReply").hide();
					parentReply.find(".hideReply").hide();
				}		
			}).fail(function(){
				alert("yes!");
			})
				
		});
		//답글을 취소했을 때
		$(document).on("click",".childReplyCancel", function() {
			var parentReply = $(this).closest(".parentReply");
			$(this).closest(".childReply").remove();
			console.log(parentReply.find(".childReply").length +"?????");
			if(parentReply.find(".childReply").length == 0){
				parentReply.find(".showReply").hide();
				parentReply.find(".hideReply").hide();
			}	
		})

   </script>
</body>
</html>