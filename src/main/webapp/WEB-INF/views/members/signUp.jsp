<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
label {
	color: #2e291b;
	font-size: 0.8rem;
	font-weight: bold;
}

.required {
	color: #ff3300;
}
</style>
<body>
	<form action="${pageContext.request.contextPath}/guest/signUpProc.do" method="post" enctype="multipart/form-data" id="signUpForm">
		<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
			aria-labelledby="signUpModalTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h1>Init</h1>
						<h5 class="modal-title" id="signUpModalTitle">회원가입</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- 이메일 -->
						<label>이메일</label><span class="required">*</span><br> <input
							type="text" id="email1"> <span style="font-weight: bold;">@</span>
						<input type="text" id="email2" list="emailSelect"
							placeholder="직접 입력"> <input type="text" id="email"
							name="email" hidden>
						<datalist id="emailSelect">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</datalist>
						<p class="advise" id="adviseEmail" readonly></p>
						<br>
						<p class="hiddenResp" id="hiddenRespEmail" hidden></p>
						<!-- 비밀번호 -->
						<label>비밀번호</label><span class="required">*</span><br> <input
							type="password" id="pw" name="pw" maxlength="12"
							placeholder="비밀번호(영문 대소문자, 숫자 6~15자리)">
						<!-- 비밀번호 확인 -->
						<input type="password" id="confirmPw" maxlength="12"
							placeholder="비밀번호 재입력"><br>
						<p class="advise" id="advisePw" readonly></p>
						<p class="hiddenResp" id="hiddenRespPw" hidden></p>
						<!-- 이름 -->
						<label>이름</label><span class="required">*</span class="required"><br> <input
							type="text" id="originName" name="name" maxlength="70">
						<p class="advise" id="adviseName" readonly></p>
						<p class="hiddenResp" id="hiddenRespName" hidden></p>
						<!-- 닉네임 -->
						<label>닉네임</label><span class="required">*</span class="required"><br> <input
							type="text" id="nickname" name="nickname" maxlength="20"
							placeholder="닉네임(영문 대소문자, 숫자, 특수문자(_) 4~20자리)">
						<p class="advise" id="adviseNickname" readonly></p>
						<p class="hiddenResp" id="hiddenRespNickname" hidden></p>
						<!-- 생년월일 -->
						<label>생년월일</label><span class="required">*</span class="required"><br> <select
							name="year" id="birthYear">
							<option>선택하세요.</option>
						</select> <select name="month" id="birthMonth">
							<option>선택하세요.</option>
						</select> <select name="day" id="birthDay">
							<option>선택하세요.</option>
						</select> <input type="text" id="birth" name="birth" hidden><br>
						<p class="advise" id="adviseBirth" readonly></p>
						<p class="hiddenResp" id="hiddenRespBirth" hidden></p>
						<!-- 전화번호 -->
						<label>전화번호</label><span class="required">*</span class="required"><br> <select
							id="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> -<input type="text" id="phone2" maxlength="4"> -<input
							type="text" id="phone3" maxlength="4"> <input type="text"
							id="phone" name="phone" maxlength="11" hidden>
						<p class="advise" id="advisePhone" readonly></p>
						<p class="hiddenResp" id="hiddenRespPhone" hidden></p>
						<!-- 인증번호 -->
						<input type="text" id="verifyCode" name="verifyCode"
							placeholder="인증번호 입력" maxlength="6">
						<button type="button" id="sendCode" onclick="checkOverlap();">인증번호
							전송</button>
						<span id="timer" readonly></span>
						<button type="button" id="resendCode" onclick="checkOverlap();"
							hidden>인증번호 재전송</button>
						<br>
						<button type="button" id="confirmVerifyCode"
							onclick="confirmVerifCode();" hidden>인증번호 확인</button>
						<br>
						<p class="advise" id="adviseVerifCode" readonly></p>
						<p class="hiddenResp" id="hiddenRespVerifCode" hidden></p>
						<!-- 프로필 사진 -->
						<label>프로필 사진</label><br>
						<p class="advise" id="adviseProfile" readonly>*프로필 사진 미등록시
							기본이미지로 등록됩니다.</p>
						<img src="resources/default_profile_img.png" id="setProfile"
							style="width: 50px;">
						<button type="button" id="deleteProfile">X</button>
						<input type="file" id="profileImg" name="profileImg"><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" id="cancelBtn"
							data-dismiss="modal">이전</button>
						<button type="button" class="btn btn-primary" id="signupBtn"
							onclick="formValidation();">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	  <script>
    var doc = document;
    var rawStr = null;
    
    // 입력 변수
    var email = doc.getElementById("email");
    var email1 = doc.getElementById("email1");
    var email2 = doc.getElementById("email2");
    var pw = doc.getElementById("pw");
    var confirmPw = doc.getElementById("confirmPw");
    var originName = doc.getElementById("originName");
    var nickname = doc.getElementById("nickname");
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
    var setProfile = doc.getElementById("setProfile");
    var deleteProfile = doc.getElementById("deleteProfile");
    var profile_img = doc.getElementById("profileImg");

    // 검증 실시간 확인 변수
    var adviseEmail = doc.getElementById("adviseEmail");
    var advisePw = doc.getElementById("advisePw");
    var adviseName = doc.getElementById("adviseName");
    var adviseNickname = doc.getElementById("adviseNickname");
    var adviseBirth = doc.getElementById("adviseBirth");
    var advisePhone = doc.getElementById("advisePhone");
    var adviseVerifCode = doc.getElementById("adviseVerifCode");

    // 검증결과 변수
    var hiddenResp = doc.getElementsByClassName("hiddenResp");
    var hiddenRespEmail = doc.getElementById("hiddenRespEmail");
    var hiddenRespPw = doc.getElementById("hiddenRespPw");
    var hiddenRespName = doc.getElementById("hiddenRespName");
    var hiddenRespNickname = doc.getElementById("hiddenRespNickname");
    var hiddenRespBirth = doc.getElementById("hiddenRespBirth");
    var hiddenRespPhone = doc.getElementById("hiddenRespPhone");
    var hiddenVerifCode = doc.getElementById("hiddenVerifCode");

    var setTime = 300;
    var tid = null;

    window.onload = function () { //윈도우 로드 시 생년월일 select 셋팅
      appendYear();
      appendMonth();
      appendDay();
    }
    // 이메일 유효성 검사 start
    email1.addEventListener("blur", function () {
      rawStr = email1.value;
      console.log("email1: " + rawStr);
      var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          adviseEmail.innerHTML = "";
          hiddenRespEmail.innerHTML = "";
          console.log("email1 유효성 검사결과: validate");
          if (email1.value != "" && email2.value != "") {
            emailOverlapCheck();
          }
        } else {
          adviseEmail.innerHTML = "올바른 이메일 형식이 아닙니다."
          adviseEmail.style.color = "red";
          hiddenRespEmail.innerHTML = "사용불가";
          email1.focus();
          console.log("email1 유효성 검사결과: invalidate");
        }
      }
    });
    email2.addEventListener("blur", function () {
      rawStr = email2.value;
      console.log("email2: " + rawStr);
      var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          adviseEmail.innerHTML = "";
          hiddenRespEmail.innerHTML = "";
          console.log("email2 유효성 검사결과: validate");
          if (email1.value != "" && email2.value != "") {
            emailOverlapCheck();
          }
        } else {
          adviseEmail.innerHTML = "올바른 이메일 형식이 아닙니다."
          adviseEmail.style.color = "red";
          hiddenRespEmail.innerHTML = "사용불가";
          email2.focus();
          console.log("email2 유효성 검사결과: invalidate");
        }
      };
    });
    // 이메일 중복 검사 함수 start
    function emailOverlapCheck() {
      email.value = email1.value + "@" + email2.value;
      console.log("email 중복 체크  : " + email.value);
      $.ajax({
        url: "${pageContext.request.contextPath}/guest/checkEmail.do",
        data: { email: email.value },
        dataType: "json",
        type: "post"
      }).done(function (resp) {
        console.log("이메일 중복 서버 검증 결과 : " + resp.result);
        if (resp.result == "available") {
          adviseEmail.innerHTML = "사용가능";
          adviseEmail.style.color = "green";
          hiddenRespEmail.innerHTML = "사용가능";
        } else {
          adviseEmail.style.color = "red";
          adviseEmail.innerHTML = "중복된 이메일입니다.";
          hiddenRespEmail.innerHTML = "사용불가";
        }
      }).fail(function (a, b, c) {
        console.log(a);
        console.log(b);
        console.log(c);
        return false;
      });
    }
    // 이메일 중복 검사 함수 end
    email1.addEventListener("change", function () {
      adviseEmail.innerHTML = "";
    });
    email2.addEventListener("change", function () {
      adviseEmail.innerHTML = "";
    });
    // 이메일 유효성 검사 end
    // 비밀번호 유효성 검사 start
    pw.addEventListener("blur", function () {
      rawStr = pw.value;
      console.log("pw: " + rawStr);
      var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          advisePw.innerHTML = "";
          console.log("pw 유효성 검사결과: validate");
        } else {
          advisePw.innerHTML = "올바른 비밀번호 형식이 아닙니다."
          advisePw.style.color = "red";
          hiddenRespPw.innerHTML = "사용불가";
          pw.focus();
          console.log("pw 유효성 검사결과: invalidate");
        }
      }
    });

    confirmPw.addEventListener("blur", function () {
      if (rawStr.length != 0) {
        if (confirmPw.value != pw.value) {
          advisePw.innerHTML = "비밀번호가 일치하지 않습니다."
          advisePw.style.color = "red";
          hiddenRespPw.innerHTML = "사용불가";
          confirmPw.value = "";
          confirmPw.focus();
          console.log("confirmPw 일치여부: invalidate");
        } else {
          advisePw.innerHTML = "";
          hiddenRespPw.innerHTML = "사용가능";
          console.log("confirmPw 일치여부: validate");
        }
      }
    });
    
    pw.addEventListener("change", function () {
      confirmPw.value = "";
      advisePw.innerHTML = "";
    });
    //비밀번호 유효성 검사 end
    //이름 유효성 검사 start
    originName.addEventListener("blur", function () {
      rawStr = originName.value;
      console.log("name: " + rawStr);
      var regExp = /^[가-힣]{2,35}$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          console.log("name 유효성 검사결과: validate");
          adviseName.innerHTML = "";
          hiddenRespName.innerHTML = "사용가능";
        } else {
          adviseName.innerHTML = "올바른 이름이 아닙니다."
          adviseName.style.color = "red";
          hiddenRespName.innerHTML = "사용불가";
          originName.focus();
          console.log("name 유효성 검사결과: invalidate");
        }
      }
    });

    originName.addEventListener("change", function () {
      adviseName.innerHTML = "";
    });
    //이름 유효성 검사 end
    //닉네임 유효성 검사 start
    nickname.addEventListener("blur", function () {
      rawStr = nickname.value;
      console.log("nickname: " + rawStr);
      var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{2,18}[A-Za-z0-9]{1}$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          console.log("nickname 유효성 검사결과: validate");
          adviseNickname.innerHTML = "";
          // 닉네임 중복 체크 ajax
          $.ajax({
            url: "${pageContext.request.contextPath}/guest/checkNickname.do",
            data: { nickname: rawStr },
            dataType: "json",
            type: "post"
          }).done(function (resp) {
            console.log("nickname 중복 서버 검증결과: " + resp.result);
            if (resp.result == "available") {
              adviseNickname.innerHTML = "사용가능";
              adviseNickname.style.color = "green";
              hiddenRespNickname.innerHTML = "사용가능";
            } else {
              adviseNickname.innerHTML = "중복된 닉네임입니다.";
              adviseNickname.style.color = "red";
              hiddenRespNickname.innerHTML = "사용불가";
              nickname.focus();
            }
          }).fail(function (a, b, c) {
            console.log(a);
            console.log(b);
            console.log(c);
            return false;
          });
        } else {
          adviseNickname.innerHTML = "올바른 닉네임이 아닙니다."
          adviseNickname.style.color = "red";
          hiddenRespNickname.innerHTML = "사용불가";
          nickname.focus();
          console.log("nickname 유효성 검사결과: invalidate");
        }
      }
    });
    //닉네임 유효성 검사 end

    //전화번호 유효성 검사 start
    phone2.addEventListener("blur", function () {
      rawStr = phone2.value;
      console.log("phone2: " + rawStr);
      var regExp = /^[0-9]{3,4}$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          console.log("phone2 유효성 검사결과: validate");
          advisePhone.innerHTML = "";
        } else {
          advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
          advisePhone.style.color = "red";
          hiddenRespPhone.innerHTML = "사용불가";
          phone2.focus();
          console.log("phone2 유효성 검사결과: invalidate");
        }
      }
    });
    phone3.addEventListener("blur", function () {
      rawStr = phone3.value;
      console.log("phone3: " + rawStr);
      var regExp = /^[0-9]{4}$/;
      if (rawStr.length != 0) {
        if (regExp.test(rawStr)) {
          console.log("phone3 유효성 검사결과: validate");
          advisePhone.innerHTML = "";
        } else {
          advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
          advisePhone.style.color = "red";
          hiddenRespPhone.innerHTML = "사용불가";
          phone3.focus();
          console.log("phone3 유효성 검사결과: invalidate");
        }
      }
    });
    //전화번호 유효성 검사 end

    //전화번호 중복 검사 start
    function checkOverlap() {
    	console.log(tid);
    	clearInterval(tid); //기존 카운트다운 삭제
	    setTime = 300; //카운트다운 초기화
    	if(phone2.value != "" && phone3.value != ""){    		
    	      timer.innerHTML = "";
    	      phone.value = phone1.value + phone2.value + phone3.value;   	        
    	    
    	      if (phone.value != "") {
    	        $.ajax({
    	          url: "${pageContext.request.contextPath}/guest/checkOverlap.do",
    	          data: { phone: phone.value },
    	          dataType: "json",
    	          type: "post",
    	        }).done(function (resp) {
    	          console.log("phone 중복여부 서버 검증 결과: " + resp.result);    	          
    	          //전화번호 중복 검사 end
    	          //인증번호 전송 start
    	          if (resp.result == "available") {
    	        	  tid=setInterval('msg_time()', 1000); //인증번호 전송 시 카운트다운 시작 
    	        	  sendCode.hidden = true;
    	    	      resendCode.hidden = false;
    	    	      verifyCode.value = "";
    	    	      verifyCode.disabled = false;
    	    	      confirmVerifyCode.hidden = true;
    	            $.ajax({
    	              url: "${pageContext.request.contextPath}/guest/sendVerifCode.do",
    	              data: { phone: phone.value },
    	              dataType: "json",
    	              type: "post"
    	            }).done(function (resp) {
    	              console.log("인증번호 서버 전송 결과: " + resp.result);            
    	              if (resp.result != "Verify Code sent") {
    	                adviseVerifCode.innerHTML("인증번호 전송에 실패했습니다.");
    	                adviseVerifCode.style.color = "red";
    	                hiddenRespPhone.innerHTML = "사용불가";
    	                hiddenRespVerifCode.innerHTML = "인증실패";
    	                confirmVerifyCode.hidden = true;
    	                sendCode.hidden = false;
    	                resendCode.hidden = true;
    	                verifyCode.disabled = true;
    	              }else{
    	            	  console.log("인증 코드 발송 완료");
    	                  confirmVerifyCode.hidden = false;                  
    	              }              
    	            }).fail(function (a, b, c) {
    	              console.log(a);
    	              console.log(b);
    	              console.log(c);
    	            });
    	          } else if (resp.result == "unavailable") {
    	            advisePhone.innerHTML = "중복된 번호입니다.";
    	            advisePhone.style.color = "red";
    	            hiddenRespPhone.innerHTML = "사용불가";
    	          }
    	        }).fail(function (a, b, c) {
    	          console.log(a);
    	          console.log(b);
    	          console.log(c);
    	          return false;
    	        });
    	      }
 
    		}else{
    			alert("전화번호를 입력해 주세요.");
    		}    		
        }
    //인증번호 전송 end
            	    //사용자 입력 인증번호 일치여부 검사 start
    	      function confirmVerifCode() {
    	        $.ajax({
    	          url: "${pageContext.request.contextPath}/guest/verifyUser.do",
    	          data: { verifyCode: verifyCode.value },
    	          dataType: "json",
    	          type: "post",
    	        }).done(function (resp) {
    	          console.log("인증번호 서버 검증 결과 : " + resp.result);
//     	          if (resp.result == "verified") {
//     	            console.log("인증 완료 ");
    	            adviseVerifCode.innerHTML = "인증완료";
    	            adviseVerifCode.style.color = "green";
    	            hiddenRespPhone.innerHTML = "사용가능";
    	            hiddenRespVerifCode.innerHTML = "사용가능";
    	            sendCode.hidden = true;
    	            resendCode.hidden = true;
    	            verifyCode.disabled = true;
//     	          } else if (resp.result == "unverified") {
//     	            console.log("인증 실패 ");
//     	            adviseVerifCode.innerHTML = "인증실패";
//     	            adviseVerifCode.style.color = "red";
//     	            hiddenRespPhone.innerHTML = "사용불가";
//     	            hiddenRespVerifCode.innerHTML = "인증실패";
//     	            sendCode.hidden = true;
//     	            resendCode.hidden = false;
//     	            verifyCode.disabled = false;
//     	          };
    	        }).fail(function (a, b, c) {
    	          console.log(a);
    	          console.log(b);
    	          console.log(c);
    	          return false;
    	        });
    	      }
    	    //사용자 입력 인증번호 일치여부 검사 end  
          //인증번호 제한시간 이벤트 start
          function msg_time() {
            m = addzero(Math.floor(setTime / 60)) + ":" + addzero(setTime % 60);
            console.log(m);
            var msg = m;
            timer.innerHTML = msg;
            setTime--;
            if (setTime < 0) {
              clearInterval(tid);
              adviseVerifCode.innerHTML = "입력시간이 초과되었습니다.";
              adviseVerifCode.style.color = "red";
              hiddenRespPhone.innerHTML = "사용불가";
              hiddenRespVerifCode.innerHTML = "인증실패";
              confirmVerifCode.hidden = true;
              verifyCode.disabled = true;
              $.ajax({
            	  url: "${pageContext.request.contextPath}/guest/removeVerifSession.do",
                  dataType: "json",
                  type: "post",
              }).done(function(resp){
            	  if(resp.result == "Verif Code removed"){
            		  timer.innerHTML = "";
            	      sendCode.hidden = false;
            	      resendCode.hidden = true;
            	      verifyCode.value = "";
            	      verifyCode.disabled = false;
            	  }
            	  console.log("인증번호 세션 삭제 실패");
              }).fail(function(a,b,c){
            	  console.log(a);
            	  console.log(b);
            	  console.log(c);
              });
            }
          }
          function addzero(num) {
            if (num < 10) { num = "0" + num; }
            return num;
          }
          //인증번호 제한시간 이벤트 end   
        
        //프로필 사진 이벤트 start
        function readURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
              console.log("프로필 사진명 : " + profile_img.value);  // 파일명                
              setProfile.src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
          }
        }

        profile_img.addEventListener("change", function () {
          readURL(this);
        });

        deleteProfile.addEventListener("click", function () {
          setProfile.src = "resources/default_profile_img.png";
        });
        //프로필 사진 이벤트 end

        //생년월일 select option 생성 start
        function appendYear() {
          var date = new Date();
          var year = date.getFullYear();
          var selectVal = doc.getElementById("birthYear");
          var optionIndex = 0;
          for (var i = year - 100; i <= year; i++) {
            selectVal.add(new Option(i + "년", i), optionIndex++);
          }
        }

        function appendMonth() {
          var selectVal = doc.getElementById("birthMonth");
          var optionIndex = 0;
          for (var i = 1; i <= 12; i++) {
            selectVal.add(new Option(i + "월", i), optionIndex++);
          }
        }

        function appendDay() {
          var selectVal = doc.getElementById("birthDay");
          var optionIndex = 0;
          for (var i = 1; i <= 31; i++) {
            selectVal.add(new Option(i + "일", i), optionIndex++);
          }
        }
        //생년월일 select option 생성 end

        //회원가입 form submit 이벤트 start
        function formValidation() {
          //모든 입력창 유효성 결과 체크 start
          for (var i = 0; i < hiddenResp.length; i++) {
            if (hiddenResp[i].innerHTML === "사용불가") {
              console.log("유효성 통과 탈락");
              alert("잘못된 입력입니다.");
              return false;
            }
          }
          //모든 입력창 유효성 결과 체크 end  

          if(hiddenRespVerifCode.innerHTML == "인증실패"){
        	  alert("휴대폰 인증에 실패하였습니다. 다시 인증해 주세요.");
        	  verifyCode.value();
          }
          
          //모든 입력창 null 체크 start 
          if (email1.value === "") {
            adviseEmail.innerHTML = "필수 입력사항입니다."
            adviseEmail.style.color = "red";
            return false;
          } else if (email2.value === "") {
            adviseEmail.innerHTML = "필수 입력사항입니다."
            adviseEmail.style.color = "red";
            return false;
          } else if (pw.value === "") {
            advisePw.innerHTML = "필수 입력사항입니다."
            advisePw.style.color = "red";
            return false;
          } else if (confirmPw.value === "") {
            adviseConfirmPw.innerHTML = "필수 입력사항입니다."
            adviseConfirmPw.style.color = "red";
            return false;
          } else if (originName.value === "") {
            adviseName.innerHTML = "필수 입력사항입니다."
            adviseName.style.color = "red";
            return false;
          } else if (nickname.value === "") {
            adviseNickname.innerHTML = "필수 입력사항입니다."
            adviseNickname.style.color = "red";
            return false;
          } else if (birthYear.value === "선택하세요.") {
            adviseBirth.innerHTML = "필수 입력사항입니다."
            adviseBirth.style.color = "red";
            return false;
          } else if (birthMonth.value === "선택하세요.") {
            adviseBirth.innerHTML = "필수 입력사항입니다."
            adviseBirth.style.color = "red";
            return false;
          } else if (birthDay.value === "선택하세요.") {
            adviseBirth.innerHTML = "필수 입력사항입니다."
            adviseBirth.style.color = "red";
            return false;
          } else if (phone2.value === "") {
            advisePhone.innerHTML = "필수 입력사항입니다."
            advisePhone.style.color = "red";
            return false;
          } else if (phone3.value === "") {
            advisePhone.innerHTML = "필수 입력사항입니다."
            advisePhone.style.color = "red";
            return false;
          } else if (verifyCode.value === "") {
            adviseVerifCode.innerHTML = "휴대폰 인증은 필수입니다."
            adviseVerifCode.style.color = "red";
            return false;
          }
          //모든 입력창 null 체크 end 

          //전화번호, 이메일 한 줄로 조합 start
          email.value = email1.value + "@" + email2.value;
          phone.value = phone1.value + phone2.value + phone3.value;
          var month = birthMonth.value;
          var day = birthDay.value;
          if (month < 10) {
            console.log(month);
            month = "0" + month;
            console.log(month);
          }
          if (day < 10) {
            console.log(day);
            day = "0" + day;
            console.log(day);
          }
          birth.value = birthYear.value + month + day;
          //전화번호, 이메일 한 줄로 조합 end

          console.log("최종 휴대폰 : " + phone.value);
          console.log("최종 비밀번호 : " + pw.value);
          console.log("최종 이름 : " + originName.value);
          console.log("최종 닉네임 : " + nickname.value);
          console.log("최종 이메일 : " + email.value);
          console.log("최종 생년월일 : " + birth.value);

          doc.getElementById("signUpForm").submit();
        };
    //회원가입 form submit 이벤트 end
  </script>
</body>
</html>