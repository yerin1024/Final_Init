<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Black</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
<h3>블랙리스트 관리</h3>
		<table>
			<tr>
				<th>profile</th>
				<th>nickname</th>
				<th>name</th>
				<th>email</th>
				<th>edit</th>
			</tr>
			<c:forEach items="${blackList}" var="mdto">
			<tr>
				<td>${mdto.profile_img}</td>
				<td>${mdto.nickname}</td>
				<td>${mdto.name}</td>
				<td>${mdto.email}</td>
				<td><button class="wdBtn" id="out_${mdto.email}">탈퇴</button>
					<button class="cbBtn" id="cb_${mdto.email}">되살리기</button></td>
			</tr>
			</c:forEach>
		</table>
	
</body>
<script>
	$(".wdBtn").on("click", function() {
		var withdrawal = $(this).attr("id");
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/withdrawalProc.do",
			type : "post",
			data : {
				withdrawal : withdrawal
			}
		}).done(function(resp) {
			if(resp == withdrawal){
				alert("탈퇴되었습니다.");
				console.log(withdrawal);
	
			}else{
				alert("탈퇴시키는 것에 실패하셨습니다.");
			}
	
		}).fail(function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		});
	});
	$(".cbBtn").on("click", function() {
		var cbMember = $(this).attr("id");
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/toMemberProc.do",
			type : "post",
			data : {
				cbMember : cbMember
			}
		}).done(function(resp) {
			console.log(cbMember);
			if(resp == cbMember){
				alert("멤버로 되살렸습니다.");
				console.log(cbMember);
			
			}else{
				console.log(resp);
				alert("멤버 되살리는 것에 실패하셨습니다.");
			}
		}).fail(function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		});
	});
</script>
</html>