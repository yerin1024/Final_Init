<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
</head>
<body>
               
               <div class="slideShow" align="center" style="width: 1200px;">
                  <c:forEach var="i" begin="0" end="5">
                     <div class="slideDiv">
                        <img
                           src="${pageContext.request.contextPath}/resources/images/delete.png"
                           class="slideImg" style="width:500px; height:500px;">
                     </div>
               </c:forEach>
               </div>
<button type="button" id="writeFeed">게시물 등록</button>
<button type="button" id="toHome">홈으로</button>
<script>
$('.slideShow').slick();
</script>
</body>
</html>