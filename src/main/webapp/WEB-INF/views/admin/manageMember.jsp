<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manageMember</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
.tbBtn {
	box-shadow: 1px 1px 1px 1px gray;
	border-radius: 5px 5px 5px 5px;
}
</style>

</head>
<body>
<h3>멤버 관리</h3>
<form action="${pageContext.request.contextPath}/admin/search.do" method="post" id="searchF">
<select>
<option value="nickname">닉네임</option>
<option value="name">이름</option>
<option value="email">이메일</option>
</select>
<input type="text" id="search"><button type=button id="searchBtn">검색</button>
</form>
	<table>
		<tr>
			<th>프로필</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>이메일</th>
			<th>블랙</th>
		</tr>
		<c:forEach items="${memberList}" var="mdto">
			<tr class=${mdto.email}>
				<td>${mdto.profile_img}</td>
				<td>${mdto.nickname}</td>
				<td>${mdto.name}</td>
				<td><a href="${pageContext.request.contextPath}/admin/goFeed.do?eamil=${mdto.email}">${mdto.email}</a></td>
				<td><button type="button" class="tbBtn btn-dark" id=${mdto.email}>black</button></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
<script>
	$(".tbBtn").on("click", function() {
		var blackMember = $(this).attr("id");
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/blackProc.do",
			type : "post",
			data : {
				blackMember : blackMember
			}
		}).done(function(resp){
			if(resp == blackMember){
				alert("블랙리스트로 추가되었습니다.");
				console.log(blackMember);
				var del = blackMember.parent().parent();
				del.remove();
				//resp.reload();
			}else{
				alert("블랙리스트로 추가하는 것에 실패하셨습니다.");
			}
		}).fail(function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		});
	});
	$("#searchBtn").on("click",function(){
		$("#searchF").submit();
	});
</script>
</html>