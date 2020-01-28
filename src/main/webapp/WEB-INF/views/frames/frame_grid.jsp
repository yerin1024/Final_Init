<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>Grid Frame</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/alr.css">
<link rel="stylesheet" href="/resources/css/msg.css">
<link rel="stylesheet" href="/resources/css/test.css">

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
	
}
html, body {
	background-color: white;
	margin: 0px;
	padding: 0px;
	height: 2000px;
}

* {
	box-sizing: border-box;
}

.mainBox {
	margin-bottom: 20px;
}

.feedBox {
	display: flex;
	height: 100%;
	margin-bottom: 20px;
}

.sectionImg {
	border: 1px solid black;
	width: 100%;
	height: 100%;
}

.feed {
	flex: 1;
}

.container-fluid {
	position: relative;
	top: 62px;
	max-width: 935px;
	padding: 60px 20px 0;
}

.wrapper {
	max-width: 1200px;
	margin: auto;
	height: 1200px;
}

.left, .middle {
	margin-right: 20px;
}

.left, .middle, .right {
	width: 33%;
}
/* 프로필 */
.profile {
	position: relative;
}

.profileMessageLayout {
	position: relative;
}

.report {
	position: relative;
	text-align: right;
	border: none;
	background-color: none;
}

.profileLayout {
	display: flex;
}

.profileLayoutLeft, .profileLayoutRight {
	margin: auto
}

.profileLayoutCenter {
	position: relative;
}

.profileImageLayOut {
	margin-right: 30px;
	width: 30%;
}

.profileImageBox {
	height: 300px;
	width: 300px;
	display: block;
}

.profileImg {
	height: 100%;
	width: 100%;
	border-radius: 160px;
	border: 1px solid black;
}

.friendRequest {
	width: 125px;
	height: 125px;
	border-radius: 80px;
	border: 1px solid black;
	background-color: white;
}

#profileEdit {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: -10px;
    border-radius: 20px;
    padding: 5px 20px;
    font-weight: bold;
    font-size: 13px;
    background-color: white;
}
#reportBtn{
    background-color: transparent;
    border: none;
}
/*This is coded CSS rainbow*/

#profileEdit:hover {
-webkit-animation:rainbow 1s infinite;
-ms-animation:rainbow 1s infinite;
-o-animation:rainbow 1s infinite;
animation:rainbow 1s infinite;
}
@-webkit-keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
@-ms-keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
@-o-keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}
@keyframes rainbow {
0% {color: #ff0000;}
10% {color: #ff8000;}
20% {color: #ffff00;}
30% {color: #80ff00;}
40% {color: #00ff00;}
50% {color: #00ff80;}
60% {color: #00ffff;}
70% {color: #0080ff;}
80% {color: #0000ff;}
90% {color: #8000ff;}
100% {color: #ff0080;}
}

.profileName {
	text-align: center;
	font-size: 70px;
	font-weight: bold;
}

.profileMessageLayout {
	margin-bottom: 50px;
}

.profileMessage {
	text-align: center;
}


/* All Device */
/* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. */

/* Mobile Device */
/* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device */
@media all and (min-width:768px) {
	/*     사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	body {
		background-color: purple;
	}
}

@media all and (max-width:768px) {
	/*     사용자 해상도가 768px 이하일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	.section {
		height: 150px;
		margin: 0px;
		padding: 0px;
	}
}
/* Tablet Device */
@media all and (max-width:1024px) {
	/*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
	.section {
		height: 250px;
		padding: 0px;
	}	
	.profileImageBox {
		height: 200px;
		width: 200px;
	}
	.friendRequest{
		width: 80px;
		height: 80px;
	}
}

/* Desktop Device */
@media all and (min-width:1025px) {
	/*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
	body {
		background-color: pink;
	}
}
</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp" />
	<jsp:include page="/resources/jsp/alr.jsp"/>
	<jsp:include page="/resources/jsp/msg.jsp"/>
	<div class="container-fluid">
		<div class="profile">
			<div class="report">
				<button type="button" id="reportBtn">ㆍㆍㆍ</button>
			</div>
			<div class="profileLayout">
				<div class="profileLayoutLeft">
					<button class="friendRequest">＋</button>
					<div class="btnText">친구요청</div>
				</div>
				<div class="profileLayoutCenter">
					<div class="profileImageBox">
						<img class="profileImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
						<button id="profileEdit">프로필 편집</button>
					</div>
				</div>
				<div class="profileLayoutRight">
					<button class="friendRequest">＋</button>
					<div class="btnText">친구요청</div>
				</div>
			</div>
			<div class="profileMessageLayout">
				<div class="profileName">KimKangSik</div>
				<div class="profileMessage">
					8만원의기적.행복콩이 부싼언니라인 이비<br> SNS마케팅그룹 부싼언니라인<br> 👑8만원으로
					부업하기<br> 👑극초기부업!! 초기선점중요해요⏰<br> 👑든든한 부싼언니와 함께할 멤버모집중<br>
					.<br> .<br> ⠀👇문의는 아래로👇<br>
					open.kakao.com/o/sG380kSb
				</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="profile"></div>
			<div class="mainBox">
				<div class="feedBox">
					<div class="left feed">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
					<div class="middle feed">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
					<div class="right feed">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
				</div>

				<div class="feedBox">
					<div class="left feed">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
					<div class="middle feed">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
					<div class="right feed">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
				</div>
				<div class="row">
					<div class="col section left">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
					<div class="col section middle">
						<img class="sectionImg"
							src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>