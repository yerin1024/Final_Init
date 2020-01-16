<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Init</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
    * {
        box-sizing: border-box;
    }

    .modal-content {
        background-color: #fffefc;
    }

    .modal-header {
        background-color: #0f4c81;
        color: #fffefc;
    }

    .modal-body {
        padding: 100px;
    }

    #indexModalTitle {
        font-size: 50px;
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: bold;
    }

    #closeBtn {
        font-size: 30px;
        color: #fffefc;
    }

    .tab1_body {
        font-family: 'Noto Sans KR', sans-serif;
    }

    .tab1_body .userInput {
        width: 400px;
        height: 50px;
        padding: 5px;
        margin: 5px;
        border-radius: 8px;
        font-size: 15px;
    }

    .userInput:focus {
        outline: none;
    }

    #tab1_loginBtn {
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
    
    #tab1_kakaoLoginBtn {
    	width: 400px;
        height: 50px;
        margin: 10px;
        border: none;
        border-radius: 8px;
    }

    #tab1_saveIdCheck {
        margin: 10px;
        padding: 10px;
    }
    
    .tab1_footer {
        margin-top: 10px;
    }

    .tab1_footer a {
        color: #2a2b2b;
        margin: 10px;
    }

    a:hover {
        text-decoration: none;
        font-weight: bold;
        color: #2e5ea6;
    }

    .tab2_body {
        font-family: 'Noto Sans KR', sans-serif;
    }

    .tab2_body label {
        font-size: 20px;
        font-weight: bold;
    }

    .tab2_body .userInput {
        width: 400px;
        height: 50px;
        padding: 5px;
        margin: 5px;
        border-radius: 8px;
        font-size: 15px;
    }

    .tab2_body button {
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

    .tab3_body {
        font-family: 'Noto Sans KR', sans-serif;
    }

    .tab3_body img {
        width: 70px;
    }

    .tab3_body button {
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

    .tab4_container {
        text-align: left;
    }

    .tab4_body .userInput {
        width: 270px;
        height: 30px;
        padding: 5px;
        margin: 5px;
        border-radius: 5px;
        /* border: 1px thin gray; */
        font-size: 11px;
        overflow:hidden;
    }

</style>

<body>
    <!-- modal popup 임시버튼 -->
    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#indexModal"
        style="margin:100px;width:200px;height:200px;">
        Modal
    </button> -->

    <!-- Modal start -->
    <div class="modal fade bd-example-modal-lg" id="indexModal" tabindex="-1" role="dialog"
        aria-labelledby="eindexModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="indexModalTitle">Init</h2>
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
                                    <form action="${pageContext.request.contextPath}/member/loginProc.do" method="post" id="tab1_loginForm">
                                        <div class="tab1_loginContainer">
                                            <div class="tab1_body">
                                                <input type="text" class="userInput" id="tab1_email" name="email" placeholder="아이디 입력"><br>
                                                <input type="password" class="userInput" id="tab1_pw" name="pw" placeholder="비밀번호 입력"><br>
                                                <button type="button" id="tab1_loginBtn" onclick="toLogin();">로그인</button><br>
                                                <a href="https://kauth.kakao.com/oauth/authorize?client_id=4f039db4ba705950489f1f29405d6c6c
&redirect_uri=http://localhost/member/kakaoLoginProc&response_type=code">
                                                	<img src="resources/images/kakao_login_btn.png" id="tab1_kakaoLoginBtn"><br>
	                                            </a>
	                                            <div class="saveId">
	                                            	<input type="checkbox" id="tab1_saveIdCheck" onChange="toCheckCbox();">
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
                                <div class="tab2_container">
                                    <div class="tab2_body">
                                        <label>비밀번호 찾기</label><br>
                                        <p>비밀번호를 찾고자 하는 이메일주소를 입력해 주세요.</p>
                                        <input type="text" class="userInput" id="tab2_email" name="email" placeholder="Init 이메일"><br>
                                        <button type="button" id="tab2_previous">이전</button>
                                        <button type="button" id="tab2_next">다음</button>
                                    </div>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="sentEmail">
                                <div class="tab3_container">
                                    <div class="tab3_body">
                                        <div class="tab3_imgBox">
                                            <img id="tab3_emailImg" src="${pageContext.request.contextPath}/resources/images/email.png">
                                        </div>
                                        <div class="tab3_textBox">
                                            <span id="tab3_userEmail"></span><br>
                                           	<span>임시비밀번호 발송이 완료되었습니다.</span>
                                        </div>
                                        <div class="tab3_btnBox">
                                            <button type="button" id="tab3_goMain">확인</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane" id="signUp">
                                <div class="tab4_container">
                                    <form action="${pageContext.request.contextPath}/guest/signUpProc.do" method="post"
                                        enctype="multipart/form-data" id="signUpForm">
                                        <div class="tab4_header">
                                            <h5 id="tab4_signUpTitle">회원가입</h5>
                                        </div>
                                        <div class="tab4_body">
                                            <!-- 이메일 -->
                                            <label>이메일</label><span class="required">*</span><br> <input type="text" class="userInput" id="tab4_email1"> 
                                                <span style="font-weight: bold;">@</span>
                                            <input type="text" class="userInput" id="tab4_email2" list="tab4_emailSelect" placeholder="직접 입력">
                                            <input type="text" id="tab4_email" name="email" class="userInput" hidden>
                                            <datalist id="tab4_emailSelect">
                                                <option value="naver.com">naver.com</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="dreamwiz.com">dreamwiz.com</option>
                                                <option value="yahoo.com">yahoo.com</option>
                                            </datalist>
                                            <p class="advise" id="adviseEmail" readonly></p>
                                            <br>
                                            <p class="hiddenResp" id="hiddenRespEmail" hidden></p>
                                            <!-- 비밀번호 -->
                                            <label>비밀번호</label><span class="required">*</span><br> 
                                            <input type="password" class="userInput" id="tab4_pw" name="pw" maxlength="12" placeholder="비밀번호(영문 대소문자, 숫자 6~15자리)">
                                            <!-- 비밀번호 확인 -->
                                            <input type="password" class="userInput" id="tab4_confirmPw" maxlength="12" placeholder="비밀번호 재입력"><br>
                                            <p class="advise" id="advisePw" readonly></p>
                                            <p class="hiddenResp" id="hiddenRespPw" hidden></p>
                                            <!-- 이름 -->
                                            <label>이름</label><span class="required">*</span class="required"><br>
                                            <input type="text" class="userInput" id="tab4_name" name="name" maxlength="70">
                                            <p class="advise" id="adviseName" readonly></p>
                                            <p class="hiddenResp" id="hiddenRespName" hidden></p>
                                            <!-- 닉네임 -->
                                            <label>닉네임</label><span class="required">*</span class="required"><br>
                                            <input type="text" class="userInput" id="tab4_nickname" name="nickname"
                                                maxlength="20" placeholder="닉네임(영문 대소문자, 숫자, 특수문자(_) 4~20자리)">
                                            <p class="advise" id="adviseNickname" readonly></p>
                                            <p class="hiddenResp" id="hiddenRespNickname" hidden></p>
                                            <!-- 생년월일 -->
                                            <label>생년월일</label><span class="required">*</span class="required"><br>
                                            <select name="year" id="tab4_birthYear">
                                                <option>선택하세요.</option>
                                            </select> <select name="month" id="tab4_birthMonth">
                                                <option>선택하세요.</option>
                                            </select> <select name="day" id="tab4_birthDay">
                                                <option>선택하세요.</option>
                                            </select> <input type="text" id="tab4_birth" name="birth" hidden><br>
                                            <p class="advise" id="adviseBirth" readonly></p>
                                            <p class="hiddenResp" id="hiddenRespBirth" hidden></p>
                                            <!-- 전화번호 -->
                                            <label>전화번호</label><span class="required">*</span class="required"><br>
                                            <select id="tab4_phone1" style="text-align:center;width:80px;height:30px">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select> - 
                                            <input type="text" id="tab4_phone2" maxlength="4" style="text-align:center;width:80px;"> - 
                                            <input type="text" id="tab4_phone3" maxlength="4" style="text-align:center;width:80px;">
                                            <input type="text" id="tab4_phone" name="phone" maxlength="11" hidden>
                                            <p class="advise" id="advisePhone" readonly></p>
                                            <p class="hiddenResp" id="hiddenRespPhone" hidden></p>
                                            <!-- 인증번호 -->
                                            <input type="text" id="tab4_verifyCode" name="verifyCode" placeholder="인증번호 입력" maxlength="6" style="text-align:center;">
                                            <button type="button" id="tab4_sendCode" onclick="checkOverlap();">인증번호 전송</button>
                                            <span id="tab4_timer" readonly></span>
                                            <button type="button" id="tab4_resendCode" onclick="checkOverlap();" hidden>인증번호 재전송</button>
                                            <br>
                                            <button type="button" id="tab4_confirmVerifyCode" onclick="confirmVerifCode();"
                                                hidden>인증번호 확인</button>
                                            <br>
                                            <p class="advise" id="adviseVerifCode" readonly></p>
                                            <p class="hiddenResp" id="hiddenRespVerifCode" hidden></p>
                                            <!-- 프로필 사진 -->
                                            <label>프로필 사진</label><br>
                                            <p class="advise" id="adviseProfile" readonly>*프로필 사진 미등록시 기본이미지로 등록됩니다.</p>
                                            <img src="resources/images/default_profile_img.png" id="tab4_setProfile" style="width: 50px;">
                                            <button type="button" id="tab4_deleteProfile">X</button>
                                            <input type="file" id="tab4_profileImg" name="profileImg"><br>
                                        </div>
                                        <div class="tab4_footer">
                                            <button type="button" id="tab4_cancelBtn" data-dismiss="modal">이전</button>
                                            <button type="button" id="tab4_signupBtn" onclick="formValidation();">회원가입</button>
                                        </div>
                                    </form>
                                </div>
                            </div>


                        </div>
                        <!--tab 컨텐츠 end-->

                        <!--tab 링크 start-->
                        <ul class="nav nav-tabs" role="tablist" hidden>
                            <li role="presentation" class="active" id="main"><a href="#main" aria-controls="main"
                                    role="tab" data-toggle="tab" id="mainTab"></a></li>
                            <li role="presentation" id="findPw"><a href="#findPw" aria-controls="findPw" role="tab"
                                    data-toggle="tab" id="findPwTab"></a>
                            </li>
                            <li role="presentation" id="sentEmail"><a href="#sentEmail" aria-controls="sentEmail"
                                    role="tab" data-toggle="tab" id="sentEmailTab"></a>
                            </li>
                            <li role="presentation" id="signUp"><a href="#signUp" aria-controls="signUp"
                                role="tab" data-toggle="tab" id="signUpTab"></a>
                            </li>
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

        window.onload = function () {
            toCheckCookie();
            $("#indexModal").modal({backdrop: 'static', keyboard: false, show: true});//일단 예제로 띄우기
            doc.getElementById("mainTab").click(); //예제 연습            
        }

        //tab1_로그인 start
        var login = doc.getElementById("tab1_loginBtn");
        var saveIdCheck = doc.getElementById("tab1_saveIdCheck");
        var email = doc.getElementById("tab1_email");

        function toLogin() { //로그인 시도
            doc.getElementById("tab1_loginForm").submit();
        }

        //아이디 저장 쿠키 연관 함수 start
        var exdate = new Date();

        function toCheckCookie() {
            if (doc.cookie != "") {
                var cookies = cookieToJson(doc.cookie);
                email.value = cookies.userID;
                saveIdCheck.checked = true;
            }
        }

        function toCheckCbox() {
            if (saveIdCheck.checked == true) {
                exdate.setDate(exdate.getDate() + 30);
                doc.cookie = "userID=" + email.value + ";expires=" + exdate.toString();
            } else {
                exdate.setDate(exdate.getDate() - 1);
                doc.cookie = "userID=" + email.value + ";expires=" + exdate.toString();
            }
        }

        function cookieToJson(cookie) {
            var cookieJson = {};
            var cookies = doc.cookie;
            var trimedCookies = cookies.replace(/ /g, "");
            var cookieArr = trimedCookies.split(";");
            for (var i = 0; i < cookieArr.length; i++) {
                var entry = cookieArr[i].split("=");
                cookieJson[entry[0]] = entry[1];
            }
            return cookieJson;
        }
        //아이디 저장 쿠키 연관 함수 end

        doc.getElementById("goFindPW").addEventListener("click", function () {
            clearInput(userInput, userInput.length);
            doc.getElementById("findPwTab").click();
        });
        //tab1_로그인 end

        //tab2_비밀번호 찾기 start
        doc.getElementById("tab2_previous").addEventListener("click", function () {
            clearInput(userInput, userInput.length);
            doc.getElementById("mainTab").click();
        });

        doc.getElementById("tab2_next").addEventListener("click", function () {
            var email = doc.getElementById("tab2_email");
            console.log(email.value);
            $.ajax({
                url: "${pageContext.request.contextPath}/member/findPwProc.do",
                data: { email: email.value },
                dataType: "json",
                mehtod: "post"
            }).done(function (resp) {
                if (resp.result == "success") {
                    doc.getElementById("sentEmailTab").click();
                }
            }).fail(function (a, b, c) {
                console.log(a);
                console.log(b);
                console.log(c);
            });
        });
        //tab2_비밀번호 찾기 end

        //tab3_임시비밀번호 전송완료 안내 start       
        doc.getElementById("tab3_goMain").addEventListener("click", function () {
            clearInput(userInput, userInput.length);
            doc.getElementById("mainTab").click();
        });
        //tab3_임시비밀번호 전송완료 안내 end 

        //tab4_회원가입 start
        doc.getElementById("goSignUp").addEventListener("click", function () {
            clearInput(userInput, userInput.length);
            doc.getElementById("signUpTab").click();
            appendYear();
            appendMonth();
            appendDay();
        });
        
        doc.getElementById("tab4_cancelBtn").addEventListener("click", function (){
        	clearInput(userInput, userInput.length);
        	doc.getElementById("mainTab").click();
        })

        // 입력 변수
        var email = doc.getElementById("tab4_email");
        var email1 = doc.getElementById("tab4_email1");
        var email2 = doc.getElementById("tab4_email2");
        var pw = doc.getElementById("tab4_pw");
        var confirmPw = doc.getElementById("tab4_confirmPw");
        var username = doc.getElementById("tab4_name");
        var nickname = doc.getElementById("tab4_nickname");
        var birthYear = doc.getElementById("tab4_birthYear");
        var birthMonth = doc.getElementById("tab4_birthMonth");
        var birthDay = doc.getElementById("tab4_birthDay");
        var birth = doc.getElementById("tab4_birth");
        var phone = doc.getElementById("tab4_phone");
        var phone1 = doc.getElementById("tab4_phone1");
        var phone2 = doc.getElementById("tab4_phone2");
        var phone3 = doc.getElementById("tab4_phone3");
        var verifyCode = doc.getElementById("tab4_verifyCode");
        var sendCode = doc.getElementById("tab4_sendCode");
        var resendCode = doc.getElementById("tab4_resendCode");
        var confirmVerifyCode = doc.getElementById("tab4_confirmVerifyCode");
        var timer = doc.getElementById("tab4_timer");
        var setProfile = doc.getElementById("tab4_setProfile");
        var deleteProfile = doc.getElementById("tab4_deleteProfile");
        var profile_img = doc.getElementById("tab4_profileImg");

        // 검증 실시간 확인 변수
        var adviseEmail = doc.getElementById("adviseEmail");
        var advisePw = doc.getElementById("advisePw");
        var adviseName = doc.getElementById("adviseName");
        var adviseNickname = doc.getElementById("adviseNickname");
        var adviseBirth = doc.getElementById("adviseBirth");
        var advisePhone = doc.getElementById("advisePhone");
        var adviseVerifCode = doc.getElementById("adviseVerifCode");

        // 검증결과 변수
        var hiddenResp = doc.getElementsByClassName("hiddenResp");
        var hiddenRespEmail = doc.getElementById("hiddenRespEmail");
        var hiddenRespPw = doc.getElementById("hiddenRespPw");
        var hiddenRespName = doc.getElementById("hiddenRespName");
        var hiddenRespNickname = doc.getElementById("hiddenRespNickname");
        var hiddenRespBirth = doc.getElementById("hiddenRespBirth");
        var hiddenRespPhone = doc.getElementById("hiddenRespPhone");
        var hiddenVerifCode = doc.getElementById("hiddenVerifCode");

        // 기타 전역 변수
        var setTime = 300;
        var tid = null;
        var rawStr = null;

        // window.onload = function () { //윈도우 로드 시 생년월일 select 셋팅
            
        // }
        // 이메일 유효성 검사 start
        email1.addEventListener("blur", function () {
            rawStr = email1.value;
            console.log("email1: " + rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    adviseEmail.innerHTML = "";
                    hiddenRespEmail.innerHTML = "";
                    console.log("email1 유효성 검사결과: validate");
                    if (email1.value != "" && email2.value != "") {
                        emailOverlapCheck();
                    }
                } else {
                    adviseEmail.innerHTML = "올바른 이메일 형식이 아닙니다."
                    adviseEmail.style.color = "red";
                    hiddenRespEmail.innerHTML = "사용불가";
                    email1.focus();
                    console.log("email1 유효성 검사결과: invalidate");
                }
        }
        });
        email2.addEventListener("blur", function () {
            rawStr = email2.value;
            console.log("email2: " + rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    adviseEmail.innerHTML = "";
                    hiddenRespEmail.innerHTML = "";
                    console.log("email2 유효성 검사결과: validate");
                    if (email1.value != "" && email2.value != "") {
                        emailOverlapCheck();
                    }
                } else {
                    adviseEmail.innerHTML = "올바른 이메일 형식이 아닙니다."
                    adviseEmail.style.color = "red";
                    hiddenRespEmail.innerHTML = "사용불가";
                    email2.focus();
                    console.log("email2 유효성 검사결과: invalidate");
                }
            };
        });
        // 이메일 중복 검사 함수 start
        function emailOverlapCheck() {
            email.value = email1.value + "@" + email2.value;
            console.log("email 중복 체크  : " + email.value);
            $.ajax({
                url: "${pageContext.request.contextPath}/guest/checkEmail.do",
                data: { email: email.value },
                dataType: "json",
                type: "post"
            }).done(function (resp) {
                console.log("이메일 중복 서버 검증 결과 : " + resp.result);
                if (resp.result == "available") {
                    adviseEmail.innerHTML = "사용가능";
                    adviseEmail.style.color = "green";
                    hiddenRespEmail.innerHTML = "사용가능";
                } else {
                    adviseEmail.style.color = "red";
                    adviseEmail.innerHTML = "중복된 이메일입니다.";
                    hiddenRespEmail.innerHTML = "사용불가";
                }
            }).fail(function (a, b, c) {
                console.log(a);
                console.log(b);
                console.log(c);
                return false;
            });
        }
        // 이메일 중복 검사 함수 end
        email1.addEventListener("change", function () {
            adviseEmail.innerHTML = "";
        });
        email2.addEventListener("change", function () {
            adviseEmail.innerHTML = "";
        });
        // 이메일 유효성 검사 end
        // 비밀번호 유효성 검사 start
        pw.addEventListener("blur", function () {
            rawStr = pw.value;
            console.log("pw: " + rawStr);
            var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    advisePw.innerHTML = "";
                    console.log("pw 유효성 검사결과: validate");
                } else {
                    advisePw.innerHTML = "올바른 비밀번호 형식이 아닙니다."
                    advisePw.style.color = "red";
                    hiddenRespPw.innerHTML = "사용불가";
                    pw.focus();
                    console.log("pw 유효성 검사결과: invalidate");
                }
            }
        });

        confirmPw.addEventListener("blur", function () {
            if (rawStr.length != 0) {
                if (confirmPw.value != pw.value) {
                    advisePw.innerHTML = "비밀번호가 일치하지 않습니다."
                    advisePw.style.color = "red";
                    hiddenRespPw.innerHTML = "사용불가";
                    confirmPw.value = "";
                    confirmPw.focus();
                    console.log("confirmPw 일치여부: invalidate");
                } else {
                    advisePw.innerHTML = "";
                    hiddenRespPw.innerHTML = "사용가능";
                    console.log("confirmPw 일치여부: validate");
                }
            }
        });

        pw.addEventListener("change", function () {
            confirmPw.value = "";
            advisePw.innerHTML = "";
        });
        //비밀번호 유효성 검사 end
        //이름 유효성 검사 start
        username.addEventListener("blur", function () {
            rawStr = username.value;
            console.log("name: " + rawStr);
            var regExp = /^[가-힣]{2,35}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    console.log("name 유효성 검사결과: validate");
                    adviseName.innerHTML = "";
                    hiddenRespName.innerHTML = "사용가능";
                } else {
                    adviseName.innerHTML = "올바른 이름이 아닙니다."
                    adviseName.style.color = "red";
                    hiddenRespName.innerHTML = "사용불가";
                    username.focus();
                    console.log("name 유효성 검사결과: invalidate");
                }
            }
        });

        username.addEventListener("change", function () {
            adviseName.innerHTML = "";
        });
        //이름 유효성 검사 end
        //닉네임 유효성 검사 start
        nickname.addEventListener("blur", function () {
            rawStr = nickname.value;
            console.log("nickname: " + rawStr);
            var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{2,18}[A-Za-z0-9]{1}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    console.log("nickname 유효성 검사결과: validate");
                    adviseNickname.innerHTML = "";
                    // 닉네임 중복 체크 ajax
                    $.ajax({
                        url: "${pageContext.request.contextPath}/guest/checkNickname.do",
                        data: { nickname: rawStr },
                        dataType: "json",
                        type: "post"
                    }).done(function (resp) {
                        console.log("nickname 중복 서버 검증결과: " + resp.result);
                        if (resp.result == "available") {
                            adviseNickname.innerHTML = "사용가능";
                            adviseNickname.style.color = "green";
                            hiddenRespNickname.innerHTML = "사용가능";
                        } else {
                            adviseNickname.innerHTML = "중복된 닉네임입니다.";
                            adviseNickname.style.color = "red";
                            hiddenRespNickname.innerHTML = "사용불가";
                            nickname.focus();
                        }
                    }).fail(function (a, b, c) {
                        console.log(a);
                        console.log(b);
                        console.log(c);
                        return false;
                    });
                } else {
                    adviseNickname.innerHTML = "올바른 닉네임이 아닙니다."
                    adviseNickname.style.color = "red";
                    hiddenRespNickname.innerHTML = "사용불가";
                    nickname.focus();
                    console.log("nickname 유효성 검사결과: invalidate");
                }
            }
        });
        //닉네임 유효성 검사 end

        //전화번호 유효성 검사 start
        phone2.addEventListener("blur", function () {
            rawStr = phone2.value;
            console.log("phone2: " + rawStr);
            var regExp = /^[0-9]{3,4}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    console.log("phone2 유효성 검사결과: validate");
                    advisePhone.innerHTML = "";
                } else {
                    advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                    advisePhone.style.color = "red";
                    hiddenRespPhone.innerHTML = "사용불가";
                    phone2.focus();
                    console.log("phone2 유효성 검사결과: invalidate");
                }
            }
        });

        phone3.addEventListener("blur", function () {
        rawStr = phone3.value;
            console.log("phone3: " + rawStr);
            var regExp = /^[0-9]{4}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                    console.log("phone3 유효성 검사결과: validate");
                    advisePhone.innerHTML = "";
                } else {
                    advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                    advisePhone.style.color = "red";
                    hiddenRespPhone.innerHTML = "사용불가";
                    phone3.focus();
                    console.log("phone3 유효성 검사결과: invalidate");
                }
            }
        });
        //전화번호 유효성 검사 end

        //전화번호 중복 검사 start
        function checkOverlap() {
            console.log(tid);
            clearInterval(tid); //기존 카운트다운 삭제
            setTime = 300; //카운트다운 초기화
            if(phone2.value != "" && phone3.value != ""){    		
                timer.innerHTML = "";
                phone.value = phone1.value + phone2.value + phone3.value;   	        
                
                if (phone.value != "") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/guest/checkOverlap.do",
                        data: { phone: phone.value },
                        dataType: "json",
                        type: "post",
                    }).done(function (resp) {
                        console.log("phone 중복여부 서버 검증 결과: " + resp.result);    	          
                        //전화번호 중복 검사 end
                        //인증번호 전송 start
                        if (resp.result == "available") {
                            tid=setInterval('msg_time()', 1000); //인증번호 전송 시 카운트다운 시작 
                            sendCode.hidden = true;
                            resendCode.hidden = false;
                            verifyCode.value = "";
                            verifyCode.disabled = false;
                            confirmVerifyCode.hidden = true;
                            $.ajax({
                                url: "${pageContext.request.contextPath}/guest/sendVerifCode.do",
                                data: { phone: phone.value },
                                dataType: "json",
                                type: "post"
                            }).done(function (resp) {
                            console.log("인증번호 서버 전송 결과: " + resp.result);            
                            if (resp.result != "Verify Code sent") {
                                adviseVerifCode.innerHTML("인증번호 전송에 실패했습니다.");
                                adviseVerifCode.style.color = "red";
                                hiddenRespPhone.innerHTML = "사용불가";
                                hiddenRespVerifCode.innerHTML = "인증실패";
                                confirmVerifyCode.hidden = true;
                                sendCode.hidden = false;
                                resendCode.hidden = true;
                                verifyCode.disabled = true;
                            }else{
                                console.log("인증 코드 발송 완료");
                                confirmVerifyCode.hidden = false;                  
                            }              
                            }).fail(function (a, b, c) {
                                console.log(a);
                                console.log(b);
                                console.log(c);
                            });
                        } else if (resp.result == "unavailable") {
                            advisePhone.innerHTML = "중복된 번호입니다.";
                            advisePhone.style.color = "red";
                            hiddenRespPhone.innerHTML = "사용불가";
                        }
                    }).fail(function (a, b, c) {
                        console.log(a);
                        console.log(b);
                        console.log(c);
                        return false;
                    });
                }
    
                }else{
                    alert("전화번호를 입력해 주세요.");
                }    		
            }
        //인증번호 전송 end
                        //사용자 입력 인증번호 일치여부 검사 start
                function confirmVerifCode() {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/guest/verifyUser.do",
                        data: { verifyCode: verifyCode.value },
                        dataType: "json",
                        type: "post",
                    }).done(function (resp) {
                        console.log("인증번호 서버 검증 결과 : " + resp.result);
    //     	          if (resp.result == "verified") {
    //     	            console.log("인증 완료 ");
                        adviseVerifCode.innerHTML = "인증완료";
                        adviseVerifCode.style.color = "green";
                        hiddenRespPhone.innerHTML = "사용가능";
                        hiddenRespVerifCode.innerHTML = "사용가능";
                        sendCode.hidden = true;
                        resendCode.hidden = true;
                        verifyCode.disabled = true;
    //     	          } else if (resp.result == "unverified") {
    //     	            console.log("인증 실패 ");
    //     	            adviseVerifCode.innerHTML = "인증실패";
    //     	            adviseVerifCode.style.color = "red";
    //     	            hiddenRespPhone.innerHTML = "사용불가";
    //     	            hiddenRespVerifCode.innerHTML = "인증실패";
    //     	            sendCode.hidden = true;
    //     	            resendCode.hidden = false;
    //     	            verifyCode.disabled = false;
    //     	          };
                    }).fail(function (a, b, c) {
                        console.log(a);
                        console.log(b);
                        console.log(c);
                        return false;
                    });
                }
                //사용자 입력 인증번호 일치여부 검사 end  
            //인증번호 제한시간 이벤트 start
            function msg_time() {
                m = addzero(Math.floor(setTime / 60)) + ":" + addzero(setTime % 60);
                console.log(m);
                var msg = m;
                timer.innerHTML = msg;
                setTime--;
                if (setTime < 0) {
                    clearInterval(tid);
                    adviseVerifCode.innerHTML = "입력시간이 초과되었습니다.";
                    adviseVerifCode.style.color = "red";
                    hiddenRespPhone.innerHTML = "사용불가";
                    hiddenRespVerifCode.innerHTML = "인증실패";
                    confirmVerifCode.hidden = true;
                    verifyCode.disabled = true;
                    $.ajax({
                        url: "${pageContext.request.contextPath}/guest/removeVerifSession.do",
                        dataType: "json",
                        type: "post",
                    }).done(function(resp){
                        if(resp.result == "Verif Code removed"){
                            timer.innerHTML = "";
                            sendCode.hidden = false;
                            resendCode.hidden = true;
                            verifyCode.value = "";
                            verifyCode.disabled = false;
                        }
                        console.log("인증번호 세션 삭제 실패");
                    }).fail(function(a,b,c){
                        console.log(a);
                        console.log(b);
                        console.log(c);
                    });
                }
            }
            function addzero(num) {
                if (num < 10) { num = "0" + num; }
                return num;
            }
            //인증번호 제한시간 이벤트 end   
            
            //프로필 사진 이벤트 start
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        console.log("프로필 사진명 : " + profile_img.value);  // 파일명                
                        setProfile.src = e.target.result;
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            profile_img.addEventListener("change", function () {
                readURL(this);
            });

            deleteProfile.addEventListener("click", function () {
                setProfile.src = "resources/default_profile_img.png";
            });
            //프로필 사진 이벤트 end

            //생년월일 select option 생성 start
            function appendYear() {
                var date = new Date();
                var year = date.getFullYear();
                var selectVal = doc.getElementById("tab4_birthYear");
                var optionIndex = 0;
                for (var i = year - 100; i <= year; i++) {
                    selectVal.add(new Option(i + "년", i), optionIndex++);
                }
            }

            function appendMonth() {
                var selectVal = doc.getElementById("tab4_birthMonth");
                var optionIndex = 0;
                for (var i = 1; i <= 12; i++) {
                    selectVal.add(new Option(i + "월", i), optionIndex++);
                }
            }

            function appendDay() {
                var selectVal = doc.getElementById("tab4_birthDay");
                var optionIndex = 0;
                for (var i = 1; i <= 31; i++) {
                    selectVal.add(new Option(i + "일", i), optionIndex++);
                }
            }
            //생년월일 select option 생성 end

            //회원가입 form submit 이벤트 start
            function formValidation() {
            
                //모든 입력창 유효성 결과 체크 start
                for (var i = 0; i < hiddenResp.length; i++) {
                    if (hiddenResp[i].innerHTML === "사용불가") {
                        console.log("유효성 통과 탈락");
                        alert("잘못된 입력입니다.");
                        return false;
                    }
                }
                //모든 입력창 유효성 결과 체크 end  

                if(hiddenRespVerifCode.innerHTML == "인증실패"){
                    alert("휴대폰 인증에 실패하였습니다. 다시 인증해 주세요.");
                    verifyCode.value();
                }
                
                //모든 입력창 null 체크 start 
                if (email1.value === "") {
                    adviseEmail.innerHTML = "필수 입력사항입니다."
                    adviseEmail.style.color = "red";
                    return false;
                } else if (email2.value === "") {
                    adviseEmail.innerHTML = "필수 입력사항입니다."
                    adviseEmail.style.color = "red";
                    return false;
                } else if (pw.value === "") {
                    advisePw.innerHTML = "필수 입력사항입니다."
                    advisePw.style.color = "red";
                    return false;
                } else if (confirmPw.value === "") {
                    adviseConfirmPw.innerHTML = "필수 입력사항입니다."
                    adviseConfirmPw.style.color = "red";
                    return false;
                } else if (username.value === "") {
                    adviseName.innerHTML = "필수 입력사항입니다."
                    adviseName.style.color = "red";
                    return false;
                } else if (nickname.value === "") {
                    adviseNickname.innerHTML = "필수 입력사항입니다."
                    adviseNickname.style.color = "red";
                    return false;
                } else if (birthYear.value === "선택하세요.") {
                    adviseBirth.innerHTML = "필수 입력사항입니다."
                    adviseBirth.style.color = "red";
                    return false;
                } else if (birthMonth.value === "선택하세요.") {
                    adviseBirth.innerHTML = "필수 입력사항입니다."
                    adviseBirth.style.color = "red";
                    return false;
                } else if (birthDay.value === "선택하세요.") {
                    adviseBirth.innerHTML = "필수 입력사항입니다."
                    adviseBirth.style.color = "red";
                    return false;
                } else if (phone2.value === "") {
                    advisePhone.innerHTML = "필수 입력사항입니다."
                    advisePhone.style.color = "red";
                    return false;
                } else if (phone3.value === "") {
                    advisePhone.innerHTML = "필수 입력사항입니다."
                    advisePhone.style.color = "red";
                    return false;
                } else if (verifyCode.value === "") {
                    adviseVerifCode.innerHTML = "휴대폰 인증은 필수입니다."
                    adviseVerifCode.style.color = "red";
                    return false;
                }
                //모든 입력창 null 체크 end 

                //전화번호, 이메일 한 줄로 조합 start
                email.value = email1.value + "@" + email2.value;
                phone.value = phone1.value + phone2.value + phone3.value;
                var month = birthMonth.value;
                var day = birthDay.value;
                if (month < 10) {
                    console.log(month);
                    month = "0" + month;
                    console.log(month);
                }
                if (day < 10) {
                    console.log(day);
                    day = "0" + day;
                    console.log(day);
                }
                birth.value = birthYear.value + month + day;
                //전화번호, 이메일 한 줄로 조합 end

                console.log("최종 휴대폰 : " + phone.value);
                console.log("최종 비밀번호 : " + pw.value);
                console.log("최종 이름 : " + username.value);
                console.log("최종 닉네임 : " + nickname.value);
                console.log("최종 이메일 : " + email.value);
                console.log("최종 생년월일 : " + birth.value);

                doc.getElementById("signUpForm").submit();
            };
            //회원가입 form submit 이벤트 end
                //tab4_회원가입 end

            //기타 함수 start
            function clearInput(userInput, length) { //tab 전환 시 모든 input창 clear
                for (var i = 0; i < length; i++) {
                    userInput[i].value = "";
                }
            }
            //기타 함수 end
    </script>
</body>
</html>