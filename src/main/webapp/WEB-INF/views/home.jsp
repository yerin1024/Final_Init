<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" href="/resources/css/nav.css">
	
	<link rel="stylesheet" href="/resources/css/msg.css">
	<link rel="stylesheet" href="/resources/css/test.css">
	<link rel="stylesheet" href="/resources/css/alr.css">
	
<script>
	$(function() {
		$("#myFeed").on("click", function() {
			location.href = "${pageContext.request.contextPath}/feed/myFeed";
		})
		$("#wholeFeed").on("click", function() {
			location.href = "${pageContext.request.contextPath}/feed/wholeFeed";
			})
		$("#messenger").on("click", function() {
			
		})

		$("#alarm").on("click", function() {

		})

		$("#fileTest").on("click", function() {
			location.href = "/fileTest";
		})
		$("#scrap").on("click", function() {
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
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp"/>
	<jsp:include page="/resources/jsp/alr.jsp"/>
	<jsp:include page="/resources/jsp/msg.jsp"/>

	<button type="button" id="myFeed">내 피드</button>
	<button id="friendFeed">친구피드</button><br>
	<button id="wholeFeed">전체피드</button>
	<button type="button" id="scrap">나의 스크랩피드</button><br>
	<button type="button" id="myInformation">회원 정보 수정</button>
	<button type="button" id="messenger">메신저</button>
	<button type="button" id="alarm">알림</button>
</body>
</html>
