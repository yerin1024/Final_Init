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
			location.href = "${pageContext.request.contextPath}/feed/myFeed";
		})
		$("#wholeFeed").on("click", function() {
			location.href = "${pageContext.request.contextPath}/feed/wholeFeed";
		})
	

		$("#fileTest").on("click", function() {
			location.href = "/fileTest";

		})
	})
</script>
</head>
<body>
	<button type="button" id="myFeed">내 피드</button>
	<button id="wholeFeed">전체피드</button>
	



	<button type="button" id="fileTest">파일테스트</button>

</body>
</html>
