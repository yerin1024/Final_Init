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
.feed {
	border: 1px solid black;
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
			var contents = $("#replyContents").val();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data :{feed_seq:feed_seq,contents:contents},
				dataType:"json"
			}).done(function(resp) {	
				var html = "";
		        console.log(resp.contents);
		        console.log(resp.nickname);
		        console.log(resp.reply_seq);
		        	html += "<div class=\"row replyFeed "+resp.reply_seq+"\">"
		        	html += "<div class=\"col-2 feed\" style=\"text-align:center\">"+resp.nickname+"님의 댓글</div>"
		        	html += "<div class=\"col-9 feed\">"
		        	html += "<div>"+resp.contents+"</div>"
		        	html += "</div>"
			        html += "<div class=\"col-1 feed\">"
		        	html += "<button type=\"button\" class=\"replyDeleteBtn\" value=\""+resp.reply_seq+"\" style=\"width:30%\">삭제</button>"
		        	html += "<button type=\"button\" class=\"replyModifyBtn\" style=\"width:30%\">수정</button>"
				    html += "</div>"
				    html += "</div>"
					$(".replyList").append(html);
				    $("#replyContents").val("");
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
// 				console.log(resp);
				$("."+resp).html("");
			})
		})
		$("#replyModifyBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath }/feed/";
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
				<div class="col-4 feed">${dto.contents }</div>
				<div class="col-4 feed">
					<a
						href="${pageContext.request.contextPath }/feed/deleteProc?feed_seq=${dto.feed_seq}">
						<img
						src="${pageContext.request.contextPath }/resources/images/delete.png">
					</a>
				</div>
				<div class="col-4 feed">
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
					<div class="col-2 feed" style="text-align: center">${replylist.nickname }님의
						댓글</div>
					<div class="col-9 feed">
						<div>${replylist.contents }</div>
					</div>
					<div class="col-1 feed">
						<button type="button" class="replyDeleteBtn"
							value="${replylist.reply_seq }" style="width: 30%">삭제</button>
						<button type="button" class="replyModifyBtn" style="width: 30%">수정</button>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="replyWindow">
			<form method="post" id="registerReply">
				<div class="row">
					<div class="col-2 feed" style="text-align: center">${dto.nickname }님의
						댓글</div>
					<div class="col-9 feed">
						<input type="text" id="replyContents" name="contents" style="width: 100%">
					</div>
					<div class="col-1 feed">
						<button type="button" id="replyBtn" style="width: 30%">등록</button>
					</div>
				</div>
			</form>
			</div>
		</div>
</body>
</html>