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

.mainBox {
	height: 1000px;
}

.container-fluid {
	position: relative;
	top: 62px;
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
	height: 430px;
	background-color: white;
	margin-bottom: 5px;
}

.left {
	margin-right: 5px;
}

.middle {
	margin-right: 5px;
}
.profile{
	border:1px solid black;
	height:300px;
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
	.row>.section {
		height: 200px;
	}
	.left, .right {
		display: none;
	}
}

/* Tablet Device */
@media all and (min-width:768px) and (max-width:1024px) {
	/*     사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
}

/* Desktop Device */
@media all and (min-width:1025px) {
	/*     사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다. */
	body {
		background-color: blue;
	}
}
</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp" />
	<div class="container-fluid">
		<div class="wrapper">
			<div class="profile">
				
			</div>
			<div class="mainBox">
				<div class="row">
					<div class="col m-20 section left">
						<p>Contents 1</p>
					</div>
					<div class="col m-20 section middle">
						<p>Contents 2</p>
					</div>
					<div class="col m-20 section right">
						<p>Contents 3</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>