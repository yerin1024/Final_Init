<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<style>
.reply {
	border: 1px solid black;
}
.writeReply{
	border:1px solid black;
	height:100%;
}
img {
	width: 300px;
	height: 300px;
}

video {
	width: 300px;
	height: 300px;
}
</style>
<script>
	$(function() {
		$("#replyBtn").on("click", function() {	        
			var feed_seq = ${dto.feed_seq};
			var contents = $("#writeReply").html();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data :{feed_seq:feed_seq,contents:contents},
				dataType:"json"
			}).done(function(resp) {	
		        if(resp.contents == 'fail'){
		        	console.log("댓글 등록 실패!");
		        }else{
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
				    $("#replyContents").val("");
		        }
			})
		})
		$(document).on("click",".replyChildBtn", function() {	 
			console.log("?? 답글 클릭 이벤트!!");
			var reply_seq = $(this).val();
			var replyWriter = 
				$("."+reply_seq+"").children(".replyWriter").html().split('님')[0];
			var childReplyContents = 
				$("#registerChildReply").children();
			console.log(childReplyContents);
			var html = "";		        
        	html += "<form method=\"post\" id=\"registerChildReply\"id=\"registerChildReply\">"	
        	html += "<div class=\"row\">"
        	html += "<div class=\"col-2 reply replyWriter\" style=\"text-align:center\">└──</div>"
        	html += "<div class=\"col-9 reply contentsDiv\">"
            html += "<div class=\"replyWriter\" style=\"color:gray;font-size:15px;\">@"+replyWriter+"</div>"
        	html += "<div class=\"replyContents\"><div class=\"writeReply\" contenteditable=\"true\"></div>"
        	html += "</div>"
        	html += "</div>"
	        html += "<div class=\"col-1 reply\">"
        	html += "<button type=\"button\" class=\"childRegisterReply\" id=\"replyBtn\" value=\""+reply_seq+"\" style=\"width:50%\">등록</button>"
        	html += "<button type=\"button\" class=\"childCancelBtn\" id=\"replyBtn\" value=\""+reply_seq+"\" style=\"width:50%\">취소</button>"
		    html += "</div>"
		   	html += "</div>"
		    html += "</form>"
			$("."+reply_seq+"").after(html);
			$('.replyBtn').find('.replyDeleteBtn').show();
			$('.replyBtn').find('.replyModifyBtn').show();
			$('.replyBtn').find('.replyModifyCancel').hide();
			$('.replyBtn').find('.replyModifySuccess').hide();
			$(this).not("#registerChildReply").remove();
			$('.contentsDiv').find('.replyContents').not(contentsDiv).attr({
				"contenteditable" : "false"
			});	    
		})
		$(document).on("click",".childCancelBtn", function() {
			$("#registerChildReply").remove();
			
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
				$("."+resp).html("");
			})
		})
		$(document).on("click",".replyModifyBtn", function(){
			var seq = $(this).val();
			var originContents = $("."+seq+"").children(".contentsDiv").children(".replyContents").html();
			var contentsDiv = $("."+seq+"").children(".contentsDiv").children(".replyContents");
			var deleteBtn = $("."+seq+"").children(".replyBtn").children(".replyDeleteBtn");
			var modifyBtn = $("."+seq+"").children(".replyBtn").children(".replyModifyBtn"); 
			var modifyCancel = $("."+seq+"").children(".replyBtn").children(".replyModifyCancel"); 
			var modifySuccess = $("."+seq+"").children(".replyBtn").children(".replyModifySuccess");	
			$('.replyBtn').find('.replyDeleteBtn').not(deleteBtn).show();
			$('.replyBtn').find('.replyModifyBtn').not(modifyBtn).show();
			$('.replyBtn').find('.replyModifyCancel').not(modifyCancel).hide();
			$('.replyBtn').find('.replyModifySuccess').not(modifySuccess).hide();
			$("#registerChildReply").remove();
			$('.contentsDiv').find('.replyContents').not(contentsDiv).attr({
				"contenteditable" : "false"
			});
			
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
 					console.log("에이잭스 들어옴?");
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
				<div class="col-4">${dto.nickname }</div>
				<div class="col-8">${dto.title }</div>
			</div>
			</div>
			<div class="body">
			<div class="row">
				<div class="col-4 reply">${dto.contents }</div>
				<div class="col-4 reply">
					<a
						href="${pageContext.request.contextPath }/feed/deleteProc?feed_seq=${dto.feed_seq}">
						<img
						src="${pageContext.request.contextPath }/resources/images/delete.png">
					</a>
				</div>
				<div class="col-4 reply">
					<a
						href="${pageContext.request.contextPath }/feed/modifyFeedView?feed_seq=${dto.feed_seq}">
						<img
						src="${pageContext.request.contextPath }/resources/images/improvement.png">
					</a>
				</div>
			</div>
			</div>
			<div class="replyList">
			<c:forEach items="${replylist }" var="replylist">
				<div class="row replyFeed ${replylist.reply_seq }">
					<div class="col-2 reply replyWriter" style="text-align: center">${replylist.nickname }님의
						댓글</div>
					<div class="col-9 reply contentsDiv">
						<div class="replyContents" contenteditable="false">${replylist.contents }</div>
					</div>
					<div class="col-1 reply replyBtn">
						<button type="button" class="replyDeleteBtn"
							value="${replylist.reply_seq }" style="width: 30%">삭제</button>
						<button type="button" class="replyModifyBtn" value="${replylist.reply_seq }" style="width: 30%">수정</button>
						<button type="button" class="replyChildBtn" value="${replylist.reply_seq }" style="width: 30%">답글</button>
						<button type="button" class="replyModifySuccess"
							value="${replylist.reply_seq }" style="width: 30%;display:none" >완료</button>
						<button type="button" class="replyModifyCancel"  value="${replylist.reply_seq }" style="width: 30%;display:none">취소</button>
					</div>
				</div>
			</c:forEach>	
			</div>
			<div class="replyWindow">
			<form method="post" id="registerReply">
				<div class="row">
					<div class="col-2 reply" style="text-align: center; padding:15px;">${dto.nickname }님의  <!-- 나중에 세션값으로 대체! -->
						댓글</div>
					<div class="col-9 reply">
						<div class="writeReply" id="writeReply" contenteditable="true"></div>
					</div>
					<div class="col-1 reply">
						<button type="button" id="replyBtn" style="width: 30%">등록</button>
					</div>
				</div>
			</form>
			</div>
		</div>
		<script>	
		
		</script>
</body>
</html>