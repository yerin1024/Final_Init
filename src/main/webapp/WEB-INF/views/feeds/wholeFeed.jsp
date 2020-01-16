<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whole Feed</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
#wrapper {
	margin: auto;
}

#search {
	margin: auto;
	text-align: center;
}

#contents {
	border: 2px solid black;
	width: 60vw;
	min-width: 470px;
	margin: auto;
	text-align: center;
}

.feed {
	width: 20vw;
	height: 20vw;
	min-height: 150px;
	min-width: 150px;
	border: 1px solid red;
}

.cover {
	width: 100%;
	height: 100%;
}
</style>
<script>
var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 

$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
    if(page==1){ 
     page++;
    }else{
    	getList(page);
    	page++;
    }
}); 
 
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	if($(window).scrollTop() >= $(document).height() - $(window).height()-5){
	console.log("스크롤감지");
		if(page==1){ 
		     page++;
		    }else{
		    	getList(page);
		    	page++;
		    }
     } 
});

function getList(page){
    $.ajax({
        type : 'POST',  
        dataType : 'json', 
        data : {"page" : page},
        url : "/feed/wholeFeedAjax",
        dataType:"JSON"
    }).done(function(data){
    	console.log("data.result : "+data.result);
    	if(data.result=="false"){
    		console.log("false");
    		return 'false';
    	}
		var rnum = JSON.parse(data.rnum);
		console.log("rnum : "+rnum);
    	var list = JSON.parse(data.list);
    	var cover = JSON.parse(data.cover);
    	console.log(list);
    	var i =Number(rnum[0]);
    	console.log("rnum[0] : " +i);
    	var end = (Number(i)+list.length);
    	var index=0;
    	var data = "";
    	
    	for(i; i<end; i++){
			data = data + "<div class='col-4 feed'><a href='/feed/detailView?feed_seqS="+list[index].feed_seq+"'>"+cover[index]+"</a></div>";
			console.log(data);
			if(i%3==1){
				data = "<div class='row' style='margin:0px'>" +data;
			}
			if(i%3==0){
				data = data + "</div>";
			}
			
			index++;
    	}
    	$("#feeds").append(data); 
//			for(i; i<end; i++){
//				console.log(i);
//		    	var data = $("<div class='col-4 feed'></div>");
//		    	var a = $("<a href='/feed/detailView?feed_seqS="+list[index].feed_seq+"'>");
//		    	a.append(cover[index]);
//		    	data.append(a);
//		    	if(i%3==1){
//		    		data.before("<div class='row' style='margin:0px'>")
//		    		console.log(data);
//		    	}else if(i%3==0){
//		    		data.after("</div>");
//		    	}
//		    	$("#feeds").append(data);
//		    	index++;
//			}
	})
}
</script>
</head>
<body>
	<div id="wrapper">
		<div id="search">
			<br><br>
			<form action="wholeFeed" method="post">
				<input type="text" name="keyword" id="keyword">
				<button>검색</button>
			</form>
			<br><br>
		</div>
<!-- 		wholeFeed는 친구검색일 경우와 피드검색일 경우로 나뉘고 default는 검색내용없이 전체피드가 나오도록 했음 -->
		<div id="contents">
			<c:if test="${option eq 'friend' }"><!-- 		친구검색일 경우 -->
				<c:choose>
					<c:when test="${fn:length(friendList) >0 }">
					<div id="feeds">
						<c:forEach items="${friendList}" var="friend">
						<div class="row">
							<div class="col-4">
								${friend.profile_img }
							</div>
							<div class="col-8">
								${friend.nickname }
							</div>
						</div>
						</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
					검색한 친구 없습니다.
					</c:otherwise>
				</c:choose>
			</c:if>

			<c:if test="${option eq 'nfriend' }"><!-- 		피드검색일 경우 -->
				<c:choose>
					<c:when test="${fn:length(list) <1}">
					게시물이 없습니다.
					</c:when>
					<c:otherwise>
						<div id="feeds">
							<c:forEach items="${list }" var="feed" varStatus="status">
								<c:if test="${status.count mod 3==1}">
									<div class="row" style="margin: 0px">
								</c:if>
								<div class="col-4 feed">
									<a href="/feed/detailView?feed_seqS=${feed.feed_seq }">${cover[status.count-1] }</a>
								</div>
								<c:if test="${status.count mod 3==0}">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>
</body>
</html>