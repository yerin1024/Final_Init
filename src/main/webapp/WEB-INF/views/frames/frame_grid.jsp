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

<style>
html, body {
	background-color: #1D4E89;
	margin: 0px;
	padding: 0px;
	height: 2000px;
}

<<<<<<< HEAD
* {
	box-sizing: border-box;
}

=======
>>>>>>> 79d98a58b8867ad392746c6d40a14218c885b0e6
.mainBox {
	height: 1000px;
}

.container-fluid {
	position: relative;
	top: 62px;
	max-width: 935px;
	padding: 60px 20px 0;
}

.row {
	margin: 0px;
	padding: 0px;
}

.wrapper {
	max-width: 1200px;
	margin: auto;
	height: 1200px;
}

.section {
	border: 1px solid black;
<<<<<<< HEAD
	height: 300px;
=======
	height: 430px;
>>>>>>> 79d98a58b8867ad392746c6d40a14218c885b0e6
	background-color: white;
	margin-bottom: 5px;
	padding:0px;
}

.left {
	margin-right: 5px;
}

.middle {
	margin-right: 5px;
}
<<<<<<< HEAD
/* 프로필 */
.profile {
	margin: auto;
	margin-bottom: 44px;
	display: flex;
}

.profileImageLayOut {
	margin-right: 30px;
	width: 30%;
}

.profileImageBox {
	height: 150px;
	width: 150px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.profileImg {
	height: 100%;
	width: 100%;
	border-radius: 75px;
	border:1px solid black;
	transition-duration: 500ms;
}
.profileImg:hover{
	border:1px solid pink;
}

.profileInfoLayOut {
	width: 70%;
}
.userName{	
    font-size: 28px;
    line-height: 32px;
	font-weight: 600;
}
.myNames{ 
	font-weight: 600;
    font-size: 1.45rem;
}

.firstBox {
	display: flex;
    margin-bottom: 20px;
}
.friendSpan{
	margin-left:20px;
}
ul {
    margin-bottom: 20px;
    display: flex;
    list-style: none;
    padding:0px;
}

li {
    font-size: 16px;
    margin-right: 40px;	
}
.friendRequest{	
	border : 1px solid #3897f0;
    padding: 0px 24px;
    background-color: #3897f0;
    color: #fff;
    -webkit-appearance: none;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
    line-height: 26px;
}
.btns{
    margin-top: 7px;
}
.sectionImg{
	width:100%;
	height:100%;
}
=======
.profile{
	border:1px solid black;
	height:300px;
}

>>>>>>> 79d98a58b8867ad392746c6d40a14218c885b0e6
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

<<<<<<< HEAD
=======
@media all and (max-width:768px) {
	/*     사용자 해상도가 768px 이하일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다. */
	.row>.section {
		height: 200px;
	}
	.left, .right {
		display: none;
	}
}

>>>>>>> 79d98a58b8867ad392746c6d40a14218c885b0e6
/* Tablet Device */
@media all and (min-width:768px) and (max-width:1024px) {
	/*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
}

/* Desktop Device */
@media all and (min-width:1025px) {
	/*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
	body {
<<<<<<< HEAD
		background-color: pink;
=======
		background-color: blue;
>>>>>>> 79d98a58b8867ad392746c6d40a14218c885b0e6
	}
}
</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp" />
	<div class="container-fluid">
		<div class="profile">
			<div class="profileImageLayOut">
				<div class="profileImageBox">
					<img class="profileImg"
						src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
						alt="">
				</div>
			</div>
			<div class="profileInfoLayOut">
				<div class="firstBox">
					<span class="userName">insta.pig</span>
					<div class="btns">
						<span class="friendSpan">
							<button class="friendRequest">친구 추가</button>
						</span> 
						<span class="friendSpan">
							<button class="friendRequest">친구 추가</button>
						</span>
					</div>
				</div>
				<ul>
					<li><span>게시물 <span>265</span></span></li>
					<li><span>팔로워 <span>856</span></span></li>
					<li><span>팔로우 <span>200</span></span></li>
				</ul>
				<div class="nameAndMsg">
					<span class="myName">Anna</span><br>
					<span> 8만원의기적.행복콩이 부싼언니라인 이비<br> SNS마케팅그룹 부싼언니라인<br>
						👑8만원으로 부업하기<br> 👑극초기부업!! 초기선점중요해요⏰<br> 👑든든한 부싼언니와 함께할
						멤버모집중<br> .<br> .<br> ⠀👇문의는 아래로👇<br>
						open.kakao.com/o/sG380kSb
					</span>
				</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="profile">
				
			</div>
			<div class="mainBox">
				<div class="row">
					<div class="col m-20 section left">
						<img class="sectionImg"
						src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
						alt="">
					</div>
					<div class="col m-20 section middle">
						<img class="sectionImg"
						src="${pageContext.request.contextPath }/resources/images/sadCat.jpg"
						alt="">
					</div>
					<div class="col m-20 section right">
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