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
	<form action="${pageContext.request.contextPath}/guest/signUp.do"
		method="post" id="signUpForm">
		<div class="container">
			<div class="signUpContainer">
				<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
					aria-labelledby="loginModalTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="title">회원가입</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<label>이메일</label> <input type="text" class="email1"
									name="email1"> <input type="text" class="email2"
									name="email2" onChange="changeDomail(this)">
								<!-- <input type="text" class="inputEmail2" name="inputEmail2" hidden> -->
								<input type="text" class="email" name="email" hidden> <select
									class="emailSelect" " name="emailSelect"
									onChange="changeSelect(this)">
									<option value="custom" placeholder="직접입력">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="yahoo.com">yahoo.com</option>
								</select> <br> <label>비밀번호</label> <input type="password"
									class="inputPw" name="pw"><br> <label>닉네임</label>
								<input type="text" class="inputNickname" name="nickname"><br>
								<label>전화번호</label> <select class="phone1" name="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> -<input type="text" class="phone2" name="phone2"> -<input
									type="text" class="phone3" name="phone3"> <input
									type="text" class="phone" name="phone" hidden> <input
									type="text" class="verif_code" name="verif_code"
									placeholder="인증번호">
								<button type="button" class="sendCode">send</button>
								<br> <label>생년월일</label> fff<br> <label>프로필 사진</label>
								<p class="profile_img_show"></p>
								<input type="file" class="profile_img" name="profile_img"><br>
								<label>상태 메세지</label> <input type="text" class="profile_msg"
									name="profile_msg">
							</div>
							<div class="modal-footer">
								<button type="button" class="signupBtn" onclick="signUp()">가입</button>
								<button type="button" class="cancelBtn">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
        var doc = document;
        // Regex
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/; // 암호 문자, 숫자 포함 6-12자리
        var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/; // 이메일 정규식

        var email = doc.getElementsByClassName("email")[0];
        var email1 = doc.getElementsByClassName("email1")[0];
        var email2 = doc.getElementsByClassName("email2")[0];
        
      
        email1.addEventListener("keyup", function(){
            var rawStr = email1.value;
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
            if(regExp.test(rawStr)){
                console.log("OK");
            }else{
                console.log("Nope");
            }
        });

        email2.addEventListener("keyup", function(){
            var rawStr = email2.value;
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
        })


        function changeSelect(email){
            var selected = email[email.selectedIndex].value;
            if(selected == "custom"){ //직접 입력
                email2.value = "";
                email2.disabled = false;
                window.setTimeout(function(){
                    email2.focus();
                }, 0);
            }else{ //이메일 선택
                email2.value = selected;
                email2.disabled = true;
            }
        }

        function signUp(){
            email.value = email1.value + "@" + email2.value;
            console.log("완성 이메일 : " + email.value);
        }
    </script>
</body>
</html>