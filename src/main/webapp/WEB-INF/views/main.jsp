<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Init</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
*{
    box-sizing: border-box;
}
.modal-content{
    background-color: #fffefc;
}
.modal-header{
    background-color: #0f4c81;
    color: #fffefc;
}
.modal-body{
    padding: 100px;
}
#indexModalTitle{
    font-size:50px;
    font-family:'Noto Sans KR',sans-serif;
    font-weight: bold;
}
#closeBtn{
    font-size:30px;
    color: #fffefc;
}
.tab1_body{
    font-family: 'Noto Sans KR', sans-serif;
}
.tab1_body .userInput{ 
    width: 400px;
    height: 50px;
    padding: 5px;
    margin: 5px;
    border-radius: 8px;
    font-size: 15px;
}
.userInput:focus{
    outline: none;
}
#tab1_loginBtn{
    width: 400px;
    height: 50px;
    padding: 5px;
    margin: 10px;
    border: none;
    border-radius: 8px;
    font-size: 20px;
    background-color: #0f4c81;
    color: #fffefc;
}
#tab1_saveIdCheck{
    margin: 10px;
    padding: 10px;
}
.tab1_footer{
    margin-top: 10px;
}
.tab1_footer a{    
    color: #2a2b2b;
    margin: 10px;
}
a:hover{
    text-decoration: none;
    font-weight: bold;
    color: #2e5ea6;
}
.tab2_body{
    font-family: 'Noto Sans KR', sans-serif;
}
.tab2_body label{
    font-size:20px;
    font-weight:bold;
}
.tab2_body .userInput{
    width: 400px;
    height: 50px;
    padding: 5px;
    margin: 5px;
    border-radius: 8px;
    font-size: 15px;
}
.tab2_body button{
    width: 100px;
    height: 30px;
    padding: 5px;
    margin: 5px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    background-color: #0f4c81;
    color: #fffefc;
}
.tab3_body{
    font-family: 'Noto Sans KR', sans-serif;
}
.tab3_body img{
    width: 70px;
}
.tab3_body button{
    width: 100px;
    height: 30px;
    padding: 5px;
    margin: 10px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    background-color: #0f4c81;
    color: #fffefc;
}
</style>
<body>
<div class="modal fade bd-example-modal-lg" id="indexModal" tabindex="-1" role="dialog"
        aria-labelledby="eindexModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="indexModalTitle" >Init</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" id="closeBtn">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="text-align:center;">
                    <!--tab start-->
                    <div>
                        <!--tab 컨텐츠 start-->
                        <div class="tab-content">

                            <div role="tabpanel" class="tab-pane active" id="main">
                                <div class="tab1_container">
                                    <form action="${pageContext.request.contextPath}/member/loginProc.do" method="post"
                                        id="tab1_loginForm">
                                        <div class="tab1_loginContainer">
                                            <!-- <div class="tab1_header"> -->
                                                <!-- <h2 class="tab1_logo">Init</h2> -->
                                                <!-- <h5 class="tab1_title" id="tab1_title">로그인</h5> -->
                                            <!-- </div> -->
                                            <div class="tab1_body">
                                                 <input type="text" class="userInput" id="tab1_email" name="email"
                                                    placeholder="아이디 입력"><br>
                                                <input type="password" class="userInput" id="tab1_pw" name="pw"
                                                    placeholder="비밀번호 입력"><br>
                                                <button type="button" id="tab1_loginBtn"
                                                    onclick="toLogin();">로그인</button>
                                                <br>
                                                <div class="saveId">
                                                    <input type="checkbox" id="tab1_saveIdCheck"
                                                        onChange="toCheckCbox();">
                                                    <span>아이디 저장</span>
                                                </div>
                                            </div>
                                            <div class="tab1_footer">
                                                <a href="#findPw" id="goFindPW">비밀번호 찾기 </a>
                                                <span> | </span>
                                                <a href="#signUp" id="goSignUp">회원가입 </a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="findPw">
                                <div class="tab2_body">
                                    <label>비밀번호 찾기</label><br>
                                    <p>비밀번호를 찾고자 하는 이메일주소를 입력해 주세요.</p>
                                    <input type="text" class="userInput" id="tab2_email" name="email"
                                        placeholder="Init 이메일"><br>
                                    <button type="button" id="tab2_previous">이전</button>
                                    <button type="button" id="tab2_next">다음</button>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="sentEmail">
                                <div class="tab3_body">
                                    <div class="tab3_imgBox">
                                        <img id="tab3_emailImg" src="email.png">
                                    </div>
                                    <div class="tab3_textBox">
                                        <span id="tab3_userEmail"></span><br>
                                       	<span>임시비밀번호 발송이 완료되었습니다.</span><br> 
                                    </div>
                                    <div class="tab3_btnBox">
                                        <button type="button" id="tab3_goMain">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--tab 컨텐츠 end-->

                        <!--tab 링크 start-->
                        <ul class="nav nav-tabs" role="tablist" hidden>
                            <li role="presentation" class="active" id="main"><a href="#main" aria-controls="main"
                                    role="tab" data-toggle="tab" id="mainTab">Main</a></li>
                            <li role="presentation" id="findPw"><a href="#findPw" aria-controls="findPw" role="tab"
                                    data-toggle="tab" id="findPwTab">비밀번호 찾기</a>
                            </li>
                            <li role="presentation" id="sentEmail"><a href="#sentEmail" aria-controls="sentEmail"
                                    role="tab" data-toggle="tab" id="sentEmailTab">비밀번호 찾기</a>
                            </li>
                            <li role="presentation"><a href="#signUp" aria-controls="signUp" role="tab"
                                    data-toggle="tab" id="signUpTab">Messages</a></li>
                        </ul>
                        <!--tab 링크 end-->
                    </div>
                    <!--tab end-->
                </div>
            </div>
        </div>
    </div>

    <script>
        var doc = document;
        var userInput = doc.querySelectorAll(".userInput");

        window.onload = function(){
        	$("#indexModal").modal("show");
//         	doc.getElementById("indexModal").modal('show');
			toCheckCookie();
		}    

        //tab1_로그인 tab start
        var login = doc.getElementById("tab1_loginBtn");
		var saveIdCheck = doc.getElementById("tab1_saveIdCheck");
		var email = doc.getElementById("tab1_email");      		

		function toLogin() { //로그인 시도
			doc.getElementById("tab1_loginForm").submit();
		}
		
		//아이디 저장 쿠키 연관 함수 start
        var exdate = new Date();
		
		function toCheckCookie(){
			if(doc.cookie != ""){
				var cookies = cookieToJson(doc.cookie);
				email.value = cookies.userID;
				saveIdCheck.checked = true;
			}
		}
		
		function toCheckCbox(){
			if(saveIdCheck.checked == true){
				exdate.setDate(exdate.getDate()+30);
				doc.cookie = "userID=" + email.value + ";expires=" + exdate.toString();
			}else{
				exdate.setDate(exdate.getDate()-1);
				doc.cookie = "userID=" + email.value + ";expires=" + exdate.toString();
			}
		}

	   	function cookieToJson(cookie){
	   		var cookieJson = {};
	   		var cookies = doc.cookie;
	   		var trimedCookies = cookies.replace(/ /g, "");
	   		var cookieArr = trimedCookies.split(";");
	   		for(var i = 0; i < cookieArr.length; i++){
	   			var entry = cookieArr[i].split("=");
	   			cookieJson[entry[0]] = entry[1];
	   		}
	   		return cookieJson;
	   	} 
        //아이디 저장 쿠키 연관 함수 end

        doc.getElementById("goFindPW").addEventListener("click", function(){            
            clearInput(userInput, userInput.length);
            doc.getElementById("findPwTab").click();            
        }); 
        //tab1_로그인 tab end

        //tab2_비밀번호 찾기 tab start
        doc.getElementById("tab2_previous").addEventListener("click", function(){
            clearInput(userInput, userInput.length);
            doc.getElementById("mainTab").click();
        });
              
        doc.getElementById("tab2_next").addEventListener("click", function(){
            var email = doc.getElementById("tab2_email");
            console.log(email.value);
            if(email.value != ""){
            	$.ajax({
                    url :"${pageContext.request.contextPath}/member/findPwProc.do",
                    data : {email : email.value},
                    dataType : "json",
                    mehtod : "post"
                }).done(function(resp){
                    if(resp.result != "invalid"){
                    	doc.getElementById("tab3_userEmail").innerHTML = resp.result;
                        doc.getElementById("sentEmailTab").click();
                    }else{
                    	alert("등록된 이메일이 아닙니다.");
                    }
                }).fail(function(a,b,c){
                    console.log(a);
                    console.log(b);
                    console.log(c);
                });
            }else{
            	alert("이메일을 입력해 주세요.");
            }
        });
        //tab2_비밀번호 찾기 tab end

        //tab3_임시비밀번호 전송완료 안내 tab start       
        doc.getElementById("tab3_goMain").addEventListener("click", function(){
            clearInput(userInput, userInput.length);
            doc.getElementById("mainTab").click();
        }); 
        //tab3_임시비밀번호 전송완료 안내 tab end 
        
        //기타 함수 start
        function clearInput(userInput, length){ //tab 전환 시 모든 input창 clear
            for(var i = 0; i < length; i++){
                userInput[i].value = "";
            }
        }


        //기타 함수 end
    </script>
</body>
</html>