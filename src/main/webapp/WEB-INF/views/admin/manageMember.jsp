<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manageMember</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
.tbBtn {
	box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
	border-radius: 5px 5px 5px 5px;
}

#searchDiv {
	text-align: right;
}
.profileImgBox{
	border:1px solid black;
    border-radius: 75px;
    width: 50px;
    height: 50px;
}
.profileImg{
    width: 100%;
    height: 100%;
    border-radius: 75px;
}

</style>

</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-2 col-sm-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Menu</h3>
					</div>
					<!-- 사이드바 메뉴목록1 -->
					<ul class="list-group">
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/memberList.do">멤버관리</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/blackList.do">블랙리스트관리</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/totalFeedList.do">피드관리</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/declarationList.do">신고관리</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10 col-sm-12">
				<div class="row">
					<div class="col">
						<h3>멤버 관리</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12" id="searchDiv">
						<form action="${pageContext.request.contextPath}/admin/search.do"
							method="post" id="searchF">
							<select id="searchTag" name="searchTag">
								<option value="nickname">닉네임</option>
								<option value="name">이름</option>
								<option value="email">이메일</option>
							</select> <input type="text" id="search" name="search">
							<button type="submit" id="searchBtn" class="btn-secondary">검색</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>프로필</th>
									<th>닉네임</th>
									<th>이름</th>
									<th>이메일</th>
									<th>블랙</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memberList}" var="mdto">
									<tr class="contents">
										<td>
										<div class="profileImgBox">
											<img class="profileImg" src="${mdto.profile_img}" alt="">
										</div>
										</td>
										<td>${mdto.nickname}</td>
										<td>${mdto.name}</td>
										<td>${mdto.email}</td>
										<td><button type="button" class="tbBtn btn-dark"
												id="${mdto.email}">black</button></td>
									</tr>
								</c:forEach>
								<tr align=center id="naviTr">
									<td colspan=5 class="pageNavi">${pageNavi}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
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
			if (resp == blackMember) {
				alert("블랙리스트로 추가되었습니다.");
				location.reload();
			} else {
				alert("블랙리스트로 추가에 실패하셨습니다.");
				location.reload();
			}
		}).fail(function(a, b, c) {
			console.log(a);
			console.log(b);
			console.log(c);
		});
	});
</script>
</html>