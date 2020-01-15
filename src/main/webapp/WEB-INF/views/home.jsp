<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#myFeed").on("click", function() {
			location.href = "feed/myFeed";
		})
		$("#wholeFeed").on("click", function() {
			location.href = "feed/wholeFeed";
		})
		$("#scrap").on("click",function(){
			location.href = "feed/scrapFeed";
		})
		$("#friendFeed").on("click", function(){
			location.href = "feed/getFriendFeed";
		})
		$("#myInformation").on("click", function() {
			location.href = "member/goMyInfo";
		})
		
	})
</script>
</head>
<body>
	<button id="myFeed">내 피드</button>
	<button id="wholeFeed">전체피드</button><br>
	<button id="scrap">나의 스크랩피드</button>
	<button id="friendFeed">친구피드</button><br>
	<button id="myInformation">회원 정보 수정</button>
	
</body>
</html>
