<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	#wrapper{
		border:2px solid navy;
		margin:auto;
		text-align:center;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<form action="member/login.do" method="post" id="loginfrm">
			<span class="title">아이디</span><input type="text" name="id" id="id">
			<span class="title">비밀번호</span><input type="password" name="pw" id="pw">
		</form>
		<div class="btnDiv">
			<button type="submit" id="login">Login</button>
			<button type="button" id="signup">signup</button>
		</div>
	</div>
	<script>
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var login = document.getElementById("login");
		var signup = document.getElementById("signup");
		var loginfrm = document.getElementById("loginfrm");
		
		login.onclick = function(){
			loginfrm.submit();
		}
		signup.onclick = function(){
			location.href = "${pageContext.request.contextPath}/member/signup.do";
		}
		
	</script>
</body>
</html>