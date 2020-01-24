<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/member/changeMyInfo"
		method="post" id="signUpForm">
		<div class="header">
			<h5 id="modifyInfoTitle">정보 수정</h5>
		</div>
		<div class="body">
			<!-- 이메일 -->
			<label>이메일</label>
			<br> 
			<div class="userInput" id="email">${dto.email}</div>
			<!-- 비밀번호 -->
			<label>현재 비밀번호</label>
			
			
			<label>비밀번호</label><span class="required">*</span><br> <input
				type="password" class="userInput" autocomplete="off" id="pw"
				name="pw" maxlength="12" placeholder="비밀번호(영문 대소문자, 숫자 6~15자리)">
			<!-- 비밀번호 확인 -->
			<input type="password" class="userInput" autocomplete="off"
				id="confirmPw" maxlength="12" placeholder="비밀번호 재입력"><br>
			<p class="advise" id="advisePw" readonly></p>
			<p class="hiddenResp" id="hiddenRespPw" hidden></p>
			<!-- 이름 -->
			<label>이름</label><span class="required">*</span class="required"><br> <input
				type="text" class="userInput" id="name" name="name"
				maxlength="70">
			<p class="advise" id="adviseName" readonly></p>
			<p class="hiddenResp" id="hiddenRespName" hidden></p>
			<!-- 닉네임 -->
			<label>닉네임</label><span class="required">*</span class="required"><br> <input
				type="text" class="userInput" id="nickname" name="nickname"
				maxlength="20" placeholder="닉네임(영문 대소문자, 숫자, 특수문자(_) 4~20자리)">
			<p class="advise" id="adviseNickname" readonly></p>
			<p class="hiddenResp" id="hiddenRespNickname" hidden></p>
			<!-- 생년월일 -->
			<label>생년월일</label><span class="required">*</span class="required"><br> <select
				name="year" id="birthYear">
				<option class="bOption1">선택하세요.</option>
			</select> <select name="month" id="birthMonth">
				<option class="bOption2">선택하세요.</option>
			</select> <select name="day" id="birthDay">
				<option class="bOption3">선택하세요.</option>
			</select> <input type="text" id="birth" name="birth" hidden><br>
			<p class="advise" id="adviseBirth" readonly></p>
			<p class="hiddenResp" id="hiddenRespBirth" hidden></p>
			<!-- 전화번호 -->
			<label>전화번호</label><span class="required">*</span class="required"><br> <select
				id="phone1"
				style="text-align: center; width: 80px; height: 30px">
				<option class="pOption1" value="010">010</option>
				<option class="pOption1" value="011">011</option>
				<option class="pOption1" value="016">016</option>
				<option class="pOption1" value="017">017</option>
				<option class="pOption1" value="018">018</option>
				<option class="pOption1" value="019">019</option>
			</select> - <input type="text" id="phone2" maxlength="4"
				style="text-align: center; width: 80px;" value="${poption2}"> - <input
				type="text" id="phone3" maxlength="4"
				style="text-align: center; width: 80px;" value="${poption3}"> <input type="text"
				id="phone" name="phone" maxlength="11" hidden>
			<p class="advise" id="advisePhone" readonly></p>
			<p class="hiddenResp" id="hiddenRespPhone" hidden></p>
			<!-- 인증번호 -->
			<input type="text" id="verifyCode" name="verifyCode"
				placeholder="인증번호 입력" maxlength="6" style="text-align: center;">
			<button type="button" id="sendCode" onclick="checkOverlap();">인증번호
				전송</button>
			<span id="timer" readonly></span>
			<button type="button" id="resendCode"
				onclick="checkOverlap();" hidden>인증번호 재전송</button>
			<br>
			<button type="button" id="confirmVerifyCode"
				onclick="confirmVerifCode();" hidden>인증번호 확인</button>
			<br>
			<p class="advise" id="adviseVerifCode" readonly></p>
			<p class="hiddenResp" id="hiddenRespVerifCode" hidden></p>
		</div>
		<div class="footer">
			<button type=button id="withdrawMem">회원탈퇴</button>
			<button type=button id="changeInfo" onclick="formValidation();">수정완료</button>
			<button type=button id="backToFeed">뒤로가기</button>
		</div>
	</form>

	<script>
	
	    // 입력 변수
	    var pw = doc.getElementById("pw");
	    var confirmPw = doc.getElementById("confirmPw");
	    var username = doc.getElementById("name");
	    var birthYear = doc.getElementById("birthYear");
	    var birthMonth = doc.getElementById("birthMonth");
	    var birthDay = doc.getElementById("birthDay");
	    var birth = doc.getElementById("birth");
	    var phone = doc.getElementById("phone");
	    var phone1 = doc.getElementById("phone1");
	    var phone2 = doc.getElementById("phone2");
	    var phone3 = doc.getElementById("phone3");
	    var verifyCode = doc.getElementById("verifyCode");
	    var sendCode = doc.getElementById("sendCode");
	    var resendCode = doc.getElementById("resendCode");
	    var confirmVerifyCode = doc.getElementById("confirmVerifyCode");
	    var timer = doc.getElementById("timer");
	
	    // 검증 실시간 확인 변수
	    var advisePw = doc.getElementById("advisePw");
	    var adviseName = doc.getElementById("adviseName");
	    var adviseBirth = doc.getElementById("adviseBirth");
	    var advisePhone = doc.getElementById("advisePhone");
	    var adviseVerifCode = doc.getElementById("adviseVerifCode");
	
	    // 검증결과 변수
	    var hiddenResp = doc.getElementsByClassName("hiddenResp");
	    var hiddenRespPw = doc.getElementById("hiddenRespPw");
	    var hiddenRespName = doc.getElementById("hiddenRespName");
	    var hiddenRespBirth = doc.getElementById("hiddenRespBirth");
	    var hiddenRespPhone = doc.getElementById("hiddenRespPhone");
	    var hiddenVerifCode = doc.getElementById("hiddenVerifCode");
	
	    // 기타 전역 변수
	    var setTime = 300;
	    var tid = null;
	    var rawStr = null;	
	
		var dLength = $(".pOption1").length;
		for (var i = 0; i < dLength; i++) {
			if ($(".pOption1:nth-child(" + i + ")").val() == '${poption1}') {
				$(".pOption1:nth-child(" + i + ")")
						.attr('selected', 'selected');
			}
		}

		var bLength1 = $(".bOption1").length;
		for (var i = 0; i < bLength1; i++) {
			if ($(".bOption1:nth-child(" + i + ")").val() == '${boption1}'
					+ "년") {
				$(".bOption1:nth-child(" + i + ")")
						.attr('selected', 'selected');
			}
		}

		var bLength2 = $(".bOption2").length;
		for (var i = 0; i < bLength2; i++) {
			if ($(".bOption2:nth-child(" + i + ")").val() == '${boption2}'
					+ "월") {
				$(".bOption2:nth-child(" + i + ")")
						.attr('selected', 'selected');
			}
		}

		var bLength3 = $(".bOption3").length;
		for (var i = 0; i < bLength3; i++) {
			if ($(".bOption3:nth-child(" + i + ")").val() == '${boption3}'
					+ "일") {
				$(".bOption3:nth-child(" + i + ")")
						.attr('selected', 'selected');
			}
		}

		$("#withdrawMem")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/member/withdrawMem";
						})
		$("#backToFeed")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/feed/myFeed?email=${dto.email}";
						});
	</script>
</body>
</html>