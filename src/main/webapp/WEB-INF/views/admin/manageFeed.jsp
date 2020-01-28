<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Feed</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/detailModal.css"> 

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
.dBtn {
   box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
   border-radius: 5px 5px 5px 5px;
}

#searchDiv {
   text-align: right;
}
</style>
</head>
<body>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px;">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="width:99.9%;">
	         <span class="writerProfile"><img class="userProfileImg" src="${loginInfo.profile_img }" alt=""></span>
	        <h5 class="modal-title" id="exampleModalLabel">DETAIL VIEW</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		<div class="modal-main">			
	      	<div class="modal-body1">
	      	</div>
            <div class="title">
                <div class="reply">
               		<div class="writerInfo">
                    		<span class="writerProfile"><img class="userProfileImg" src="${loginInfo.profile_img }" alt=""></span>
                     		<span class="writerProfileID">asdsadas</span>
                    </div>                     
                </div>
            </div>
        </div>        
	      <%-- <div class="detailView_footer">
	      	<div class="footer-btns" style="display:flex;width:50%;height:10%;"></div>
	      	<div class="writeReplyBox">					
	         	<span class="myProfile"><img class="userProfileImg" src="${loginInfo.profile_img }" alt=""></span>
	       		<h5 class="modal-title" id="exampleModalLabel">${loginInfo.nickname }</h5>
	       		<div id="writeReply" contenteditable="true"></div>
	       		<button type="button" class="replyBtn" onclick="replyBtnOnclick('${loginInfo.email}');">등록</button>
			</div>
	      </div> --%>
	    </div>
	  </div>
	  </div>
   <div class="container mt-5">
      <div class="row">
         <div class="col-md-2 col-sm-12">
            <div class="panel panel-info">
               <div class="panel-heading">
                  <h3 class="panel-title">Menu</h3>
               </div>
               <!-- 사이드바 메뉴목록1 -->
               <ul class="list-group">
               		<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/memberList.do">멤버관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/blackList.do">블랙리스트관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/totalFeedList.do">피드관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/declarationList.do">신고관리</a></li>
               </ul>
            </div>
         </div>
         <div class="col-md-10 col-sm-12">
            <div class="row">
               <div class="col">
                  <h3>피드 관리</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12" id="searchDiv">
                  <form
                     action="${pageContext.request.contextPath}/admin/searchForFeed.do"
                     method="post" id="searchF">
                     <select id="searchTag" name="searchTag">
                        <option value="nickname">닉네임</option>
                        <option value="name">이름</option>
                        <option value="title">제목</option>
                     </select> <input type="text" id="search" name="search">
                     <button type="submit" id="searchBtn" class="btn-secondary">검색</button>
                  </form>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12">
                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <th>feed_seq</th>
                           <th>email</th>
                           <th>nickname</th>
                           <th>title</th>
                           <th>delete</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${feedList}" var="fdto">
                           <tr class="${fdto.email}">
                              <td><a data-toggle="modal" data-target="#exampleModal" href="#" data-id="${fdto.feed_seq }">${fdto.feed_seq}</a></td>
                              <td>${fdto.email}</td>
                              <td>${fdto.nickname}</td>
                              <td>${fdto.title}</td>
                              <td><button type="button" class="dBtn btn-dark"
                                    id="${fdto.feed_seq}">삭제</button></td>
                           </tr>
                        </c:forEach>
                        <tr align=center>
                           <td colspan=5>${pageNavi}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script>
      $(".dBtn").on("click",function() {
         var feed = $(this).attr("id");
         $.ajax({
            url : "${pageContext.request.contextPath}/admin/deleteFeedProc.do",
            type : "post",
            data : {
            feed : feed
            }
         }).done(function(resp) {
               if (resp == feed) {
               alert("게시물이 삭제되었습니다.");
               location.reload();
               } else {
               alert("게시물 삭제에 실패하셨습니다.");
               location.reload();
               }
         }).fail(function(a, b, c) {
               console.log(a);
               console.log(b);
               console.log(c);
         });
      });
      


      $('#exampleModal').on('shown.bs.modal', function (event) {
      	var seq = $(event.relatedTarget).data('id');
      	var feed_seq = $("#exampleModal").attr("feed_seq",seq);
      	$.ajax({
      		type:"post",
      		url:"/feed/detailView",
      		data:{
      			feed_seqS:seq
      		},
      		dataType:"json"
      	}).done(function(data){
      		$(".reply").children().remove(); // 클릭할때마다 다른 게시글에 댓글지우기 
      		var writerProfile = JSON.parse(data.writerProfile);
      		var writer = JSON.parse(data.writer);
      		var likeCheck = data.likeCheck;
      		var bookmarkCheck = data.bookmarkCheck;
      		var mediaList = JSON.parse(data.media);
      		var replyList = JSON.parse(data.replyList);
      		var dto = JSON.parse(data.dto);
      		console.log(dto.contents);
      		
      		console.log("writer : "  + writer);
      		console.log("writerImg : " + writerProfile);
      		
      		$(".writer").html(writer);
      		$(".userProfileImg").attr("src", writerProfile);
      		//디테일뷰 미디어
      		if(mediaList.length>1){ //미디어가 존재하므로 캐러셀 만들어줌
      			console.log("캐러셀 시작");
      			var mediaRow = $("<div class='row media'></div>");
      			var cei = $("<div id='carouselExampleIndicators' class='carousel slide' data-interval='false'></div>");
      			var ol = $("<ol class='carousel-indicators'></ol>");
      			for(var i=0; i<mediaList.length; i++){
      				if(i==0){
      					ol.append("<li data-target='#carouselExampleIndicators' data-slide-to='0' class='active'></li>");
      				}else{
      					ol.append("<li data-target='#carouselExampleIndicators' data-slide-to='"+i+"'></li>");
      				}
      			}
      			cei.append(ol);
      			
      			var cInner = $("<div class='carousel-inner'></div>");
      			for(var i=0; i<mediaList.length; i++){
      				if(i==0){
      					var cItem = $("<div class='carousel-item active'>"+mediaList[i]+"</div>");
      				}else{
      					var cItem = $("<div class='carousel-item'>"+mediaList[i]+"</div>");
      				}
      				cInner.append(cItem);
      			}
      			var prevA = $("<a class='carousel-control-prev' href='#carouselExampleIndicators' role='button' data-slide='prev'></a>");
      			prevA.append("<span class='carousel-control-prev-icon' aria-hidden='true'></span>");
      			prevA.append("<span class='sr-only'>Previous</span>");
      			var nextA = $("<a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'></a>");
      			nextA.append("<span class='carousel-control-next-icon' aria-hidden='true'></span>");
      			nextA.append("<span class='sr-only'>Next</span>");
      			cInner.append(prevA);
      			cInner.append(nextA);
      			cei.append(cInner);
      			mediaRow.append(cei);				
      			
      		}else if(mediaList.length==1){
      			var mediaRow = $("<div class='row media'>"+mediaList[0]+"</div>");
      		}else{
      			var mediaRow = $("<div class='media' style='height:100%;width:100%;size:20px;text-align:center;vertical-align:center'></div>");
      			mediaRow.append(dto.contents);
      		}
      		$(".modal-body1").html(mediaRow);
      		
      		
      		var replyhtml = "";
      		for(var i=0; i<replyList.length; i++){
      			if(replyList[i].parent == 0){
      				replyhtml += "<div class='parentReply' reply_seq='"+replyList[i].reply_seq+"'>"							
      				replyhtml += "<div class='profileDiv'>"
      				replyhtml += "<span class='userProfile'>"
      				replyhtml += 		"<img class='userProfileImg' src="+writerProfile+" alt=''>"
      				replyhtml +=   "</span>"
      				replyhtml +=         	"<span class='userProfileID'>${loginInfo.nickname }</span>"
      				replyhtml +=          "<span class='userReply'>"
                   	replyhtml +=       	  "<div class='replyContents'>"+replyList[i].contents+"</div>"
                   	replyhtml +=       "</span>"
                   	replyhtml +=        "</div>"	            
                   	replyhtml +=        "<div class='replyBtns'>"
                      if('${loginInfo.email}' == dto.email){   
                   	replyhtml +=        		"<button type='button' class='modifyReply'>수정</button>"
                   	replyhtml +=  				"<button type='button' class='deleteReply'>삭제</button>"		
                      replyhtml +=        		"<button type='button' class='modifyReplySuccess' style='display:none'>완료</button>"
                      replyhtml +=  				"<button type='button' class='modifyReplyCancel' style='display:none'>취소</button>"
                      }             	
                   	replyhtml +=        		"<button type='button' class='registerChildBtn'>답글</button>"
                      replyhtml += 				"<button type=\"button\" class=\"showReply\" style='display:none'>ㅡ답글보기</button>"
                      replyhtml += 				"<button type=\"button\" class=\"hideReply\" style='display:none'>ㅡ답글숨기기</button>"
                   	replyhtml +=       "</div>"	
                   	replyhtml +=   "</div>";
      			}
      		}

      		
      		if(mediaList.length>0){
      			var dtoContents = $("<div class='dtoContents' style='display:inline-block;border:2px solid #ebebeb;border-radius:15px;margin-bottom:20px;min-height:100px;width: 100%;padding-left: 10px;padding-top: 10px;padding-right: 10px;word-break: break-all;'></div>");
      			dtoContents.append(dto.contents);
      			$(".reply").append(dtoContents);
      			
      		}
      		$(".reply").append(replyhtml);

      		for(var i=0; i<replyList.length; i++){
      			if(replyList[i].parent != 0){
      				var childhtml = "";
      				var currentSeq = replyList[i].parent;
      				childhtml +=       "<div class='childReply' value=1 style='display:none' reply_seq='"+replyList[i].reply_seq+"' parent_seq='"+replyList[i].parent+"'>"
      				childhtml +=     		"<span class='userProfile'>"
      				childhtml +=     			"<img class='userProfileImg' src="+writerProfile+" alt='사진오류'>"
      				childhtml +=      		"</span>"
      				childhtml +=      		"<span class='userProfileID'>"+replyList[i].email+"</span>"
      				childhtml +=      "<span class='userReply'>"
      				childhtml +=      		"<div class='replyContents' contenteditable='false'>"+replyList[i].contents+"</div>"
      		       	childhtml +=      "</span>"
      		        childhtml +=      "<div class='replyBtns'>"
      			    if('${loginInfo.email}' ==  dto.email){
      		        childhtml +=      		"<button class='modifyChildBtn'>수정</button>"
                 		childhtml +=      		"<button class='deleteChildReplyBtn'>삭제</button>"
          		    childhtml +=      		"<button class='modifyChildReplySuccess' style='display:none'>완료</button>"
          	        childhtml +=      		"<button class='modifyChildReplyCancel' style='display:none'>취소</button>"
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
      		
      		
      		
      		
      		
      		//디테일뷰 글
      		var textRow = $("<span class='text'></span>");
      		textRow.append(dto.contents);
      		$("#exampleModalLabel").html(dto.title);
      		$(".writerInfo").append(textRow);
      		//디테일뷰 좋아요, 스크랩, 수정, 삭제 버튼
      		//좋아요버튼
      		if(likeCheck==0){
      			var likeA = $("<a href='#' id='like' class='"+dto.feed_seq+"'></a>");
      			var likeS = $("<span id='likeImg'></span>");
      			var likeI = $("<img id='likeBtn' class='likeBefore' src='${pageContext.request.contextPath}/resources/images/likeBefore.png'>");
      		}else{
      			var likeA = $("<a href='#' id='like' class='"+dto.feed_seq+"'></a>");
      			var likeS = $("<span id='likeImg'></span>");
      			var likeI = $("<img id='likeBtn' class='likeAfter' src='${pageContext.request.contextPath}/resources/images/likeAfter.png'>");
      		}
      		likeA.append(likeS);
      		likeS.append(likeI); 
      	
      		//스크랩버튼
      		if(bookmarkCheck==0){
      			var bookmarkA = $("<a href='#' id='bookmark' class='"+dto.feed_seq+"'></a>");
      			var bookmarkS = $("<span id='bookmarkImg'></span>");
      			var bookmarkI = $("<img id='bookmarkBtn' class='bookmarkBefore' src='${pageContext.request.contextPath}/resources/images/bookmarkBefore.png'>");
      		}else{
      			var bookmarkA = $("<a href='#' id='bookmark' class='"+dto.feed_seq+"'></a>");
      			var bookmarkS = $("<span id='bookmarkImg'></span>");
      			var bookmarkI = $("<img id='bookmarkBtn' class='bookmarkAfter' src='${pageContext.request.contextPath}/resources/images/bookmarkAfter.png'>");
      		}
      		bookmarkA.append(bookmarkS);
      		bookmarkS.append(bookmarkI); 
      		
      		var modifyA = $("<a href='modifyFeedView?feed_seq="+dto.feed_seq+"'>수정</a>");
      		var deleteA = $("<a href='deleteProc?feed_seq="+dto.feed_seq+"'>삭제</a>");
      		
      		var sessionEmail = "${loginInfo.email}";
      		var writer = dto.email;
      		console.log(sessionEmail);
      		console.log(writer);
      		
      		if(sessionEmail==writer){ //좋아요스크랩은 없애고 수정삭제만 있음
      			console.log("작성자 본인입니다.");
      			$(".footer-btns").html("");
      			$(".footer-btns").append(modifyA);
      			$(".footer-btns").append(deleteA);
      		}else{
      			console.log("작성자가 아닙니다.")
      			$(".footer-btns").html("");
      			$(".footer-btns").append(likeA);
      			$(".footer-btns").append(bookmarkA);
      		}
      	
      		
      		$(".writerProfile").html("<img src="+writerProfile+" class='writerProfileImg'>");
      		
      	}).fail(function(a,b,c){
      		console.log("실패 : "+b);
      	})
      	$('#myInput').trigger('focus');
      	
      })
   </script>
</body>
</html>