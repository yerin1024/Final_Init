<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<button id="mBlack">블랙리스트 관리</button>
<button id="mMember">멤버 관리</button>
<script>
$("#mBlack").on("click",function(){
	location.href="${pageContext.request.contextPath}/admin/blackList.do";
});
$("#mMember").on("click",function(){
	location.href="${pageContext.request.contextPath}/admin/memberList.do";
});

</script>
</body>
</html>