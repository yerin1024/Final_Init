<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="changeMyInfo" method="post">
<table>
<tr>
<td>이름 : <input type=text value="${dto.name} ">
<td>전화번호 : <input type=text value="${dto.phone}">
<td>생년월일 : <input type=text value="${dto.birth}">
<td>현재 비밀번호 : <input type=password >
<td>변경할 비밀번호 : <input type=password >
<td>변경 비밀번호 확인 : <input type=password >
</tr>
</table>

 </form>

 

<button type=button id="withdrawMem">회원탈퇴</button>
<button id="changeInfo">수정완료</button>
<button type=button>뒤로가기</button>
<script>
$("#withdrawMem").on("click",function(){
	location.href = "withdrawMem";
})
</script>
</body>
</html>