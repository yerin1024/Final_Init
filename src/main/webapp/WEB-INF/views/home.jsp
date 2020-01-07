<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$("#myFeed").on("click",function(){
			location.href = "feed/myFeed";
		})
		$("#wholeFeed").on("click",function(){
			location.href = "feed/wholeFeed";
		})
		$("#myInformation").on("click",function(){
			location.href = "member/goMyInfo";
		})
	})
</script>
</head>
<body>	
	<button type="button" id="myFeed">내 피드</button> <button id="wholeFeed">전체피드</button>
	<button type="button" id="writeFeed">게시물 등록</button> <button id="wholeFeed">전체피드</button>
	<button type="button" id="myInformation">회원 정보 수정</button>
</body>
</html>
