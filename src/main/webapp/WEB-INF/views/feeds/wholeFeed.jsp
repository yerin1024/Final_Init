<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whole Feed</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	#wrapper{
		margin:auto;
	}
	#search{
		margin:auto;
		text-align:center;
	}
	#contents{
		border: 2px solid black;
		width:60vw;
		min-width:470px;
		margin:auto;
		text-align:center;
	}
	
	.feed{
		width:20vw;
		height:20vw;
		min-height:150px;
		min-width:150px;
		border: 1px solid red;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="search">
			<input type="text" name="keyword" id="keyword">
		</div>
		<div id="contents">
			<c:choose>
				<c:when test="${fn:length(list) <1}">
					게시물이 없습니다.
				</c:when>
				<c:otherwise>
				<div id="feeds">
					<c:forEach items="${list }" var="feed" varStatus="status">	
						<c:if test="${status.count mod 3==1}">
						<div class="row" style="margin:0px">
						</c:if>
							<div class="col-4 feed">
							 <a href="/feed/detailView?feed_seqS=${feed.feed_seq }">${feed.title }</a>
							</div>
						<c:if test="${status.count mod 3==0}">
						</div>
						</c:if>
					</c:forEach>
				</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>