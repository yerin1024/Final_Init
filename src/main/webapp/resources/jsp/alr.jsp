<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 친구요청 모달 영역 -->
	<div id="friendApply" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color:#171C28; color:gainsboro;">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 관계 설정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>

				<div class="modal-body">
					
						<input type=radio name="relation" value="3"> 절친<br>
					<input type=radio name="relation" value="2"> 친구<br>
					<input type=radio name="relation" value="1" checked="checked"> 아는 사람<br>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="identifyBtn">확인</button>
					<button type="button" class="btn btn-default" id="closeBtn">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 친구 목록 모달 영역 -->
	<div id="friendListModal" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myModalLabel2"
		style="margin-top:5%; margin-left:32%;">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color:#171C28;">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel2" style="color:gainsboro;">친구 목록</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color:white;">×</span>
					</button>

				</div>
				<div style="text-align: center; background-color:#171C28; color:gainsboro; margin:20px;">
					친구 검색 : <input type=text placeholder=이름,닉네임 id="searchFriends"
						value="" style="background-color:gainsboro;">
				</div>
				<div class="frListBody"></div>
				<div class="modal-footer">
					
					<button type="button" class="btn" id="closefriendList" style="background-color:gainsboro;">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 친구 수락 모달 영역 -->
	<div id="acceptfrCall" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color:#171C28; color:gainsboro;">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 관계 설정</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body1">
					<input type=radio name="arelation" value="3"> 절친<br>
					<input type=radio name="arelation" value="2"> 친구<br> 
					<input type=radio name="arelation" value="1" checked="checked"> 아는 사람<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="acceptModalBtn">확인</button>
					<button type="button" class="btn btn-default" id="closeBtn1">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 친구 특징 버튼 모달 영역 -->
	<div id="friendFeature" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color:#171C28; color:gainsboro;">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 관계 설정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>

				<div class="modal-body2">
					
						<button type=button class="cutfrout" name="${mvo.email }">친구 끊기</button> 
						
						
					
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" id="closeBtn2">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
<div style="padding-top:60px;">
<!-- 		<button id=showAlarm>알람 확인하기</button> <button id=closeAlarm>알람 끄기</button> -->
		<div id="alarmPreContainer">
			<div id="alarmContainer"></div>
		</div>
		
		
<!-- 		<div class="a_ac1" id="a_ac1_1"><img src="/images/letter.png" style="width:50px;"></div> -->

	<div id="a_view1" style="background-color:white; z-index:9;">
		<div class="a_ac2">
		    <div id=a_cross>
		    <img src="/images/cancel.png" style="width:30px;">
            </div>
		</div>
          
		<div class="a_sector">
<!--           ------------------------------------------------->
<!--           ------------------------------------------------->
		</div>
    </div>
    
	</div>
	
	
	<script>
	$(document).ready(function(){
		
		// 알림 확인하기 클릭
		$(".a_ac1_nav").click(function(){
			$("div[id='a_view1']").fadeIn(0);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/alarm/alarmList.al",
				method: "post",
				data: {},
				dataType: "json"
			}).done(function(resp){
	        	 
				console.log("resp : " + resp)
				$(".a_sector").children().remove();
	        	 
	        	 if(resp.length <1){
	        		 $(".a_sector").append("<div id='noAlarmExist'>새로운 알림이 없습니다.</div>");
	        		 
	        	 }
	        	 
	        	 for(var i=0; i<resp.length; i++){
	        		 
		        	 if(resp[i].type == 'L'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		        		 
		        		 if(resp[i].liker=="${loginInfo.email}"){
		        			 $(".a_sector").append("<div class='a_pre_line_none' style='display:none;'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><b></b></div>"
			        			 		+ "<div class='a_pre_time'></div>"
			        			 		+"<button class=delAlarm>X</button></div>");
		        		 }
		             
		        		 if(resp[i].alarm_check == 'N'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"' style='background-color:#e9f1f5; color:black;'>"
		        			 		+ "<div class='a_pre_pf'><img src='/images/likeAfter.png' class='a_pre_pf_img_nr'></div>"
		        			 		+ "<div class='a_pre_text'>" + resp[i].nickname +"님이 회원님의 게시글을 좋아합니다.</div>"
		        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date_edit +"</div>"
		        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/likeAfter.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'>" + resp[i].nickname +"님이 회원님의 게시글을 좋아합니다.</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date_edit +"</div>"
			        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 }else if(resp[i].type == 'R'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		        		 
		        		 if(resp[i].replyer=="${loginInfo.email}"){
		        			 $(".a_sector").append("<div class='a_pre_line_none' style='display:none;'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><b></b></div>"
			        			 		+ "<div class='a_pre_time'></div>"
			        			 		+"<button class=delAlarm>X</button></div>");
		        		 }
		        		 
		        		 if(resp[i].alarm_check == 'N'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"' style='background-color:#e9f1f5; color:black;'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><div class='inner_profile'><img src='"+resp[i].profile_img+"' class='innerImg'></div>"
			        			 		+"<b>" + resp[i].nickname +" </b>"+resp[i].contents+"</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date_edit +"</div>"
			        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        			 
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/reply.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text'><div class='inner_profile'><img src='"+resp[i].profile_img+"' class='innerImg'></div>"
			        			 		+"<b>" + resp[i].nickname +" </b>"+resp[i].contents+"</div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date_edit +"</div>"
			        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 }else if(resp[i].type == 'F'){
		        		 var seq = resp[i].alarm_seq;
		        		 var seqId = "alarmCont"+resp[i].alarm_seq;
		             
		        		 if(resp[i].alarm_check == 'N'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"' style='background-color:#e9f1f5; color:black;'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/friendAlarm.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text friendsList' style='cursor:pointer;'>" + resp[i].nickname +"님의 친구 요청이 있습니다. </div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date_edit +"</div>"
			        			 		+"<button class=delAlarm value="+seq+" style='background-color:#e9f1f5; color:black;'>X</button></div>");
		        			 
		        		 }else if(resp[i].alarm_check == 'Y'){
		        			 $(".a_sector").append("<div class='a_pre_line "+seqId+"'>"
			        			 		+ "<div class='a_pre_pf'><img src='/images/friendAlarm.png' class='a_pre_pf_img_nr'></div>"
			        			 		+ "<div class='a_pre_text friendsList' style='cursor:pointer;'>" + resp[i].nickname +"님의 친구 요청이 있습니다. </div>"
			        			 		+ "<div class='a_pre_time'>"+ resp[i].reg_date_edit +"</div>"
			        			 		+"<button class=delAlarm value="+seq+">X</button></div>");
		        		 }
		        	 
		        	 }
	        	 }
	        	 
	        	 // 알림 삭제
	        	 $(".delAlarm").on("click",function(){
	        		 var seq = this.value;
	        		 console.log("클릭 테스트");
	        		 console.log(this.value);
	        		 
	        		 $.ajax({
	     				url:"${pageContext.request.contextPath}/alarm/delete.al",
	     				method: "post",
	     				data: {
	     					alarm_seq: seq
	     				},
	     				dataType: "json"
	     			}).done(function(resp){
	     				document.getElementById("a_ac1_1").click();
	     				
	     			}).fail(function(a,b,c){
	     				console.log(a); console.log(b); console.log(c);
	     			});
	        		 
     			 });
	        	 
//	 				------------------------------------------------------------------------------------------------------
//	        	 $('.friendsList').on('click', function () {
       		 $('.friendsList').on('click', function () {
       	        	$('#modalBox3').modal('show');
       	            $('.frInfo').remove();
       	            $.ajax({
       	                url: "${pageContext.request.contextPath}/friend/selectFndList",
       	                type: "POST",
       	                dataType: "json",
       	                success: function (res) {
       	                    console.log(res);
       	                    if (res.waitlist != null) {
       	                        var waitlist = JSON
       	                            .parse(res.waitlist);
       	                        for (var j = 0; j < waitlist.length; j++) {
       	                            $('.modal-body2').append("<div class=frInfo><a href='${pageContext.request.contextPath}/feed/myFeed?email="
       	                                + waitlist[j].email
       	                                + "'>"
       	                                + waitlist[j].email
       	                                + " </a> <button type=button class='frInfo acceptfr' name=" + waitlist[j].email + ">친구 추가</button><button type=button class='frInfo cancelfr' name=" + waitlist[j].email + ">취소</button></div>");
       	                        }
       	                    }
       	                    if (res.list != null) {
       	                        var list = JSON.parse(res.list);
       	                        for (var j = 0; j < list.length; j++) {
       	                            $('.modal-body2').append(
       	                                "<div class=frInfo><a href='${pageContext.request.contextPath}/feed/myFeed?email="
       	                                + list[j].email
       	                                + "'>"
       	                                + list[j].email
       	                                + " </a> <button type=button class='frInfo cutfr' name=" + list[j].email + ">친구 끊기</button></div>");
       	                        }
       	                    }
       	                    

       	                    //친구수락 로직~
       	                    $("#acceptModalBtn").on("click", function () {
       	                        var yr_id = $('.acceptfr').attr("name");
       	                        var relation = $('input[name=relation]').val();
       	                        console.log(yr_id);
       	                        $.ajax({
       	                            url: "${pageContext.request.contextPath}/friend/acceptFndRequest",
       	                            type: "POST",
       	                            data: {
       	                                yr_id: yr_id,
       	                                relation : relation
       	                            },
       	                            dataType: "text",
       	                            success: function (
       	                                res) {
       	                                console
       	                                    .log(res);
       	                                console
       	                                    .log(yr_id);
       	                                
//        	                                $('#friendsList').click();
       	                                $('#modalBox1').modal('hide');
       	                             	$('#modalBox3').modal('hide');
       	                                //$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

       	                                // show modal

       	                            },
       	                            error: function (
       	                                request,
       	                                status,
       	                                error) {
       	                                console.log("ajax call went wrong:"
       	                                    + request.responseText);
       	                            }
       	                        })
       	                    });
       	                    //친구 끊기
       	                    $(".cutfr").on("click", function () {
       	                        var yr_id = $(this).attr("name");
       	                        console.log(yr_id);
       	                        $.ajax({
       	                            url: "${pageContext.request.contextPath}/friend/cutFndRelation",
       	                            type: "POST",
       	                            data: {
       	                                yr_id: yr_id
       	                            },
       	                            dataType: "text",
       	                            success: function (res) {
       	                                console.log(res);
       	                                console.log(yr_id);
       	                                $('#friendsList').click();

       	                                //$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

       	                                // show modal

       	                            },
       	                            error: function (
       	                                request,
       	                                status,
       	                                error) {
       	                                console.log("ajax call went wrong:"
       	                                    + request.responseText);
       	                            }
       	                        })
       	                    });
       	                    //친구 검색
       	                    $('#searchFriends').on('keyup', function () {
       	                        var search = $(this).val();
       	                        console.log(search);
       	                        $('.frInfo').remove();
       	                        $.ajax({
       	                            url: "${pageContext.request.contextPath}/friend/searchFndList",
       	                            type: "POST",
       	                            dataType: "json",
       	                            data: {
       	                                search: search
       	                            },
       	                            success: function (res) {
       	                                console.log(res);
       	                                if (res.waitlist != null) {
       	                                    var waitlist = JSON.parse(res.waitlist);
       	                                    for (var j = 0; j < waitlist.length; j++) {
       	                                        $('.modal-body2').append("<div class=frInfo id=wfrNum" + j + "><a href='${pageContext.request.contextPath}/feed/myFeed?email="
       	                                            + waitlist[j].email
       	                                            + "'>"
       	                                            + waitlist[j].email
       	                                            + " </a> <button type=button class='frInfo acceptfr'   name=" + waitlist[j].email + ">친구 추가</button><button type=button class='frInfo cancelfr' name=" + waitlist[j].email + ">취소</button></div>");
       	                                    }
       	                                }
       	                                if (res.list != null) {
       	                                    var list = JSON.parse(res.list);
       	                                    for (var j = 0; j < list.length; j++) {
       	                                        $('.modal-body2').append(
       	                                            "<div class=frInfo id=frNum" + j + "><a href='${pageContext.request.contextPath}/feed/myFeed?email="
       	                                            + list[j].email
       	                                            + "'>"
       	                                            + list[j].email
       	                                            + " </a> <button type=button class='frInfo cutfr' name=" + list[j].email + ">친구 끊기</button></div>");

       	                                    }
       	                                }
       	                                // get the ajax response data
       	                                // var data = res.body;

       	                                // update modal content here
       	                                // you may want to format data or 
       	                                // update other modal elements here too
       	                                // 		                console.log(changedStr.waitlist);
       	                                // 		                console.log();

       	                                // show modal

       	                                //친구 검색
       	                            },
       	                            error: function (
       	                                request,
       	                                status,
       	                                error) {
       	                                console.log("ajax call went wrong:"
       	                                    + request.responseText);
       	                            }
       	                        });
       	                        

       	                    });
       	                    $('.acceptfr').on('click', function() {
       	            			$('#modalBox1').modal('show');
       	            		});
       	                    //친구요청 취소
       	                    $(".cancelfr").on("click", function () {
       	                        var yr_id = $(this).attr("name");
       	                        console.log(yr_id);
       	                        $.ajax({
       	                            url: "${pageContext.request.contextPath}/friend/rejectFndRequest",
       	                            type: "POST",
       	                            data: {
       	                                yr_id: yr_id
       	                            },
       	                            dataType: "text",
       	                            success: function (res) {
       	                                console.log(res);
       	                                
       	                                $('#friendsList').click();

       	                                //$('.modal-body2').append("<div class=frInfo>"+list[j].email+"  <button type=button class=frInfo id=cutfr name="+list[j].email+">친구 끊기</button></div>");

       	                                // show modal

       	                            },
       	                            error: function (
       	                                request,
       	                                status,
       	                                error) {
       	                                console.log("ajax call went wrong:"
       	                                    + request.responseText);
       	                            }
       	                        })
       	                    });
       	                },
       	                error: function (request, status, error) {
       	                    console.log("ajax call went wrong:"
       	                        + request.responseText);
       	                }
       	            });

       	        });
// 				------------------------------------------------------------------------------------------------------
			}).fail(function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
			})
			
		});
		
		// 알림 닫기
		$("div[id='a_cross']").click(function(){
			$("div[id='a_view1']").fadeOut(0);
			$(".a_sector").children().remove();
			
			// 알림 확인
			$.ajax({
 				url:"${pageContext.request.contextPath}/alarm/alarmCheck.al",
 				method: "post",
 				data: {},
 				dataType: "json"
 			}).done(function(resp){
 				console("알림 체크 성공");
 				
 			}).fail(function(a,b,c){
 				console.log(a); console.log(b); console.log(c);
 			});
			
			
		});
		
	});
	</script>