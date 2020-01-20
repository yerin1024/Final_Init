<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<script>
		function replyBtnOnclick(email) {
			var writeReply = $("#writeReply");
			var contents = writeReply.html();
			
			var feed_seq = $(".feedSeqDiv").html();
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
					var html = "";
					html += "<div class=\"userInfo\">"
					html += "<span class=\"userProfile\"><img class=\"userProfileImg\" src=\"${pageContext.request.contextPath }/resources/images/dog.jpg\" alt=\"\"></span>";
					html += "<span class=\"userProfileID\">"+data.email+"</span><span class=\"userReply\"><div class=\"replyContents\">"+data.contents+"</div></span>"
					html += "<div class=\"replyBtns\">"
					html += "<button type=\"button\" class=\"modifyReply\" value=\""+data.reply_seq+"\">수정</button>"
					html += "<button type=\"button\" class=\"deleteReply\" value=\""+data.reply_seq+"\">삭제</button>"
					html += "<button type=\"button\" class=\"modifyReplySuccess\" value=\""+data.reply_seq+"\" style=\"display:none\">완료</button>"
					html += "<button type=\"button\" class=\"modifyReplyCancel\"  style=\"display:none\">취소</button>"
					html += "<button type=\"button\" class=\"registerChildReply\" value=\""+data.reply_seq+"\">답글</button>"
					html += "</div>"
          			html += "</div>"
					$(".reply").append(html);
					writeReply.html("");
			}).fail(function() {
				alert("sad");
			})
		}
		$(document).on("click",".modifyReply", function(){
			var deleteBtn = $(".deleteReply");
			var modifySuccessBtn = $(".modifyReplySuccess");
			var modifyCancelBtn = $(".modifyReplyCancel");
			var modifyReply =  $(this); //수정 버튼
			var deleteReply =  $(this).siblings(".deleteReply"); //삭제버튼
			var modifyReplySuccess =  $(this).siblings(".modifyReplySuccess"); //수정완료버튼
			var modifyReplyCancel =  $(this).siblings(".modifyReplyCancel"); //수정취소버튼
			var contents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var originalContents = contents.html();
 			modifyReply.hide();
			deleteReply.hide();
 			modifyReplySuccess.show();
			modifyReplyCancel.show();
			$(contents).attr("contenteditable","true");
			$(contents).focus();
			
			$(document).on("click",".modifyReplySuccess", function(){
				var reply_seq = $(this).val();
	 			var modifiedContents = contents.html();
	 			console.log("원래 댓글 : " + originalContents);
	 			console.log("수정 댓글 : " +modifiedContents);
				var modifyBtn = $(".modifyReply");
				var deleteBtn = $(".deleteReply");
				var modifySuccessBtn = $(".modifyReplySuccess");
				
				if(originalContents == modifiedContents){
	 				console.log("원래 댓글 : " + originalContents);
		 			console.log("수정 댓글 : " +modifiedContents);
			 		modifyReply.show();
 					deleteReply.show();
 			 		modifyReplySuccess.hide();
 					modifyReplyCancel.hide();
					$(contents).attr("contenteditable","false");
	 			}else{
	 				$.ajax({
	 					type : "POST",
	 					url : "${pageContext.request.contextPath }/feed/modifyReply",
	 					data : {reply_seq:reply_seq,contents:modifiedContents}	
	 				}).done(function(resp){
	 					if(resp == 1){
	 			 			modifyReply.show();
	 						deleteReply.show();
	 			 			modifyReplySuccess.hide();
	 						modifyReplyCancel.hide();
	 						$(contents).attr("contenteditable","false");
	 					}else{
	 						console.log("오류");
	 					}
	 				}).fail(function(){
	 					console.log("댓글 수정 오류!!!");
	 				})
	 			}
			});

			$(document).on("click",".modifyReplyCancel", function(){
				var modifyBtn = $(".modifyReply");
				var deleteBtn = $(".deleteReply");
				var modifySuccessBtn = $(".modifyReplySuccess");
				$(this).siblings(".modifyReply").show();
				$(this).siblings(".deleteReply").show();
				$(this).siblings(".modifyReplySuccess").hide();
				$(this).hide();
				var contents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
				contents.html(originalContents);
				$(contents).attr("contenteditable","false");
			});
		});
		
		
		function deleteReply(ctxPath){
			var reply_seq = $(this).val();
			var deleteDiv = $(this).closest(".userInfo");
			$.ajax({
				type : "POST",
				url : ctxPath + "/feed/deleteReply",
				data : {reply_seq:reply_seq}				
			}).done(function(resp) {
				console.log(resp + "행 댓글이 지워짐!");
				deleteDiv.remove();
			}).fail(function(){
				alert("yes!");
			})
		}
		

		$(document).on("click",".deleteReply", function(){
			var reply_seq = $(this).val();
			var deleteDiv = $(this).closest(".userInfo");
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
		$(document).on("click",".registerChildReply", function(){
			var reply_seq = $(this).val();
			var userNickname = '${loginInfo.nickname }';
			console.log(reply_seq);
			var replyWriter = $(this).closest(".replyBtns").siblings(".userProfileID").html(); //부모댓글의 닉네임
			var html = "";	
			html += "<div class=\"childReply\">"
			html += "<span class=\"userProfile\"><img class=\"childProfileImg\" src=\"${pageContext.request.contextPath }/resources/images/dog.jpg\" alt=\"\"></span>";
			html += "<span class=\"userProfileID\">"+userNickname+"</span><span class=\"childContentsBox\"><div class=\"replyContents\" contenteditable=\"true\"></div></span>"
			html += "<div class=\"replyBtns\">"
			html += "<button type=\"button\" class=\"modifyReply\" value=\""+reply_seq+"\">수정</button>"
			html += "<button type=\"button\" class=\"deleteReply\" value=\""+reply_seq+"\">삭제</button>"
			html += "<button type=\"button\" class=\"modifyReplySuccess\" value=\""+reply_seq+"\" style=\"display:none\">완료</button>"
			html += "<button type=\"button\" class=\"modifyReplyCancel\"  style=\"display:none\">취소</button>"
			html += "</div>"
  			html += "</div>"
			$(".reply").append(html);
		});
	</script>
</body>
</html>