<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
.reply {
	border: 1px solid black;
}
.writeReply{
	border:1px solid black;
}
img {
	width: 300px;
	height: 300px;
.dz-default {
	border: 2px solid black;
}

.dz-preview {
	display: none;
}

.carousel-item {
	margin: auto;
	text-align: center;
}

.carousel-inner {
	width: 100vw;
}

.carousel-item * {
	width: 600px;
	height: 600px;
}

.btnss * {
	width: 100px;
	height: 100px;
}
</style>
<script>
	$(function() {
		$("#replyBtn").on("click", function() {	        
			var feed_seq = ${dto.feed_seq};
			var contents = $("#writeReply").html();
			var nickname = "${loginInfo.nickname}";
			console.log(nickname);

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data :{feed_seq:feed_seq,contents:contents,nickname:nickname},
				dataType:"json"
			}).done(function(resp) {
					var html = "";	        	
		        	html += "<div class=\"row replyFeed "+resp.reply_seq+"\">"
		        	html += "<div class=\"col-2 reply replyWriter\" style=\"text-align:center\">"+resp.nickname+"님의 댓글</div>"
		        	html += "<div class=\"col-9 reply contentsDiv\">"
		        	html += "<div class=\"replyContents\">"+resp.contents+"</div>"
		        	html += "</div>"
			        html += "<div class=\"col-1 reply replyBtn\">"
		        	html += "<button type=\"button\" class=\"replyDeleteBtn\" value=\""+resp.reply_seq+"\" style=\"width:30%\">삭제</button>"
		        	html += "<button type=\"button\" class=\"replyModifyBtn\"  value=\""+resp.reply_seq+"\" style=\"width:30%\">수정</button>"
		        	html += "<button type=\"button\" class=\"replyChildBtn\"  value=\""+resp.reply_seq+"\" style=\"width:30%\">답글</button>"
		        	html += "<button type=\"button\" class=\"replyModifySuccess\"  value=\""+resp.reply_seq+"\" style=\"width:30%;display:none\">완료</button>"
		        	html += "<button type=\"button\" class=\"replyModifyCancel\"  value=\""+resp.reply_seq+"\" style=\"width:30%;display:none\">취소</button>"
				    html += "</div>"
				    html += "</div>"
					$(".replyList").append(html);
				    $("#writeReply").html("");

			})
		})
		//답글 이벤트 ------------------------------------------------------		
		//답글버튼을 눌렀을 때
		$(document).on("click",".replyChildBtn", function() {	
			console.log("?? 답글 클릭 이벤트!!");
			var reply_seq = $(this).val();
			var replyWriter = 
				$("."+reply_seq+"").children(".replyWriter").html().split('님')[0];
			var html = "";		        	
        	html += "<div class=\"row childReply\">"
        	html += "<div class=\"col-2 reply replyWriter\" style=\"text-align:center\">└──</div>"
        	html += "<div class=\"col-9 reply contentsDiv\">"
            html += "<div class=\"replyWriter\" style=\"color:gray;font-size:15px;\">@"+replyWriter+"</div>"
        	html += "<div class=\"writeReply\" contenteditable=\"true\"></div>"
        	html += "</div>"
	        html += "<div class=\"col-1 reply\">"
        	html += "<button type=\"button\" class=\"childRegisterReply\" value=\""+reply_seq+"\" style=\"width:50%\">등록</button>"
        	html += "<button type=\"button\" class=\"childCancelBtn\" value=\""+reply_seq+"\" style=\"width:50%\">취소</button>"
		    html += "</div>"
		   	html += "</div>"
			$("."+reply_seq+"").after(html);
			$('.replyBtn').find('.replyDeleteBtn').show();
			$('.replyBtn').find('.replyModifyBtn').show();
			$('.replyBtn').find('.replyModifyCancel').hide();
			$('.replyBtn').find('.replyModifySuccess').hide();	
		   	var childReply =  $("."+reply_seq+"").next()[0];
		   	$(".childReply").not(childReply).remove();
			$(".contentsDiv").find('.replyContents').attr({
				"contenteditable" : "false"
			});	    
		})
		//답글을 취소했을 때
		$(document).on("click",".childCancelBtn", function() {
			$(this).closest(".childReply").remove();
		})
		//답글을 등록했을 때
		$(document).on("click",".childRegisterReply",function(){
			var reply_seq = $(this).val();      
			var feed_seq = ${dto.feed_seq};
			var nickname = "${loginInfo.nickname}";
			var replyWriter = 
				$("."+reply_seq+"").children(".replyWriter").html().split('님')[0];
		   	var div = $(this).closest(".childReply");
		   	var childReplyContents = div.find(".writeReply").html();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data : {feed_seq:feed_seq,nickname:nickname,contents:childReplyContents,depth:1,parent:reply_seq},
				dataType:"json"		
			}).done(function(resp) {
				console.log('성공적으로 성공');
				div.remove();
				var html = "";		        	
	        	html += "<div class=\"row replyVowel\">"
		        html += "<div class=\"col-1 reply replyWriter\" style=\"text-align:center\">└──</div>"
	        	html += "<div class=\"col-1 reply replyWriter\" style=\"text-align:center\">"+nickname+"</div>"
	        	html += "<div class=\"col-9 reply contentsDiv\">"
	            html += "<div class=\"replyWriter\" style=\"color:gray;font-size:15px;\">@"+replyWriter+"</div>"
	        	html += "<div class=\"writeReply\">"+resp.contents+"</div>"
	        	html += "</div>"
		        html += "<div class=\"col-1 reply\">"
		       	html += "<button type=\"button\" class=\"replyDeleteBtn\" value=\""+resp.reply_seq+"\" style=\"width:50%\">삭제</button>"
		       	html += "<button type=\"button\" class=\"replyModifyBtn\"  value=\""+resp.reply_seq+"\" style=\"width:50%\">수정</button>"
		       	html += "<button type=\"button\" class=\"replyModifySuccess\"  value=\""+resp.reply_seq+"\" style=\"width:50%;display:none\">완료</button>"
		       	html += "<button type=\"button\" class=\"replyModifyCancel\"  value=\""+resp.reply_seq+"\" style=\"width:50%;display:none\">취소</button>"
			    html += "</div>"
			   	html += "</div>"
				$("."+reply_seq+"").after(html);
			})
		})
		
		
		$(document).on("click",".replyDeleteBtn" ,function() {
			var reply_seq = $(this).val();    
			console.log(reply_seq + "입니다.");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/deleteReply",
				data : {reply_seq:reply_seq}				
			}).done(function(resp) {
				console.log('성공적으로 성공');
// 			   	var childReply =  $("."+reply_seq+"").next()[0].remove();
				$("."+resp).html("");
			})
		})
		$(document).on("click",".replyModifyBtn", function(){
			var seq = $(this).val();
			var originContents = $("."+seq+"").find(".replyContents").html();
			var contentsDiv = $("."+seq+"").find(".replyContents");
			var deleteBtn = $("."+seq+"").find(".replyDeleteBtn");
			var modifyBtn = $("."+seq+"").find(".replyModifyBtn"); 
			var modifyCancel = $("."+seq+"").find(".replyModifyCancel"); 
			var modifySuccess = $("."+seq+"").find(".replyModifySuccess");	
			$('.replyBtn').find('.replyDeleteBtn').not(deleteBtn).show();
			$('.replyBtn').find('.replyModifyBtn').not(modifyBtn).show();
			$('.replyBtn').find('.replyModifyCancel').not(modifyCancel).hide();
			$('.replyBtn').find('.replyModifySuccess').not(modifySuccess).hide();
			$(".childReply").remove();
			$('.contentsDiv').find('.replyContents').not(contentsDiv).attr({
				"contenteditable" : "false"
			});
			contentsDiv.html(originContents);
	 		deleteBtn.hide();
	 		modifyBtn.hide();
	 		modifyCancel.show(); 
	 		modifySuccess.show(); 
	 		contentsDiv.attr("contenteditable","true");
	 		contentsDiv.focus();
	 		modifyCancel.on("click",function(){
	 			contentsDiv.html(originContents);
 				deleteBtn.show();
 		 		modifyBtn.show();
 		 		modifyCancel.hide(); 
 		 		modifySuccess.hide(); 
 		 		contentsDiv.attr("contenteditable","false");
	 		})
	 		modifySuccess.on("click",function(){
	 			var modifiedContents = $("."+seq+"").children(".contentsDiv").children(".replyContents").html();
	 			
	 			console.log("원래 댓글 : " + originContents);
	 			console.log("수정 댓글 : " +modifiedContents);
	 			
	 			if(originContents == modifiedContents){
	 				console.log("원래 댓글 : " + originContents);
		 			console.log("수정 댓글 : " +modifiedContents);
	 				deleteBtn.show();
	 		 		modifyBtn.show();
	 		 		modifyCancel.hide(); 
	 		 		modifySuccess.hide(); 
	 		 		contentsDiv.attr("contenteditable","false");
	 			}else{
	 				$.ajax({
	 					type : "POST",
	 					url : "${pageContext.request.contextPath }/feed/updateReply",
	 					data : {reply_seq:seq,contents:modifiedContents}	
	 				}).done(function(resp){
	 					if(resp == 1){
	 		 				deleteBtn.show();
	 		 		 		modifyBtn.show();
	 		 		 		modifyCancel.hide(); 
	 		 		 		modifySuccess.hide();  
	 		 		 		contentsDiv.attr("contenteditable","false");
	 					}else{
	 						console.log("오류");
	 					}
	 				})
	 			}
	 		})
		})
	})
</script>
</head>
<body>
	<div id="container">
		<div class="header">
			<div class="row">
				<div class="col-4">${dto.nickname}</div>
				<div class="col-8">${dto.title }</div>
			</div>
		</div>
		<div class="body">
			<c:choose>
				<c:when test="${fn:length(media) >0}">
					<div class="row media">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-interval="false">
							<ol class="carousel-indicators">
								<c:forEach items="${media }" var="media" varStatus="status">
									<c:if test="${status.index ==0}">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
									</c:if>
									<c:if test="${status.index !=0}">
										<li data-target="#carouselExampleIndicators"
											data-slide-to="${status.index }"></li>
									</c:if>
								</c:forEach>
							</ol>
							<div class="carousel-inner">
								<c:forEach items="${media }" var="media" varStatus="status">
									<c:if test="${status.index ==0}">
										<div class="carousel-item active">${media }</div>
									</c:if>
									<c:if test="${status.index !=0}">
										<div class="carousel-item">${media }</div>
									</c:if>
								</c:forEach>

								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button" data-slide="prev"> 
									<span class="carousel-control-prev-icon"
									aria-hidden="true"></span> 
									<span class="sr-only">Previous</span>
								</a> 
								<a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</c:when>
				
				
				
				
				
			</c:choose>
			<div class="row">
				<div class="col-4 reply">${dto.contents }</div>
				<div class="col-4 reply">
					<a href="${pageContext.request.contextPath }/feed/deleteProc?feed_seq=${dto.feed_seq}">
						<img src="${pageContext.request.contextPath }/resources/images/delete.png">
					</a>
				</div>
				<div class="col-4 reply">
					<a href="${pageContext.request.contextPath }/feed/modifyFeedView?feed_seq=${dto.feed_seq}">
						<img src="${pageContext.request.contextPath }/resources/images/improvement.png">
					</a>
				</div>
				<div class="col-3 feed btnss like">
					<c:choose>
						<c:when test="${likeCheck==0 }">
							<a href="#" id="like" class="${dto.feed_seq }"> <span id="likeImg">
								<img class="likeBefore" id="likeBtn" src="${pageContext.request.contextPath }/resources/images/likeBefore.png">
							</span></a>
						</c:when>
						<c:otherwise>
							<a href="#" id="like" class="${dto.feed_seq }"> <span id="likeImg">
							<img class="likeAfter" id="likeBtn" src="${pageContext.request.contextPath }/resources/images/likeAfter.png">
							</span></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-3 feed btnss bookmark">
					<c:choose>
						<c:when test="${bookmarkCheck==0 }">
							<a href="#" id="bookmark" class="${dto.feed_seq }"> <span id="bookmarkImg">
								<img class="bookmarkBefore" id="bookmarkBtn" src="${pageContext.request.contextPath }/resources/images/bookmarkBefore.png">
							</span> </a>
						</c:when>
						<c:otherwise>
							<a href="#" id="bookmark" class="${dto.feed_seq }"> <span id="bookmarkImg">
								<img class="bookmarkAfter" id="bookmarkBtn" src="${pageContext.request.contextPath }/resources/images/bookmarkAfter.png">
							</span> </a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="replyList">
			<c:forEach items="${parentReply }" var="parentReply">
				<div class="row replyFeed ${parentReply.reply_seq }">
					<div class="col-2 reply replyWriter" style="text-align: center">${parentReply.nickname }님의
						댓글</div>
					<div class="col-9 reply contentsDiv">
						<div class="replyContents" contenteditable="false">${parentReply.contents }</div>
					</div>
					<div class="col-1 reply replyBtn">
						<button type="button" class="replyDeleteBtn"
							value="${replylist.reply_seq }" style="width: 30%">삭제</button>
						<button type="button" class="replyModifyBtn" value="${parentReply.reply_seq }" style="width: 30%">수정</button>
						<button type="button" class="replyChildBtn" value="${parentReply.reply_seq }" style="width: 30%">답글</button>
						<button type="button" class="replyModifySuccess"
							value="${replylist.reply_seq }" style="width: 50%; display:none" >완료</button>
						<button type="button" class="replyModifyCancel"  value="${parentReply.reply_seq }" style="width: 50%; display:none">취소</button>
					</div>
				</div>	
						<c:forEach items="${childReply }" var="childReply"> 
						${parentReply.reply_seq}<br>
						${childReply.parent}<br>
						${childReply.contents}<br>
							<c:choose>
								<c:when test="${childReply.parent == parentReply.reply_seq }">
								<div class="row replyVowel ${childReply.parent } ${parentReply.reply_seq}">
									<div class="col-1 reply replyWriter" style="text-align: center">└──</div>
									<div class="col-1 reply replyWriter" style="text-align: center">${childReply.nickname }님의 댓글</div>
									<div class="col-9 reply contentsDiv">
										<div class="replyWriter" style="color: gray; font-size: 15px;">@${parentReply.nickname }</div>
										<div class="writeReply">${childReply.contents }</div>
									</div>
									<div class="col-1 reply">
										<button type="button" class="replyDeleteBtn" value="125"
											style="width: 50%">삭제</button>
										<button type="button" class="replyModifyBtn" value="125"
											style="width: 50%">수정</button>
										<button type="button" class="replyModifySuccess" value="125"
											style="width: 50%; display: none">완료</button>
										<button type="button" class="replyModifyCancel" value="125"
											style="width: 50%; display: none">취소</button>
									</div>
								</div>
								</c:when>
							</c:choose>			
						</c:forEach>
				</c:forEach>			
			</div>
			<div class="replyWindow">
				<div class="row">
					<div class="col-2 reply" style="text-align: center; padding:15px;">${loginInfo.nickname}님의  <!-- 나중에 세션값으로 대체! -->
						댓글</div>
					<div class="col-9 reply">
						<div class="writeReply" id="writeReply" contenteditable="true"></div>
					</div>
					<div class="col-1 reply">
						<button type="button" id="replyBtn" style="width: 30%">등록</button>
					</div>
				</div>
		</div>
	</div>


	<script>	
		$("#like").on("click", function(){
			var seq = $(this).attr("class");
			var likeCheck = $("#likeBtn").attr("class");
			if(likeCheck=="likeBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertLike",
					data : {feed_seq : seq}
				}).done(function(){
					$("#likeImg").html("<img class=\"likeAfter\" id=\"likeBtn\" src=\"${pageContext.request.contextPath }/resources/images/likeAfter.png\">");
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteLike",
					data : {feed_seq : seq}
				}).done(function(){
					$("#likeImg").html("<img class=\"likeBefore\" id=\"likeBtn\" src=\"${pageContext.request.contextPath }/resources/images/likeBefore.png\">");
				})
			}
		})
		
		$("#bookmark").on("click", function(){
			var seq = $(this).attr("class");
			var bookmarkCheck = $("#bookmarkBtn").attr("class");
			if(bookmarkCheck=="bookmarkBefore"){ //아직 좋아요를 안눌러있는 상태에서 좋아요했을때
				$.ajax({
					type : "POST",
					url : "/feed/insertBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					$("#bookmarkImg").html("<img class=\"bookmarkAfter\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkAfter.png\">");
				})
			}else{
				$.ajax({
					type : "POST",
					url : "/feed/deleteBookmark",
					data : {feed_seq : seq}
				}).done(function(){
					$("#bookmarkImg").html("<img class=\"bookmarkBefore\" id=\"bookmarkBtn\" src=\"${pageContext.request.contextPath }/resources/images/bookmarkBefore.png\">");
				})
			}
				
		})
	</script>
</body>
</html>