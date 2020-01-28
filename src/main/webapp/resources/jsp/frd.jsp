<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<button class="profileButton" id="friendsList">＋</button>
<div class="btnText">친구목록</div>


<!-- 친구요청 모달 영역 -->
	<div id="modalBox" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
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
					<button type="button" class="btn btn-primary" id="identifyModalBtn">확인</button>
					<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 친구 목록 모달 영역 -->
	<div id="modalBox3" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myModalLabel2"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel2">친구 목록</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>
				<div style="text-align: center;">
					친구 검색 : <input type=text placeholder=이름,닉네임 id="searchFriends"
						value="">
				</div>
				<div class="modal-body2"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="identifyModalBtn2">확인</button>
					<button type="button" class="btn btn-default" id="closeModalBtn3">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 친구 수락 모달 영역 -->
	<div id="modalBox1" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
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
					<button type="button" class="btn btn-default" id="closeModalBtn1">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 친구 특징 버튼 모달 영역 -->
	<div id="modalBox2" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 관계 설정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>

				<div class="modal-body2">
					
						<button type=button class="frcutfr" name="${mvo.email }">친구 끊기</button> 
						
						
					
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" id="closeModalBtn2">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="modalBox4" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">친구 관계 설정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>

				<div class="modal-body4">
					
					<input type=radio name="crelation" value="3"> 절친<br> 
					<input type=radio name="crelation" value="2"> 친구<br> 
					<input type=radio name="crelation" value="1" checked="checked"> 아는 사람<br>
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default" id="closeModalBtn4">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		
	$('#closeModalBtn2').on('click', function() {

		$('#modalBox3').modal('hide');

	});
	$('#identifyModalBtn2').on('click', function() {

		$('#modalBox3').modal('hide');
	});

	$('#openModalBtn').on('click', function() {
		$('#modalBox').modal('show');
	});
	
	$('#openFrModal').on('click', function() {
		$('#modalBox2').modal('show');
	});
	$('#closeModalBtn2').on('click', function() {
		$('#modalBox2').modal('hide');
	});
	
	// 모달 안의 취소 버튼에 이벤트를 건다.	
	$('#closeModalBtn').on('click', function() {
		$('#modalBox').modal('hide');
	});
	$('#closeModalBtn3').on('click', function() {
		$('#modalBox3').modal('hide');
	});
	
	$('#closeModalBtn1').on('click', function() {
		$('#modalBox1').modal('hide');
	});
	
	
	//친구 끊기
    $(".frcutfr").on("click", function () {
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
                alert("친구취소가 완료되었습니다.");
                $('#modalBox2').modal('hide');
                $(".btn-lg").remove();
                $(".btnText").remove();
                $(".profileLayoutLeft").append("<button class=btn btn-primary btn-lg id=openModalBtn >＋</button><div class=btnText>친구요청</div>");
               location.reload();
                
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
	
	
	</script>
	
	
	

