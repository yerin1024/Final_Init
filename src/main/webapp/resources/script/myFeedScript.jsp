<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script>
		function replyBtnOnclick(email) {
			var writeReply = $("#writeReply");
			var contents = writeReply.html();
			var feed_seq = $("#exampleModal").attr("feed_seq");
			console.log(feed_seq + " ## ?");
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
					html += "<div class=\"userInfo\" reply_seq="+data.reply_seq+">"
					html += "<span class=\"userProfile\"><img class=\"userProfileImg\" src=\"${pageContext.request.contextPath }/resources/images/dog.jpg\" alt=\"\"></span>";
					html += "<div class=\"profileDiv\"><span class=\"userProfileID\">"+data.email+"</span><span class=\"userReply\"><div class=\"replyContents\">"+data.contents+"</div></span></div>"
					html += "<div class=\"replyBtns\">"
					html += "<button type=\"button\" class=\"modifyReply\">수정</button>"
					html += "<button type=\"button\" class=\"deleteReply\">삭제</button>"
					html += "<button type=\"button\" class=\"registerChildBtn\">답글</button>"
					html += "</div>"
          			html += "</div>"
					$(".reply").append(html);
					writeReply.html("");
			}).fail(function() {
				alert("sad");
			})
		}
		
		var temporaryReply;
		
		//답글등록버튼
		var registerReplyBtn = $("<button></button>");
		registerReplyBtn.html("등록")
		registerReplyBtn.addClass("registerChildReply");
		
		//답글삭제버튼
		var deleteChildReplyBtn = $("<button></button>");
		deleteChildReplyBtn.html("삭제")
		deleteChildReplyBtn.addClass("deleteChildReplyBtn");
		
		
		//답글취소버튼
		var childReplyCancel = $("<button></button>");
		childReplyCancel.html("취소")
		childReplyCancel.addClass("childReplyCancel");
		
		
		//답글수정버튼
		var modifyChildBtn = $("<button></button>");
		modifyChildBtn.html("수정")
		modifyChildBtn.addClass("modifyChildBtn");

		//답글수정완료버튼
		var modifyChildReplySuccess = $("<button></button>");
		modifyChildReplySuccess.html("완료")
		modifyChildReplySuccess.addClass("modifyChildReplySuccess");

		//수정버튼
		var modifyBtn = $("<button></button>");
		modifyBtn.html("수정")
		modifyBtn.addClass("modifyReply");

		//삭제버튼
		var deleteBtn = $("<button></button>");
		deleteBtn.html("삭제")
		deleteBtn.addClass("deleteReply");

		//답글버튼
		var registerChildBtn = $("<button></button>");
		registerChildBtn.html("답글")
		registerChildBtn.addClass("registerChildBtn");
		
		//수정완료버튼
		var modifyCompleteBtn = $("<button></button>");
		modifyCompleteBtn.html("수정완료");
		modifyCompleteBtn.addClass("modifyReplySuccess");

		//수정취소버튼
		var modifyCancelBtn = $("<button></button>");
		modifyCancelBtn.html("취소")
		modifyCancelBtn.addClass("modifyReplyCancel");
		
		$(document).on("click",".modifyReply", function(){
			var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");
			oriReply.attr("contentEditable","true");
			temporaryReply = oriReply.html();
			var replyBtns = $(this).closest(".replyBtns"); 
			
			oriReply.focus();
			
			$(this).closest(".replyBtns").children().remove();			

			replyBtns.prepend(modifyCancelBtn);
			replyBtns.prepend(modifyCompleteBtn);
		});
		
		$(document).on("click",".modifyReplySuccess", function(){
			var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");
			var replyContents = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents").html();
			var currentReply = oriReply.html();
			var replyBtns = $(this).closest(".replyBtns");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			
			if(temporaryReply == currentReply){
				oriReply.html(temporaryReply);
			}else{
				$.ajax({
 					type : "POST",
 					url : "${pageContext.request.contextPath }/feed/modifyReply",
 					data : {reply_seq:reply_seq,contents:replyContents}	
 				}).done(function(resp){
 					if(resp == 1){
 						console.log("성공!");
 					}else{
 						console.log("오류");
 					}
 				}).fail(function(){
 					console.log("댓글 수정 오류!!!");
 				})
			}
			
			oriReply.attr("contentEditable","false");

			$(this).closest(".replyBtns").children().remove();			
			replyBtns.prepend(registerChildBtn);
			replyBtns.prepend(deleteBtn);
			replyBtns.prepend(modifyBtn);	
		});

		$(document).on("click",".modifyReplyCancel", function(){
			var replyBtns = $(this).closest(".replyBtns");
			var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");			
			oriReply.html(temporaryReply);
			oriReply.attr("contentEditable","false");
			
			$(this).closest(".replyBtns").children().remove();
			
			
			var registerChildBtn = $("<button></button>");
			registerChildBtn.html("답글")
			registerChildBtn.addClass("registerChildBtn");

			replyBtns.prepend(registerChildBtn);
			replyBtns.prepend(deleteBtn);
			replyBtns.prepend(modifyBtn);
		});
		
		//댓글 삭제 버튼
		$(document).on("click",".deleteReply", function(){
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
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
		
		//답글버튼 눌렀을 때 이벤트
		$(document).on("click",".registerChildBtn", function(){
			var userNickname = '${loginInfo.nickname }';
			var replyWriter = $(this).closest(".replyBtns").siblings(".userProfileID").html(); //부모댓글의 닉네임
			var userInfo = $(this).closest(".userInfo");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
		   	
			
			//--------------------------------------------------------
			var registerChildDiv = $("<div></div>");
			registerChildDiv.addClass("childReply");
			
			var userProfile = $("<span></span>");
			userProfile.addClass("userProfile");
			
			var childProfileImg = $("<img></img>");
			childProfileImg.addClass("userProfileImg");
			childProfileImg.attr("src","${loginInfo.profile_img}");
			childProfileImg.attr("alt","사진오류");			

			var userProfileID = $("<span></span>");
			userProfileID.addClass("userProfileID");
			userProfileID.html("${loginInfo.nickname}");
			
			//답글 쓰는 공간을 감싸는 span
			var userReply = $("<span></span>");
			userReply.addClass("userReply");			
			
			//답글 쓰는 공간
			var replyContents = $("<div></div>");
			replyContents.addClass("replyContents");
			replyContents.attr("contenteditable","true");				
			
			//답글버튼추가
			var replyBtns = $("<div></div>");
			replyBtns.addClass("replyBtns");			

			
			//버튼DIV 추가
			replyBtns.append(registerReplyBtn);
			replyBtns.append(childReplyCancel);
			
			userProfile.append(childProfileImg);
			
			registerChildDiv.append(userProfile);			
			registerChildDiv.append(userProfileID);
			registerChildDiv.append(userReply);
			registerChildDiv.append(replyBtns);
			userReply.append(replyContents);
			userInfo.append(registerChildDiv);	
			//--------------------------------------------------------  		
		});
		$(document).on("click",".registerChildReply", function(){
			var feed_seq = $("#exampleModal").attr("feed_seq");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			console.log(reply_seq);
			var replyWriter = $(this).closest(".childReply").siblings(".profileDiv").find(".userProfileID").html(); //부모댓글의 닉네임
			var childReplyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents").html();
			var replyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var btns = $(this).closest(".replyBtns").children();
			var btnsDiv = $(this).closest(".replyBtns");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data : {feed_seq:feed_seq,email:'${loginInfo.email}',contents:childReplyContents,depth:1,parent:reply_seq},
				dataType:"json"		
			}).done(function(resp) {
				console.log('성공적으로 성공');
				btns.remove();
				btnsDiv.append(modifyChildBtn);
				btnsDiv.append(deleteChildReplyBtn);
				replyContents.attr("contentEditable","false");
			}).fail(function(){
				console.log("실패!");
			})

		});
		//답글삭제버튼
		$(document).on("click",".deleteChildReplyBtn", function(){
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			var deleteDiv = $(this).closest(".childReply");
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
		//답글을 취소했을 때
		$(document).on("click",".childReplyCancel", function() {
			$(this).closest(".childReply").remove();			
		})
		
		$(document).on("click",".modifyChildBtn", function() {
			var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");
			var replyContents = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents").html();
			var currentReply = oriReply.html();
			var replyBtns = $(this).closest(".replyBtns");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			
			if(temporaryReply == currentReply){
				oriReply.html(temporaryReply);
			}else{
				$.ajax({
 					type : "POST",
 					url : "${pageContext.request.contextPath }/feed/modifyReply",
 					data : {reply_seq:reply_seq,contents:replyContents}	
 				}).done(function(resp){
 					if(resp == 1){
 						console.log("성공!");
 					}else{
 						console.log("오류");
 					}
 				}).fail(function(){
 					console.log("댓글 수정 오류!!!");
 				})
			}
			
			oriReply.attr("contentEditable","false");
			$(this).closest(".replyBtns").children().remove();			
			replyBtns.prepend(modifyChildReplySuccess);
			replyBtns.prepend(childReplyCancel);
		})
		//답글수정완료버튼을 눌렀을 때
		$(document).on("click",".modifyChildReplySuccess", function(){
			var oriReply = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents");
			var replyContents = $(this).closest(".replyBtns").siblings(".profileDiv").find(".replyContents").html();
			var currentReply = oriReply.html();
			var replyBtns = $(this).closest(".replyBtns");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			
			if(temporaryReply == currentReply){
				oriReply.html(temporaryReply);
			}else{
				$.ajax({
 					type : "POST",
 					url : "${pageContext.request.contextPath }/feed/modifyReply",
 					data : {reply_seq:reply_seq,contents:replyContents}	
 				}).done(function(resp){
 					if(resp == 1){
 						console.log("성공!");
 					}else{
 						console.log("오류");
 					}
 				}).fail(function(){
 					console.log("댓글 수정 오류!!!");
 				})
			}			
			oriReply.attr("contentEditable","false");
			$(this).closest(".replyBtns").children().remove();			
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			replyBtns.prepend(modifyChildBtn);
			replyBtns.prepend(deleteChildReplyBtn);
		});
		</script>