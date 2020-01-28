<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminHome</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 3px;
}
#loginForm{
	width: 400px;
	text-align: center;
	background-color: rgba(0, 0, 0, 0.04);
	margin: auto;
	padding: 20px;
	font-weight: bolder;
	border-radius: 20px
}

button {
	color: white;
	border-style: none;
	background-color: rgb(75, 133, 222);
	margin: auto;
	margin-top:10px;
    width: 100px;
    height: 35px;
    border-radius: 5px;
}

</style>
</head>
<body>
<div id="loginForm">
<form action="member/adminLoginProc.do" method="post" id="loginProc">
<h3 id=title>관리자 로그인 </h3>
<div><label for=idL>아이디 <input type="text" id="email" name="email" placeholder="id를 입력하세요."></label></div>
<div id="idCheck"></div>
<div><label for=pwL>패스워드 <input type="password" id="pw" name="pw" placeholder="pw를 입력하세요."></label></div>
<div id=pwCheck></div>
<div><label for=remL><input type=checkbox id="remCheck">Remember your ID</label></div>
<button type=button id="loginBtn">Login</button>
</form>
</div>

<script>
// 로그인
$("#loginBtn").on("click",function(){
	$("#loginProc").submit();
});
//쿠키
$("#remCheck").on("click",function(){
	var exDate = new Date();
	if($("#remCheck").prop("checked")){
		exDate.setDate(exDate.getDate() + 30);
		var id = $("#id").val();
		var pw = $("#pw").val();
		document.cookie = "id" + id + ";expires=" + exDate.toString();
		docoment.cookie = "pw" + pw + ";expires=" + exDate.toString();
	}else{
		exDate.setDate(exDate.getDate() - 1);
		document.cookie = "id;expires=" + exDate.toString();
	}
})
function cookieJson(){
	var cookieJSON = {};
	var cookie = document.cookie;
	var trimedCookie = cookie.replace(/ /g, "");
	var entryArr = trimedCookie.split(";");
	for(var i=0; i<entryArr.length; i++){
		var entry = entryArr[i].split("=");
		cookieJSON[entry[0]] = entry[1];
	}
	return cookieJSON;
}
if(document.cookie != ""){
	var cookie = cookieJson();
	$("#id").val(cookie.id);
	$("#pw").val(cookie.pw);
	$("#remCheck").prop("checked","true");
}
</script>
</body>
</html>