<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/script/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/script/slick/slick-theme.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/slick/slick.min.js"></script>
<script>
    $(function(){
       $("#writeFeed").on("click",function(){
          location.href = "writeFeed";
       })      
       $("#toHome").on("click",function(){
          location.href = "/home";
       })
    })
 </script>
 <style>
 	.slideImg{
 		max-width:600px;
 		max-height:600px;
 		width:600px;
 		height:600px;
 	}
 	.slideImg>*{
 		max-width:600px;
 		max-height:600px;
 		width:600px;
 		height:600px;
 	}
 	
 </style>
</head>
<div id="wrapper">
${dto.title }
${dto.contents }
</div>

<div class="slideShow" align="center" style="width: 1200px;">
	<c:forEach items="${media }" var="m" begin="0" end="5">
	${m }
	</c:forEach>
</div>
<button type="button" id="writeFeed">게시물 등록</button>
<button type="button" id="toHome">홈으로</button>
<script>
$('.slideShow').slick();
</script>
</body>
</html>