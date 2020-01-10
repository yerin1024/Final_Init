<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Init</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<style>
.close {
	border: none;
}

a {
	text-decoration: none;
	color: black;
}

.modal-header {
	width: 300px;
	text-align: center;
}

.modal-body {
	width: 300px;
	text-align: center;
}

.inputEmail, .inputPw, .loginBtn {
	width: 100%;
	height: 30px;
	margin-top: 10px;
}

.saveId {
	margin-top: 10px;
}

.modal-footer {
	width: 300px;
	margin-top: 10px;
	text-align: center;
}
</style>
<body>
	<form action="${pageContext.request.contextPath}/member/loginProc.do"
		method="post" id="loginForm">
		<div class="container">
			<div class="loginContainer">
				<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
					aria-labelledby="loginModalTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="title">로그인</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<input type="text" id="inputEmail" name="email"
									placeholder="아이디 입력"><br> <input type="password"
									id="inputPw" name="pw" placeholder="비밀번호 입력"><br>
								<button type="button" class="loginBtn"
									onclick="toLogin();">Login</button>
								<br>
								<div class="saveId">
									<input type="checkbox" id="saveIdCheck" onChange="toCheckCbox();"> <span>아이디
										저장</span>
								</div>
							</div>
							<div class="modal-footer">
								<a href="" class="findId">아이디 찾기</a> <span> | </span> <a href=""
									class="findPw">비밀번호 찾기</a> <span> | </span> <a
									href="${pageContext.request.contextPath}/guest/signUp.do"
									class="signUp">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>		
		var doc = document;
		var login = doc.getElementsByClassName("loginBtn");
		var saveIdCheck = doc.getElementById("saveIdCheck");
		var email = doc.getElementById("inputEmail");
		
		window.onload = function(){
			toCheckCookie();
		}

		function toLogin() {
			doc.getElementById("loginForm").submit();
		}
		
		var exdate = new Date();
		
		function toCheckCookie(){
			if(doc.cookie != ""){
				var cookies = cookieToJson(doc.cookie);
				email.value = cookies.userID;
				saveIdCheck.checked = true;
			}
		}
		
		function toCheckCbox(){
			if(saveIdCheck.checked == true){
				exdate.setDate(exdate.getDate()+30);
				doc.cookie = "userID=" + email.value + ";expires=" + exdate.toString();
			}else{
				exdate.setDate(exdate.getDate()-1);
				doc.cookie = "userID=" + email.value + ";expires=" + exdate.toString();
			}
		}

	   	function cookieToJson(cookie){
	   		var cookieJson = {};
	   		var cookies = doc.cookie;
	   		var trimedCookies = cookies.replace(/ /g, "");
	   		var cookieArr = trimedCookies.split(";");
	   		for(var i = 0; i < cookieArr.length; i++){
	   			var entry = cookieArr[i].split("=");
	   			cookieJson[entry[0]] = entry[1];
	   		}
	   		return cookieJson;
	   	}
	</script>
</body>
</html>