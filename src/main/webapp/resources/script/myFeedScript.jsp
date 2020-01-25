<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
		function replyBtnOnclick(email) {
			var writeReply = $("#writeReply");
			var contents = writeReply.html();
			if(contents == ""){ //컨텐츠가 null 값일 경우 등록 동작
				return false;
			}
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
					console.log(data);
					var html = "";
					html += "<div class=\"userInfo\" reply_seq="+data.reply_seq+">"
					html += "<div class=\"profileDiv\"><span class=\"userProfile\"><img class=\"userProfileImg\" src=\"${loginInfo.profile_img }\" alt=\"\"></span><span class=\"userProfileID\">"+data.email+"</span><span class=\"userReply\"><div class=\"replyContents\">"+data.contents+"</div></span></div>"
					html += "<div class=\"replyBtns\">"
					html += "<button type=\"button\" class=\"modifyReply\">수정</button>"
					html += "<button type=\"button\" class=\"deleteReply\">삭제</button>"
					html += "<button type=\"button\" class=\"registerChildBtn\">답글</button>"
					html += "</div>"
          			html += "</div>"
					$(".reply").append(html);
					writeReply.html("");
			}).fail(function(a, b, c) {
				console.log(a);
				console.log(b);
				console.log(c);
			})
		}
		
		var temporaryReply;
		var clickCnt;
		var childReplyButton;

		//답글숨기기
		var showReply = $("<button></button>");
		showReply.addClass("showReply");
		showReply.html("ㅡ답글보이기");
		

		//답글숨기기
		var hideReply = $("<button></button>");
		hideReply.addClass("hideReply");
		hideReply.html("ㅡ답글숨기기");
		
		
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

		//답글수정취소버튼
		var modifyChildReplyCancel = $("<button></button>");
		modifyChildReplyCancel.html("취소")
		modifyChildReplyCancel.addClass("modifyChildReplyCancel");

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
			$("div[value=1]").remove();
			if(childReplyButton != null){
				childReplyButton.attr("hidden", false);
			}			
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
			
			childReplyButton.attr("hidden", false);
			
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
			console.log()
			oriReply.html(temporaryReply);
			oriReply.attr("contentEditable","false");
			
			$(this).closest(".replyBtns").children().remove();
			
			
			var registerChildBtn = $("<button></button>");
			registerChildBtn.html("답글")
			registerChildBtn.addClass("registerChildBtn");

			replyBtns.prepend(registerChildBtn);
			replyBtns.prepend(deleteBtn);
			replyBtns.prepend(modifyBtn);gi
		});
		
		//댓글 삭제 버튼
		$(document).on("click",".deleteReply", function(){
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			var deleteDiv = $(this).closest(".userInfo");
			console.log(deleteDiv.attr("child"));
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
			childReplyButton = $(this);
			childReplyButton.attr("hidden", true);
			console.log("답글클릭 : cnt : " + clickCnt);
				if(clickCnt == 0){	
						console.log("왜 출력안돼;")
						console.log("this 출력 : " + $(this));
						$("div[value=1]").remove();
						childReplyButton.attr("hidden", false);
				}
			clickCnt = 0;
			
			var userNickname = '${loginInfo.nickname }';
			var replyWriter = $(this).closest(".replyBtns").siblings(".userProfileID").html(); //부모댓글의 닉네임
			var userInfo = $(this).closest(".userInfo");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			//--------------------------------------------------------
			var registerChildDiv = $("<div value='1'></div>");
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
			userInfo.append(registerChildDiv); //유저인포밑에 어펜드..		
			//--------------------------------------------------------  		
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
				console.log(data);
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
				if(mediaList.length>0){ //미디어가 존재하므로 캐러셀 만들어줌
					console.log("캐러셀 시작");
					var mediaRow = $("<div class='row media'></div>");
					var cei = $("<div id='carouselExampleIndicators' class='carousel slide' data-interval='false'></div>");
					var ol = $("<ol class='carousel-indicators'></ol>");
					console.log(ol.html());
					for(var i=0; i<mediaList.length; i++){
						console.log(i);
						if(i==0){
							ol.append("<li data-target='#carouselExampleIndicators' data-slide-to='0' class='active'></li>");
							console.log("i는 0");
							console.log(ol.html());
						}else{
							ol.append("<li data-targer='#carouselExampleIndicators' data-slide-to='"+i+"'></li>");
							console.log("i는 "+i);
							console.log(ol.html());
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
					
				}else{
					var mediaRow = $("<div class='media' style='height:100%;size:20px;text-align:center;vertical-align:center'></div>");
					mediaRow.append(dto.contents);
				}
				$(".modal-body1").html(mediaRow);
				
				
				var replyhtml = "";
				for(var i=0; i<replyList.length; i++){
					if(replyList[i].parent == 0){
						replyhtml += "<div class='userInfo' reply_seq='"+replyList[i].reply_seq+"'>"							
						replyhtml += "<div class='profileDiv'>"
						replyhtml += "<span class='userProfile'>"
						replyhtml += 		"<img class='userProfileImg' src=${loginInfo.profile_img } alt=''>"
						replyhtml +=   "</span>"
						replyhtml +=         	"<span class='userProfileID'>${loginInfo.nickname }</span>"
						replyhtml +=          "<span class='userReply'>"
		             	replyhtml +=       	  "<div class='replyContents'>"+replyList[i].contents+"</div>"
		             	replyhtml +=       "</span>"
		             	replyhtml +=        "</div>"	               
		             	replyhtml +=        "<div class='replyBtns'>"
		             	replyhtml +=        		"<button type='button' class='modifyReply'>수정</button><button type='button' class='deleteReply'>삭제</button>"
		             	replyhtml +=        		"<button type='button' class='registerChildBtn'>답글</button>"
		             	replyhtml +=       "</div>"			             	
		             	replyhtml +=   "</div>";
					}
				}

				
				if(mediaList.length>0){
					var dtoContents = $("<div class='dtoContents' style='display:inline-block;border:2px solid red;min-height:100px;width: 100%;padding-left: 10px;padding-top: 10px;padding-right: 10px;word-break: break-all;'></div>");
					dtoContents.append(dto.contents);
					$(".reply").append(dtoContents);
					
				}
				$(".reply").append(replyhtml);

				for(var i=0; i<replyList.length; i++){
					if(replyList[i].parent != 0){
						var childhtml = "";
						var currentSeq = replyList[i].parent;
						childhtml +=       "<div class='childReply' style='display:none' reply_seq='"+replyList[i].reply_seq+"' parent_seq='"+replyList[i].parent+"'>"
						childhtml +=     		"<span class='userProfile'>"
						childhtml +=     			"<img class='userProfileImg' src=${loginInfo.profile_img } alt='사진오류'>"
						childhtml +=      		"</span>"
						childhtml +=      		"<span class='userProfileID'>"+replyList[i].email+"</span>"
						childhtml +=      "<span class='userReply'>"
						childhtml +=      		"<div class='replyContents' contenteditable='false'>"+replyList[i].contents+"</div>"
				       	childhtml +=      "</span>"
				        childhtml +=      "<div class='replyBtns'>"
				        childhtml +=      		"<button class='modifyChildBtn'>수정</button>"
		           		childhtml +=      		"<button class='deleteChildReplyBtn'>삭제</button>"
			       		childhtml +=      "</div>"
	             		childhtml +=      "</div>";
	             		$(".userInfo[reply_seq="+currentSeq+"]").append(childhtml);
						if($(".userInfo[reply_seq="+currentSeq+"]").find(".childReply").length > 0){
							$(".userInfo[reply_seq="+currentSeq+"]").attr("child",1);
						}
					}
				}
				//댓글숨기기 
				console.log($(".userInfo").attr("child"));
				$(".userInfo[child=1]").children(".replyBtns").append(showReply);
				
				
				
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
				
				var modalBtns = $("<div></div>");
				modalBtns.addClass("modal-btns");
				modalBtns.append(likeA);
				modalBtns.append(bookmarkA);
				$(".footer-btns").append(modalBtns);
				$(".writerProfile").html("<img src="+writerProfile+" class='writerProfileImg'>");
				
			})
			$('#myInput').trigger('focus');
			
		})
		
		//답글보이기
			$(document).on("click",".showReply", function(){
			var parent_seq = $(this).closest(".userInfo").attr("reply_seq");
			var parentDiv = $(".userInfo[reply_seq="+parent_seq+"]");
			console.log(parent_seq + " ###### showReply");
			if($(".userInfo[reply_seq="+parent_seq+"]").find(".childReply").length == 0){
				userInfoDiv.attr("child",0);
			}
			parentDiv.find(".childReply").show();
			parentDiv.find(".replyBtns").children(".showReply").remove();
			parentDiv.children(".replyBtns").append(hideReply);
		});

		//답글숨기기
			$(document).on("click",".hideReply", function(){
			var parent_seq = $(this).closest(".userInfo").attr("reply_seq");
			var parentDiv = $(".userInfo[reply_seq="+parent_seq+"]");
			console.log(parent_seq + " ###### hideReply");
			if($(".userInfo[reply_seq="+parent_seq+"]").find(".childReply").length == 0){
				userInfoDiv.attr("child",0);							
				}
			childReplyButton.attr("hidden", false);
			$("div[value=1]").remove();
			parentDiv.find(".childReply").hide();
			parentDiv.find(".replyBtns").children(".hideReply").remove();
			parentDiv.children(".replyBtns").append(showReply);
		});
		
		//답글등록버튼
		$(document).on("click",".registerChildReply", function(){
			console.log(childReplyButton + "## >>>????");
			if($(".replyContents").html.length > 0){
				childReplyButton.attr("hidden", false);
			}		
			clickCnt = 1;
			var feed_seq = $("#exampleModal").attr("feed_seq");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			var childReply = $(this).closest(".childReply");
			
			childReply.attr("value", 0);
			
			var replyWriter = $(this).closest(".childReply").siblings(".profileDiv").find(".userProfileID").html(); //부모댓글의 닉네임
			var childReplyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents").html();
			var replyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var replyBtns = $(this).closest(".replyBtns");
			replyBtns.attr("value", 1);
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/registerReply",
				data : {feed_seq:feed_seq,email:'${loginInfo.email}',contents:childReplyContents,depth:1,parent:reply_seq},
				dataType:"json"		
			}).done(function(resp) {
				console.log('성공적으로 성공');
				$(".userInfo[reply_seq="+resp.parent+"]").attr("child",1);
				$(".userInfo[reply_seq="+resp.parent+"]").children(".replyBtns").append(hideReply);
				childReply.attr("parent_seq",resp.parent);
				$("div[value=1]").remove();
				replyBtns.children().remove();
				replyBtns.append(modifyChildBtn);
				replyBtns.append(deleteChildReplyBtn);
				replyContents.attr("contentEditable","false");
				childReply.attr("reply_seq",resp.reply_seq);
				clickCnt = 2;
				console.log("등록완료 : cnt : " + clickCnt);
			}).fail(function(){
				console.log("실패!");
			});
		});
		//답글삭제버튼
		$(document).on("click",".deleteChildReplyBtn", function(){
			var reply_seq = $(this).closest(".childReply").attr("reply_seq");
			var deleteDiv = $(this).closest(".childReply");
			var userInfoDiv = $(this).closest(".userInfo");
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/feed/deleteReply",
				data : {reply_seq:reply_seq}				
			}).done(function(resp) {
				console.log(resp + "행 댓글이 지워짐!");
				deleteDiv.remove();
				if($(".userInfo[reply_seq="+parent_seq+"]").find(".childReply").length == 0){
					userInfoDiv.attr("value",0);
					userInfoDiv.find(".showReply").remove();
				}
			}).fail(function(){
				alert("yes!");
			})
		});
		//답글을 취소했을 때
		$(document).on("click",".childReplyCancel", function() {
			childReplyButton.attr("hidden", false);
			$(this).closest(".childReply").remove();			
		})
		//답글버튼 눌렀을 떄
		$(document).on("click",".modifyChildBtn", function() {
			$("div[value=1]").remove(); // 빈답글 지우기
			childReplyButton.attr("hidden", false); // 답글버튼 보이기
			var oriReply = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var replyBtns = $(this).closest(".replyBtns");
			temporaryReply = oriReply.html();
			oriReply.attr("contentEditable","true");
			replyBtns.children().remove(); //버튼들 지우기~		
			replyBtns.append(modifyChildReplySuccess);
			replyBtns.append(modifyChildReplyCancel);
		})
		//답글수정취소버튼을 눌렀을 때
		$(document).on("click",".modifyChildReplyCancel", function(){
			var replyBtns = $(this).closest(".replyBtns");
			var oriReply = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			console.log(temporaryReply + "##답글수정취소버튼!");
			oriReply.html(temporaryReply);
			oriReply.attr("contentEditable","false");			
			replyBtns.children().remove(); //버튼들 지우기~
			replyBtns.append(modifyChildBtn);
			replyBtns.append(deleteChildReplyBtn);
		});
		//답글수정완료버튼을 눌렀을 때
		$(document).on("click",".modifyChildReplySuccess", function(){
			var reply_seq = $(this).closest(".childReply").attr("reply_seq");
			var oriReply = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents");
			var replyContents = $(this).closest(".replyBtns").siblings(".userReply").find(".replyContents").html();
			var currentReply = oriReply.html();
			var replyBtns = $(this).closest(".replyBtns");
			
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
			replyBtns.append(modifyChildBtn);
			replyBtns.append(deleteChildReplyBtn);
		});
		</script>