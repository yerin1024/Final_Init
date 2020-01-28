<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

var temporaryReply;





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
			
			cei.append(cInner);
			cei.append(prevA);
			cei.append(nextA);
			mediaRow.append(cei);				
			
		}else if(mediaList.length==1){
			var mediaRow = $("<div class='row media'>"+mediaList[0]+"</div>");
		}else{
			var mediaRow = $("<div class='media' style='height:100%;width:100%;size:20px;text-align:center;vertical-align:center'></div>");
			mediaRow.append(dto.contents);
		}
		$(".modal-body5").html(mediaRow);
		
		
		var replyhtml = "";
		for(var i=0; i<replyList.length; i++){
			if(replyList[i].parent == 0){
				console.log(replyList[i].profile_img);
				replyhtml += "<div class='parentReply' reply_seq='"+replyList[i].reply_seq+"'>"							
				replyhtml += "<div class='profileDiv'>"
				replyhtml += "<span class='userProfile'>"
				replyhtml += 		"<img class='userProfileImg' src="+replyList[i].profile_img+" alt=''>"
				replyhtml +=   "</span>"
				replyhtml +=         	"<span class='userProfileID'>"+replyList[i].nickname+"</span>"
				replyhtml +=          "<span class='userReply'>"
             	replyhtml +=       	  "<div class='replyContents'>"+replyList[i].contents+"</div>"
             	replyhtml +=       "</span>"
             	replyhtml +=        "</div>"	            
             	replyhtml +=        "<div class='replyBtns'>"
                if('${loginInfo.email}' == dto.email){   
             	replyhtml +=  				"<button type='button' class='deleteReply'>삭제</button>"		
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
				childhtml +=     			"<img class='userProfileImg' src="+replyList[i].profile_img+" alt='사진오류'>"
				childhtml +=      		"</span>"
				childhtml +=      		"<span class='userProfileID'>"+replyList[i].nickname+"</span>"
				childhtml +=      "<span class='userReply'>"
				childhtml +=      		"<div class='replyContents' contenteditable='false'>"+replyList[i].contents+"</div>"
		       	childhtml +=      "</span>"
		        childhtml +=      "<div class='replyBtns'>"
			    if('${loginInfo.email}' ==  dto.email){
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
		
		var modifyA = $("<a class='modifyA' href='modifyFeedView?feed_seq="+dto.feed_seq+"'>수정</a>");
		var deleteA = $("<a class='deleteA' href='deleteProc?feed_seq="+dto.feed_seq+"'>삭제</a>");
		
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
	$("#writeReply").html("");
})
		
            
		function replyBtnOnclick(email,nickname) {	   
			var feed_seq = $("#exampleModal").attr("feed_seq");
	   		var writeReply = $("#writeReply");
			var contentsHtml = $("#writeReply").html();
			var contents = contentsHtml.replace(/(<div>|<\/div>|<br>)/g, '\r\n');
			if(contents == ""){ //컨텐츠가 null 값일 경우 등록 동작
				return false;
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
					parentReply += "<div class=\"profileDiv\"><span class=\"userProfile\"><img class=\"userProfileImg\" src=\""+data.profile_img+"\" alt=\"\"></span><span class=\"userProfileID\">"+data.nickname+"</span><span class=\"userReply\"><div class=\"replyContents\">"+data.contents+"</div></span></div>"
					parentReply += "<div class=\"replyBtns\">"
					parentReply += "<button type=\"button\" class=\"deleteReply\">삭제</button>"
					parentReply += "<button type=\"button\" class=\"registerChildBtn\">답글</button>"
					parentReply += "<button type=\"button\" class=\"showReply\" style='display:none'>────────────── 답글보기</button>"
					parentReply += "<button type=\"button\" class=\"hideReply\" style='display:none'>────────────── 답글숨기기</button>"	
					parentReply += "</div>"		
					parentReply += "</div>"
					$(".reply").append(parentReply);
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
			var feed_seq = $("#exampleModal").attr("feed_seq"); //게시글의 번호
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