<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Black</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
.wdBtn,.cbBtn {
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

/* All Device */
/* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. */

/* Mobile Device */
/* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device */
@media all and (min-width:768px) {
   /*     사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
}

@media all and (max-width:768px) {
   /*     사용자 해상도가 768px 이하일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
/*    .list-group>li{ */
/*    	text-align:center; */
/*    } */
}

/* Tablet Device */
@media all and (min-width:768px) and (max-width:1024px) {
   /*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
}

/* Desktop Device */
@media all and (min-width:1025px) {
   /*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12 col-md-2">
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
			<div class="col-sm-12 col-md-10">
				<div class="row">
					<div class="col-sm-12">
						<h3>블랙리스트 관리</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12" id="searchDiv">
						<form action="${pageContext.request.contextPath}/admin/searchForBlack.do" method="post" id="searchF">
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
									<th>profile</th>
									<th>nickname</th>
									<th>name</th>
									<th>email</th>
									<th>edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${blackList}" var="mdto">
									<tr>
										<td>
										<div class="profileImgBox">
											<img class="profileImg" src="${mdto.profile_img}" alt="">
										</div>
										</td>
										<td>${mdto.nickname}</td>
										<td>${mdto.name}</td>
										<td>${mdto.email}</td>
										<td><button type="button" class="wdBtn btn-danger"
												id="out_${mdto.email}">탈퇴</button>
											<button type="button" class="cbBtn btn-success"
												id="cb_${mdto.email}">되살리기</button></td>
									</tr>
								</c:forEach>
								<tr align=center>
									<td colspan=5>${pageNavi}</td>
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
	$(".wdBtn").on("click", function() {
		var withdrawal = $(this).attr("id");
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/withdrawalProc.do",
			type : "post",
			data : {
				withdrawal : withdrawal
			}
		}).done(function(resp) {
			if (resp == withdrawal) {
				alert("탈퇴되었습니다.");
				location.reload();
			} else {
				alert("탈퇴시키는 것에 실패하셨습니다.");
				location.reload();
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
			if (resp == cbMember) {
				alert("멤버로 되살렸습니다.");
				location.reload();
			} else {
				alert("멤버 되살리는 것에 실패하셨습니다.");
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