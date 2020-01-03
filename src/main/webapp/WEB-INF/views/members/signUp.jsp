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
								<label>이메일</label> <input type="text" class="inputEmail"
									name="email" placeholder="이메일 입력"><br> <label>비밀번호</label>
								<input type="password" class="inputPw" name="pw"
									placeholder="비밀번호 입력"><br> <label>닉네임</label> <input
									type="text" class="inputNickname" name="nickname"
									placeholder="닉네임 입력"><br> <label>전화번호</label> <select
									class="phone1" name="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> -<input type="text" class="phone2" name="phone2"> -<input
									type="text" class="phone3" name="phone3"> <input
									type="text" class="verif_code" name="verif_code"
									placeholder="인증번호">
								<button type="button" class="sendCode">send</button>
								<br> <label>생년월일</label> fff<br> <label>프로필 사진</label>
								<p class="profile_img_show"></p>
								<input type="file" class="profile_img" name="profile_img">
								<label>상태 메세지</label> <input type="text" class="profile_msg"
									name="profile_msg">
							</div>
							<div class="modal-footer">
								<button type="button" class="signupBtn">가입</button>
								<button type="button" class="cancelBtn">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
        
        function signUp(){
            document.getElementById("signUpForm").submit();
        }
    </script>
</body>
</html>