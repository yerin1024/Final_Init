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
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
    <form id="findFrm" action="${pageContext.request.contextPath}/member/findPwProc.do" method="post">
        <label style="font-size:large;font-weight:bold;">비밀번호 찾기</label><br>
        <p>비밀번호를 찾고자 하는 이메일을 입력해 주세요.</p>
        <input type="text" id="email" name="email" placeholder="Init 이메일"><br>
        <button type="button" id="next">다음</button>
    </form>

    <script>
        var doc = document;
        var email = doc.getElementById("email");
        console.log(email.value);
        
        var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]@^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
                
        
        doc.getElementById("next").addEventListener("click", function(){
//         	var rawStr = email.value;
//         	console.log(rawStr);
//             if(rawStr != ""){
//             	if(regExp.test(rawStr)){
//             		doc.getElementById("findFrm").submit();
//                 }else{
//                 	alert("올바른 이메일 형식이 아닙니다.");
//                 }
//             }else{
//                 alert("이메일을 입력해 주세요.");
//             }
			doc.getElementById("findFrm").submit();
        })
    </script>
</body>
</html>