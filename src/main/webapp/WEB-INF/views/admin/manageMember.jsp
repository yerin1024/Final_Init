<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manageMember</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
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
	<table>
		<tr>
			<th>프로필</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>이메일</th>
			<th>블랙</th>
		</tr>
		<c:forEach items="${memberList}" var="mdto">
			<tr>
				<td>${mdto.profile_img}</td>
				<td>${mdto.nickname}</td>
				<td>${mdto.name}</td>
				<td>${mdto.email}</td>
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
		}).done(function(resp) {
			//resp.reload();
		}).fail(function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		});
	});
</script>
</html>