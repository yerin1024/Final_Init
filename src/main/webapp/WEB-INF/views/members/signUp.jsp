<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/guest/signUpProc.do" method="post" enctype="multipart/form-data" id="signUpForm">
        <div class="container">
            <div class="signUpContainer">
                <div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="title">회원가입</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <label>이메일</label>
                                <input type="text" class="email1">
                                <label class="adviseIn" id="adviseInEmail" hidden></label>@
                                <input type="text" class="email2">
                                <!-- <input type="text" class="inputEmail2" name="inputEmail2" hidden> -->
                                <input type="text" class="email" name="email" hidden>
                                <select class="emailSelect" onChange="changeSelect(this)">
                                    <option value="custom" placeholder="직접입력">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="dreamwiz.com">dreamwiz.com</option>
                                    <option value="yahoo.com">yahoo.com</option>
                                </select> 
                                <br>
                                <p class="adviseOut" id="adviseEmail" readonly></p>
                                <label>비밀번호</label>
                                <input type="password" class="inputPw" name="pw" maxlength="12">
                                <label class="adviseIn" id="adviseInPw" hidden></label><br>                                
                                <label>비밀번호 확인</label>
                                <input type="password" class="confirmPw" maxlength="12">
                                <p class="adviseOut" id="advisePw" readonly>*6~15자 영문 대 소문자, 숫자를 조합하여 사용 가능합니다.</p>
                                <!-- <p class="adviseOut" id="adviseConfirmPw" readonly></p> -->
                                <label>이름</label>
                                <input type="text" class="inputName" name="name" maxlength="70">
                                <label class="adviseIn" id="adviseInName" hidden></label><br>
                                <p class="adviseOut" id="adviseName" readonly></p>
                                <label>닉네임</label>
                                <input type="text" class="inputNick" name="nickname" maxlength="20">
                                <label class="adviseIn" id="adviseInNickname" hidden></label><br>
                                <p class="adviseOut" id="adviseNickname" readonly>*4~20자 영문 대 소문자, 숫자, 특수문자(_)만 사용 가능합니다.</p>
                                <label>전화번호</label>
                                <select class="phone1">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                -<input type="text" class="phone2" maxlength="4">
                                -<input type="text" class="phone3" maxlength="4">
                                <input type="text" class="phone" name="phone" maxlength="11" hidden>
                                <label class="adviseIn" id="adviseInPhone" hidden></label>
                                <p class="adviseOut" id="advisePhone" readonly></p>

                                <input type="text" id="verif_code" name="verif_code" placeholder="인증번호 입력" maxlength="6">
                                <label class="adviseIn" id="adviseInVerifCode" hidden></label>
                                <button type="button" id="sendCode" onclick="checkPhone();">인증번호 전송</button>
                                <span id="showTimer" readonly></span>
                                <button type="button" id="resendCode" onclick="checkPhone();" hidden>인증번호 재전송</button><br>
                                <button type="button" id="checkVerifCode" onclick="confirmVerifCode();" hidden>인증번호 확인</button><br>
                                <p class="adviseOut" id="adviseVerifCode" readonly></p>
                                <p id="resultVerification" hidden></p>

                                <label>생년월일</label>
                                <select id="year" class="birthYear">
                                    <option>선택하세요.</option>
                                </select>
                                <select id="month" class="birthMonth">
                                    <option>선택하세요.</option>
                                </select>
                                <select id="day" class="birthDay">
                                    <option>선택하세요.</option>
                                </select>
                                <input type="text" class="inputBirth" name="birth" hidden><br>
                                <p class="adviseOut" id="adviseBirth" readonly></p>
                                <label>프로필 사진</label>
                                <img src="resources/default_profile_img.png" id="setProfile" style="width:50px;">
                                <button type="button" id="deletePic">X</button>
                                <input type="file" id="profileImg" name="profileImg"><br> 
                                <p class="adviseOut" id="adviseProfile" readonly>*프로필 사진 미등록시 기본이미지로 등록됩니다.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="signupBtn" onclick="formValidation();">가입</button>
                                <button type="button" id="cancelBtn">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        var doc = document;
        var rawStr = null;
        var signUpForm = doc.getElementById("signUpForm");

        var email = doc.getElementsByClassName("email")[0];
        var email1 = doc.getElementsByClassName("email1")[0];
        var email2 = doc.getElementsByClassName("email2")[0];
        var pw = doc.getElementsByClassName("inputPw")[0];
        var confirmPw = doc.getElementsByClassName("confirmPw")[0];
        var nickname = doc.getElementsByClassName("inputNick")[0];
        var phone = doc.getElementsByClassName("phone")[0];
        var phone1 = doc.getElementsByClassName("phone1")[0];
        var phone2 = doc.getElementsByClassName("phone2")[0];
        var phone3 = doc.getElementsByClassName("phone3")[0];
        var inputName = doc.getElementsByClassName("inputName")[0];
        var birthYear = doc.getElementsByClassName("birthYear")[0];
        var birthMonth = doc.getElementsByClassName("birthMonth")[0];
        var birthDay = doc.getElementsByClassName("birthDay")[0];
        var birth = doc.getElementsByClassName("inputBirth")[0];
        var profile_msg = doc.getElementsByClassName("profile_msg")[0];
        var adviseEmail = doc.getElementById("adviseEmail");
        var sendCode = doc.getElementById("sendCode");
        var verif_code = doc.getElementById("verif_code");
        var resultVerification = doc.getElementById("resultVerification");
        var resendCode = doc.getElementById("resendCode");
        var checkVerifCode = doc.getElementById("checkVerifCode");
        var showTimer = doc.getElementById("showTimer");

        var advisePw = doc.getElementById("advisePw");
        var adviseNickname = doc.getElementById("adviseNickname");
        var advisePhone = doc.getElementById("advisePhone");
        var adviseBirth = doc.getElementById("adviseBirth");
        var adviseName = doc.getElementById("adviseName");

        var adviseInEmail =  doc.getElementById("adviseInEmail");
        var adviseInPw = doc.getElementById("adviseInPw");
        var adviseInNickname = doc.getElementById("adviseInNickname");
        var adviseInName = doc.getElementById("adviseInName");
        var adviseInPhone = doc.getElementById("adviseInPhone");
        var adviseInVerifCode = doc.getElementById("adviseInVerifCode");
        var adviseIn = doc.getElementsByClassName("adviseIn");

        var deletePic = doc.getElementById("deletePic");
        var setProfile = doc.getElementById("setProfile");
        var profile_img = doc.getElementById("profileImg");

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    console.log(profile_img.value);  // 파일명                
                    setProfile.src = e.target.result; 
                }                
                reader.readAsDataURL(input.files[0]);
                }
        }

        profile_img.addEventListener("change", function(){
            readURL(this);
        });

        deletePic.addEventListener("click", function(){
            setProfile.src = "resources/default_profile_img.png";
        });     

        pw.addEventListener("focus", function(){
        	email.value = email1.value + "@" + email2.value;
            $.ajax({
                url : "${pageContext.request.contextPath}/guest/checkEmail.do",
                data : {email : email.value},
                dataType : "json",
                type : "post"
            }).done(function(resp){
                console.log(resp);
                console.log(resp.result);
                if(resp.result == "available"){
                	adviseEmail.innerHTML = "사용가능";
                	adviseEmail.style.color = "green";
                    adviseInEmail.innerHTML = "사용가능";
                }else{
                	adviseEmail.innerHTML = "중복된 이메일입니다.";
                	adviseEmail.style.color = "red";
                	adviseInEmail.innerHTML = "사용불가";
                	return false;
                }                
            }).fail(function(a,b,c){
            	
                console.log(a);
                console.log(b);
                console.log(c);
                return false;
            });
        });
        
        email1.addEventListener("keyup", function(){
            rawStr = email1.value;
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
            if(regExp.test(rawStr)){
                adviseEmail.innerHTML = "";
                adviseInEmail.innerHTML = "사용가능";
                console.log("validate");
            }else{
            	adviseEmail.innerHTML = "올바른 이메일 형식이 아닙니다."
                adviseEmail.style.color = "red";
                adviseInEmail.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });

        email2.addEventListener("keyup", function(){
            rawStr = email2.value;
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
            if(regExp.test(rawStr)){
                adviseEmail.innerHTML = "";
                adviseInEmail.innerHTML = "사용가능";
                console.log("validate");
            }else{
                adviseEmail.innerHTML = "올바른 이메일 형식이 아닙니다."
                adviseEmail.style.color = "red";
                adviseInEmail.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });

        pw.addEventListener("keyup", function(){
            rawStr = pw.value;
            console.log(rawStr);
            var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
            if(regExp.test(rawStr)){
                advisePw.innerHTML = "";
                adviseInPw.innerHTML = "사용가능";
                console.log("validate");
            }else{
                advisePw.innerHTML = "올바른 비밀번호 형식이 아닙니다."
                advisePw.style.color = "red";
                adviseInPw.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });

        pw.addEventListener("change", function(){
            confirmPw.value = "";
        });

        confirmPw.addEventListener("blur", function(){
            if(confirmPw.value != pw.value){
                advisePw.innerHTML = "비밀번호가 일치하지 않습니다."
                advisePw.style.color = "red";
                adviseInPw.innerHTML = "사용불가";
                confirmPw.value = "";
                console.log("invalidate");
            }else{
                advisePw.innerHTML = "";
                adviseInPw.innerHTML = "사용가능";
                console.log("validate");
            }
        });

        inputName.addEventListener("keyup", function(){
            rawStr = inputName.value;
            console.log(rawStr);
            var regExp = /^[가-힣]{2,35}$/;
            if(regExp.test(rawStr)){
                console.log("validate");
                adviseName.innerHTML = "";
                adviseInName.innerHTML = "사용가능";
            }else{
                adviseName.innerHTML = "올바른 이름이 아닙니다."
                adviseName.style.color = "red";
                adviseInName.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });

        nickname.addEventListener("keyup", function(){
            rawStr = nickname.value;
            console.log(rawStr);
            var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{2,18}[A-Za-z0-9]{1}$/;
            if(regExp.test(rawStr)){
                console.log("validate");
                adviseNickname.innerHTML = "";
                $.ajax({
                url : "${pageContext.request.contextPath}/guest/checkNickname.do",
                data : {nickname : rawStr},
                dataType : "json",
                type : "post"
                }).done(function(resp){
                    console.log(resp);
                    console.log(resp.result);
                    if(resp.result == "available"){
                    	adviseNickname.innerHTML = "사용가능";
                    	adviseNickname.style.color = "green";
                        adviseInNickname.innerHTML = "사용가능";
                    }else{
                    	adviseNickname.innerHTML = "중복된 닉네임입니다.";
                    	adviseNickname.style.color = "red";
                        adviseInNickname.innerHTML = "사용불가";
                        return false;
                    }
                }).fail(function(a,b,c){                	
                    console.log(a);
                    console.log(b);
                    console.log(c);
                    return false;
                });
            }else{
                adviseNickname.innerHTML = "올바른 닉네임이 아닙니다."
                adviseNickname.style.color = "red";
                adviseInNickname.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });
        
        phone2.addEventListener("keyup", function(){
            rawStr = phone2.value;
            console.log(rawStr);
            var regExp = /^[0-9]{3,4}$/;
            if(regExp.test(rawStr)){
                console.log("validate");
                advisePhone.innerHTML = "";
                adviseInPhone.innerHTML = "사용가능";
            }else{
                advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                advisePhone.style.color = "red";
                adviseInPhone.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });

        phone3.addEventListener("keyup", function(){
            rawStr = phone3.value;
            console.log(rawStr);
            var regExp = /^[0-9]{4}$/;
            if(regExp.test(rawStr)){
                console.log("validate");
                advisePhone.innerHTML = "";
                adviseInPhone.innerHTML = "사용가능";
            }else{0
                advisePhone.innerHTML = "올바른 전화번호 형식이 아닙니다."
                advisePhone.style.color = "red";
                adviseInPhone.innerHTML = "사용불가";
                console.log("invalidate");
            }
        });  

        window.onload = function(){
            appendYear();
            appendMonth();
            appendDay();
        }

        function checkPhone(){
        	checkVerifCode.hidden = false;
        	sendCode.hidden = true;        
        	resendCode.hidden = false;
        	verif_code.disabled = false;
            phone.value = phone1.value + phone2.value + phone3.value;
            
            function TimerStart(){
            	tid = setInterval('msg_time()',1000);
            	console.log("1");
            };
            
            var SetTime = 50;
            showTimer.innerHTML = "05:00";
            console.log("2");
            
    		function msg_time() {
    			m = Math.floor(SetTime / 60) + ":" + (SetTime % 60);
    			console.log(m);
    			console.log("3");
    			var msg = m;
    			showTimer.innerHTML = msg;
    			console.log("4");
    			SetTime--;	// 1초씩 감소
    			if (SetTime < 0) {	
        			console.log("5")
    				// 시간이 종료 되었으면..
    				clearInterval(tid);		// 타이머 해제
    				alert("종료");
    			}    			
    		}    		
    		
            setTimeout(function () {
            	adviseVerifCode.innerHTML = "입력시간이 초과되었습니다.";
        		adviseVerifCode.style.color = "red";
        		adviseInVerifCode.innerHTML ="사용불가";
        		checkVerifCode.hidden = true;
        		verif_code.disabled = true;
        		
            }, 30000);

            $.ajax({
                url : "${pageContext.request.contextPath}/guest/checkPhone.do",
                data : {phone : phone.value},
                dataType : "json",
                type : "post",
//                 async : false
                }).done(function(resp){
                    console.log(resp);
                    if(resp.result == "available"){
                        adviseInPhone.innerHTML = "사용가능";
                        
                        $.ajax({
                        	url: "${pageContext.request.contextPath}/guest/sendVerifCode.do",
                        	data : {phone : phone.value},
                        	dataType: "json",
                        	type : "post"
                        }).done(function(resp){
                        	console.log(resp);
                        	console.log(resp.result);
                            resultVerification.innerHTML = resp.result;                        
                            
                        }).fail(function(a,b,c){
                        	console.log(a);
                        	console.log(b);
                        	console.log(c);
                        });
                    }else{
                    	advisePhone.innerHTML = "중복된 번호입니다.";
                    	advisePhone.style.color = "red";
                        adviseInPhone.innerHTML = "사용불가";
                        return false;
                    }                
                }).fail(function(a,b,c){
                    console.log(a);
                    console.log(b);
                    console.log(c);
                    return false;
                });  
        }
        
        function confirmVerifCode(){
        	console.log("verif_code : " + verif_code.value);
        	
        	if(verif_code.value == resultVerification.innerHTML){
        		adviseVerifCode.innerHTML = "인증 완료";
        		adviseVerifCode.style.color = "green";
        	}else{
        		adviseVerifCode.innerHTML = "인증번호 불일치";
        		adviseVerifCode.style.color = "red";
        		adviseInVerifCode.innerHTML ="사용불가";
        	}
        }    
        
        function appendYear(){
            var date = new Date();
            var year = date.getFullYear();
            var selectVal = doc.getElementById("year");
            var optionIndex = 0;
            for(var i=year-100;i<=year;i++){
                selectVal.add(new Option(i+"년",i), optionIndex++);
            }
        }
        
        function appendMonth(){
            var selectVal = doc.getElementById("month");
            var optionIndex = 0;
            for(var i=1;i<=12;i++){
                selectVal.add(new Option(i+"월",i), optionIndex++);
            }           
        }

        function appendDay(){
            var selectVal = doc.getElementById("day");
            var optionIndex = 0;
            for(var i=1;i<=31;i++){
                selectVal.add(new Option(i+"일",i), optionIndex++);
            }            
        }        

        function changeSelect(email){
            var selected = email[email.selectedIndex].value;
            if(selected == "custom"){ //직접 입력
                email2.value = "";
                email2.disabled = false;
                window.setTimeout(function(){
                    email2.focus();
                }, 0);
            }else{ //이메일 선택
                email2.value = selected;
                email2.disabled = true;
            }
        }

        function formValidation(){

            for(var i = 0; i < adviseIn.length; i++){
                if(adviseIn[i].innerHTML === "사용불가"){
                    console.log("유효성 통과 탈락");
                    return false;
                }
            }

        	if(email1.value === ""){
        		adviseEmail.innerHTML = "필수 입력사항입니다."
                adviseEmail.style.color = "red";
        		return false;
            }else if(email2.value === ""){
                adviseEmail.innerHTML = "필수 입력사항입니다."
                adviseEmail.style.color = "red";
                return false;
            }else if(pw.value === ""){
                advisePw.innerHTML = "필수 입력사항입니다."
                advisePw.style.color = "red";
                return false;
            }else if(confirmPw.value === ""){
                adviseConfirmPw.innerHTML = "필수 입력사항입니다."
                adviseConfirmPw.style.color = "red";
                return false;
            }else if(inputName.value === ""){
            	adviseName.innerHTML = "필수 입력사항입니다."
                adviseName.style.color = "red";
                return false;
            }else if(nickname.value === ""){
            	adviseNickname.innerHTML = "필수 입력사항입니다."
                adviseNickname.style.color = "red";
                return false;
            }else if(phone2.value === ""){
            	advisePhone.innerHTML = "필수 입력사항입니다."
            	advisePhone.style.color = "red";
                return false;
            }else if(phone3.value === ""){
            	advisePhone.innerHTML = "필수 입력사항입니다."
                advisePhone.style.color = "red";
                return false;
            }else if(birthYear.value === "선택하세요."){
            	adviseBirth.innerHTML = "필수 입력사항입니다."
            	adviseBirth.style.color = "red";
                return false;
            }else if(birthMonth.value === "선택하세요."){
            	adviseBirth.innerHTML = "필수 입력사항입니다."
                adviseBirth.style.color = "red";
                return false;
            }else if(birthDay.value === "선택하세요."){
            	adviseBirth.innerHTML = "필수 입력사항입니다."
                adviseBirth.style.color = "red";
                return false;
            }else if(verif_code.value === ""){
            	adviseVerifCode.innerHTML = "휴대폰 인증은 필수입니다."
            	adviseVerifCode.style.color = "red";
                return false;
            }      	
        	  	
        	email.value = email1.value + "@" + email2.value;
            phone.value = phone1.value + phone2.value + phone3.value;
            var month = birthMonth.value;
            var day = birthDay.value;
            if(month < 10){
                console.log(month);
                month = "0" + month;
                console.log(month);
            }
            if(day < 10){
                console.log(day);
                day = "0" + day;
                console.log(day);
            }
            birth.value = birthYear.value + month + day;

            console.log("완성 휴대폰 : " + phone.value);
            console.log("완성 비밀번호 : " + pw.value);
            console.log("완성 이름 : " + inputName.value);
            console.log("완성 닉네임 : " + nickname.value);
            console.log("완성 이메일 : " + email.value);
            console.log("완성 생년월일 : " + birth.value);       
            
            signUpForm.submit();
        }     
        //submit 직전 유효성 검사

    </script>
</body>
</html>