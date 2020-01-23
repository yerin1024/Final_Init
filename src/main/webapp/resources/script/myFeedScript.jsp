<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script>
		function replyBtnOnclick(email) {
			var writeReply = $("#writeReply");
			var contents = writeReply.html();
			if(contents == ""){ //컨텐츠가 null 값일 경우 등록 동작 X
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
			}).fail(function(a, b, c) {
				console.log(a);
				console.log(b);
				console.log(c);
			})
		}
		
		var temporaryReply;
		var clickCnt;
		var childReplyButton;
		
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
			userInfo.append(registerChildDiv); // 유저인포밑에 어펜드..		
			
			var childReply = $(this).closest(".replyBtns").siblings(".childReply").eq(0);
			console.log(childReply);
			//--------------------------------------------------------  		
		});
		$('#exampleModal').on('shown.bs.modal', function (event) {
			var seq = $(event.relatedTarget).data('id');
			console.log("seq : "+seq);
			var feed_seq = $("#exampleModal").attr("feed_seq",seq);
			console.log("##" + feed_seq)
			$.ajax({
				type:"post",
				url:"/feed/detailView",
				data:{
					feed_seqS:seq
				},
				dataType:"json"
			}).done(function(data){
				console.log(data);
				var writerProfile = data.writerProfile;
				var likeCheck = data.likeCheck;
				var bookmarkCheck = data.bookmarkCheck;
				var mediaList = JSON.parse(data.media);
				var replyList = JSON.parse(data.replyList);
				var dto = JSON.parse(data.dto);
				console.log(mediaList.length);
				console.log(replyList.length + " : 리플라이리스트 사이즈입니다.")
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
// 					var replyList = "";
// 					for(var i=0; i<replyList.length; i++){
// 						if(replyList.parent = 0){
							
// 					replyList += "<div class='reply'>"
// 					replyList += 	"<div class='writerInfo'>"
// 					replyList +=    		"<span class='writerProfile'><img src='"+writerProfile.profile_img+"' class='writerProfileImg'></span>"
// 					replyList += 		"<span class="writerProfileID">asdsadas</span>"
// 					replyList += 		<span class="text"><p>asdasd</p></span>
// 					replyList +=    </div>     
// 					replyList += "<div class='userInfo' reply_seq='"+replyList.reply_seq+"'>"
// 					replyList += <span class="userProfile">
// 					replyList += 		<img class="userProfileImg" src="/resources/images/dog.jpg" alt="">
// 					replyList +=   </span>
// 					replyList +=           <div class="profileDiv">
// 					replyList +=         	  <span class="userProfileID">qqqqq@naver.com</span>
// 	             	replyList +=          <span class="userReply">
// 	             	replyList +=       	  <div class="replyContents">sadasd</div>
// 	             	replyList +=        </span>
// 	             	replyList +=        </div>	               
// 	             	replyList +=        <div class="replyBtns">
// 	             	replyList +=        		<button type="button" class="modifyReply">수정</button><button type="button" class="deleteReply">삭제</button>
// 	             	replyList +=        		<button type="button" class="registerChildBtn">답글</button>
// 	             	replyList +=       </div>
// 	             	replyList +=       <div class="childReply" reply_seq="968">
// 	             	replyList +=     		<span class="userProfile">
// 	               	replyList +=     			<img class="userProfileImg" src="/files/null_profile_img.jpg" alt="사진오류">
// 	               	replyList +=      		</span>
// 	             	replyList +=      		<span class="userProfileID">kimsewon</span>
// 	               	replyList +=      <span class="userReply">
// 	              	replyList +=      		<div class="replyContents" contenteditable="false">sadasd</div>
// 	               	replyList +=      </span>
// 	                replyList +=       <div class="replyBtns">
// 	                replyList +=      		<button class="modifyChildBtn">수정</button>
// 	               	replyList +=      		<button class="deleteChildReplyBtn">삭제</button>
// 	               	replyList +=      </div>
// 	               	replyList +=      </div>
// 	               	replyList +=      </div>
// 	                replyList +=      "</div>"
// 						}
// 					}
					var prevA = $("<a class='carousel-control-prev' href='#carouselExampleIndicators' role='button' data-slide='prev'></a>");
					prevA.append("<span class='carousel-control-prev-icon' aria-hidden='ture'></span>");
					prevA.append("<span class='sr-only'>Previous</span>");
					var nextA = $("<a class='carousel-control-next' href='#carouselExampleIndicators' role='button' data-slide='next'></a>");
					nextA.append("<span class='carousel-control-next-icon' aria-hidden='ture'></span>");
					nextA.append("<span class='sr-only'>Next</span>");
					
					cInner.append(prevA);
					cInner.append(nextA);
					
					cei.append(cInner);
					mediaRow.append(cei);
					$(".modal-body1").html(mediaRow);
				}
				//디테일뷰 글
				var textRow = $("<span class='text'></span>");
				textRow.append(dto.contents);
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
				
				$(".modal-btns").html("");
				$(".modal-btns").append(likeA);
				$(".modal-btns").append(bookmarkA);

				$(".writerProfile").html("<img src="+writerProfile+" class='writerProfileImg'>");
				
			})
			$('#myInput').trigger('focus');
			
		})
		
		//답글등록버튼
		$(document).on("click",".registerChildReply", function(){
			if($(".replyContents").html.length > 0){
				childReplyButton.attr("hidden", false);
			}		
			clickCnt = 1;
			var feed_seq = $("#exampleModal").attr("feed_seq");
			var reply_seq = $(this).closest(".userInfo").attr("reply_seq");
			var child_replySeq = $(this).closest(".childReply");
			
			child_replySeq.attr("value", 0);
			
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
				child_replySeq.attr("reply_seq",resp.reply_seq);
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
			$(this).closest(".replyBtns").children().remove();			
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
			$(this).closest(".replyBtns").children().remove();

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