<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>Single Frame</title>
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
	background-color: #1D4E89;
	margin: 0px;
	padding: 0px;
	height: 2000px;
}
.mainBox{
	height:1000px;
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
	max-width: 1300px;
	margin: auto;
	height: 1200px;
}
.section{
	border:1px solid black;
	height:500px;
	background-color: white;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<jsp:include page="/resources/jsp/nav.jsp" />
	<jsp:include page="/resources/jsp/alr.jsp"/>
	<jsp:include page="/resources/jsp/msg.jsp"/>
	<div class="container-fluid">
		<div class="wrapper">
			<div class="mainBox">
				<div class="row">
					<div class="d-none d-lg-block col-lg-1 m-20">
						<p></p>
					</div>
					<div class="col-lg-10 m-20 section">
						<p>Main Contents</p>
					</div>
					<div class="d-none d-lg-block col-lg-1 m-20">
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>