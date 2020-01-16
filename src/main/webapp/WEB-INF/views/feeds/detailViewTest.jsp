<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="replyList">
		<c:forEach items="${parentReply}" var="parentReply" varStatus="status">
			<div class="row replyFeed">
				<div class="col-2 reply replyWriter" style="text-align:center;"></div>
				<div class="col-9 reply contentsDiv">
					<div class="replyContents" contenteditable="false">${parentReply.contents}</div>
				</div>
				<div class="col-1 reply replyBtn">
					<button type="button" class="replyDeleteBtn" value="${parentReply.reply_seq }">삭제</button>
					<button type="button" class="replyModifyBtn" value="${parentReply.reply_seq }">수정</button>
					<button type="button" class="replyChildBtn" value="${parentReply.reply_seq }">답글</button>
					<button type="button" class="replyModifySuccess" value="${parentReply.reply_seq }" style="display:none" >완료</button>
					<button type="button" class="replyModifyCancel"  value="${parentReply.reply_seq }" style="display:none">취소</button>
				</div>
			</div>
		</c:forEach>
		
		<div class="replyWindow">
				<div class="row">
					<div class="col-2 reply" >${loginInfo.nickname}님의  댓글</div>
					<div class="col-9 reply">
						<div class="writeReply" id="writeReply" contenteditable="true"></div>
					</div>
					<div class="col-1 reply">
						<button type="button" id="replyBtn">등록</button>
					</div>
				</div>
			</div>
		
	</div>
</body>
</html>