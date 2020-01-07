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
<<<<<<< Updated upstream
	<form action="${pageContext.request.contextPath}/guest/signUp.do"
		method="post" id="signUpForm">
		<div class="container">
			<div class="signUpContainer">
				<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
					aria-labelledby="loginModalTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="title">회원가입</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<label>이메일</label> <input type="text" class="email1"
									name="email1"> <input type="text" class="email2"
									name="email2" onChange="changeDomail(this)">
								<!-- <input type="text" class="inputEmail2" name="inputEmail2" hidden> -->
								<input type="text" class="email" name="email" hidden> <select
									class="emailSelect" " name="emailSelect"
									onChange="changeSelect(this)">
									<option value="custom" placeholder="직접입력">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="yahoo.com">yahoo.com</option>
								</select> <br> <label>비밀번호</label> <input type="password"
									class="inputPw" name="pw"><br> <label>닉네임</label>
								<input type="text" class="inputNickname" name="nickname"><br>
								<label>전화번호</label> <select class="phone1" name="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> -<input type="text" class="phone2" name="phone2"> -<input
									type="text" class="phone3" name="phone3"> <input
									type="text" class="phone" name="phone" hidden> <input
									type="text" class="verif_code" name="verif_code"
									placeholder="인증번호">
								<button type="button" class="sendCode">send</button>
								<br> <label>생년월일</label> fff<br> <label>프로필 사진</label>
								<p class="profile_img_show"></p>
								<input type="file" class="profile_img" name="profile_img"><br>
								<label>상태 메세지</label> <input type="text" class="profile_msg"
									name="profile_msg">
							</div>
							<div class="modal-footer">
								<button type="button" class="signupBtn" onclick="signUp()">가입</button>
								<button type="button" class="cancelBtn">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
        var doc = document;
        // Regex
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/; // 암호 문자, 숫자 포함 6-12자리
        var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/; // 이메일 정규식
=======
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
                                <input type="text" class="email1">@
                                <input type="text" class="email2">
                                <!-- <input type="text" class="inputEmail2" name="inputEmail2" hidden> -->
                                <input type="text" class="email" name="email" hidden>
                                <select class="emailSelect" onChange="changeSelect(this)">
                                    <option value="custom">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="dreamwiz.com">dreamwiz.com</option>
                                    <option value="yahoo.com">yahoo.com</option>
                                </select> 
                                <br>
                                <p id="email_dupCheck" disabled hidden></p>
                                <label>비밀번호</label>
                                <input type="password" class="inputPw" name="pw" maxlength="12"><br>
                                <label>비밀번호 확인</label>
                                <input type="password" class="confirmPw" maxlength="12"><br>
                                <label>이름</label>
                                <input type="text" class="inputName" name="name" maxlength="70"><br>
                                <label>닉네임</label>
                                <input type="text" class="inputNick" name="nickname" maxlength="20"><br>
                                <p id="nick_dupCheck" disabled hidden></p>
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
                                <p id="phone_dupCheck" disabled hidden></p>
                                <input type="text" class="verif_code" name="verif_code" placeholder="인증번호">
                                <button type="button" class="sendCode">send</button><br>
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
                                <label>프로필 사진</label>
                                <img src="resources/default_profile_img.png" id="setProfile" style="width:50px;">
                                <button type="button" id="deletePic">X</button>
                                <input type="file" id="profileImg" name="profileImg"><br>   
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="signupBtn" onclick="signUp()">가입</button>
                                <button type="button" class="cancelBtn">취소</button>
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
>>>>>>> Stashed changes

        var email = doc.getElementsByClassName("email")[0];
        var email1 = doc.getElementsByClassName("email1")[0];
        var email2 = doc.getElementsByClassName("email2")[0];
<<<<<<< Updated upstream
        
      
        email1.addEventListener("keyup", function(){
            var rawStr = email1.value;
=======
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
        var email_dupCheck = doc.getElementById("email_dupCheck");
        var nick_dupCheck = doc.getElementById("nick_dupCheck");
        var phone_dupCheck = doc.getElementById("phone_dupCheck");
        var deletePic = doc.getElementById("deletePic");
        var setProfile = doc.getElementById("setProfile");
        var profileImg = doc.getElementById("profileImg");

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                
                reader.onload = function (e) {
                    console.log(profileImg.value);  // 파일명                
                    setProfile.src = e.target.result; 
                }                
                reader.readAsDataURL(input.files[0]);
                }
        }

        profileImg.addEventListener("change", function(){
            readURL(this);
        });

        deletePic.addEventListener("click", function(){
            setProfile.src = "resources/default_profile_img.png";
        });

        email1.addEventListener("keyup", function(){
            rawStr = email1.value;
>>>>>>> Stashed changes
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
            if(regExp.test(rawStr)){
                console.log("OK");
            }else{
                console.log("Nope");
            }
        });

        email2.addEventListener("keyup", function(){
<<<<<<< Updated upstream
            var rawStr = email2.value;
=======
            rawStr = email2.value;
>>>>>>> Stashed changes
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
<<<<<<< Updated upstream
        })

=======
        });

        pw.addEventListener("keyup", function(){
            rawStr = pw.value;
            console.log(rawStr);
            var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
        });

        confirmPw.addEventListener("keyup", function(){
            if(confirmPw.value != pw.value){
                console.log("nope");
            }else{
                console.log("Ok");
            }
        });

        inputName.addEventListener("keyup", function(){
            rawStr = inputName.value;
            console.log(rawStr);
            var regExp = /^[가-힣]{2,35}$/;
            if(regExp.test(rawStr)){
                console.log("OK");
            }else{
                console.log("nope");
            }
        });

        nickname.addEventListener("keyup", function(){
            rawStr = nickname.value;
            console.log(rawStr);
            var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{3,18}[A-Za-z0-9]{1}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
        });
        
        phone2.addEventListener("keyup", function(){
            rawStr = phone2.value;
            console.log(rawStr);
            var regExp = /^[0-9]{3,4}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
        });

        phone3.addEventListener("keyup", function(){
            rawStr = phone3.value;
            console.log(rawStr);
            var regExp = /^[0-9]{4}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
        });  

        window.onload = function(){
            appendYear();
            appendMonth();
            appendDay();
        }

        email2.addEventListener("blur", function(){
            if(email1.value != "" && email2.value != ""){
                email_dupCheck.innerHTML = "중복된 이메일입니다.";
                email_dupCheck.style.color = "red";
                email_dupCheck.hidden = false;
            }          
            // $.ajax({
            //     url: "${pageContext.request.contextPath}/guest/dupCheckEmail.do",
            //     data: {email : email1.value + "@" + email2.value},
            //     type: "post",
            //     dataType: "json"
            // }).done(function(resp){
            //     console.log(resp);
            // }).fail(function(a,b,c){
            //     console.log(a);
            //     console.log(b);
            //     console.log(c);
            // });
        });

        email2.addEventListener("focus", function(){
            email_dupCheck.innerHTML = "";
            email_dupCheck.hidden = true;
        });

        nickname.addEventListener("blur", function(){
            if(nickname.value != ""){
                nick_dupCheck.innerHTML = "중복된 닉네임입니다.";
                nick_dupCheck.style.color = "red";
                nick_dupCheck.hidden = false;
            }            
            // $.ajax({
            //     url: "${pageContext.request.contextPath}/guest/dupCheckNick.do",
            //     data: {nickname : nickname},
            //     type: "post",
            //     dataType: "json"
            // }).done(function(resp){
            //     console.log(resp);
            // }).fail(function(a,b,c){
            //     console.log(a);
            //     console.log(b);
            //     console.log(c);
            // });
        });

        nickname.addEventListener("focus", function(){
            nick_dupCheck.innerHTML = "";
            nick_dupCheck.hidden = true;
        });

        phone3.addEventListener("blur", function(){
            if(phone1.value != "" && phone2.value != "" && phone3.value != ""){
                phone_dupCheck.innerHTML = "중복된 핸드폰 번호입니다.";
                phone_dupCheck.style.color = "red";
                phone_dupCheck.hidden = false;
            }
            // $.ajax({
            //     url: "${pageContext.request.contextPath}/guest/dupCheckPhone.do",
            //     data: {phone : phone1.value + phone2.value + phone3.value},
            //     type: "post",
            //     dataType: "json"
            // }).done(function(resp){
            //     console.log(resp);
            // }).fail(function(a,b,c){
            //     console.log(a);
            //     console.log(b);
            //     console.log(c);
            // });
        });

        phone3.addEventListener("focus", function(){
            phone_dupCheck.innerHTML = "";
            phone_dupCheck.hidden = true;
        });  

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
>>>>>>> Stashed changes

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

        function signUp(){
            email.value = email1.value + "@" + email2.value;
<<<<<<< Updated upstream
            console.log("완성 이메일 : " + email.value);
=======
            phone.value = phone1.value + phone2.value + phone3.value;
            var month = birthMonth.value;
            var day = birthDay.value;

            if(birthMonth.value < 10){
                console.log(birthMonth.value);
                month = "0"+birthMonth.value;
                console.log(month);
            }
            if(birthDay.value < 10){
                console.log(birthDay.value);
                day = "0"+birthDay.value;
                console.log(day);
            }
            
            birth.value = birthYear.value + month + day;

            console.log("완성 휴대폰 : " + phone.value);
            console.log("완성 비밀번호 : " + pw.value);
            console.log("완성 이름 : " + inputName.value);
            console.log("완성 닉네임 : " + nickname.value);
            console.log("완성 이메일 : " + email.value);
            console.log("완성 생년월일 : " + birth.value);

            if(email1.value === ""){
                alert("이메일을 입력해 주세요.");
            }else if(email2.value === ""){
                alert("이메일을 입력해 주세요.");
            }else if(pw.value === ""){
                alert("비밀번호를 입력해 주세요.");
            }else if(confirmPw.value === ""){
                alert("비밀번호를 입력해 주세요.");
            }else if(inputName.value === ""){
                alert("이름을 입력해 주세요.");
            }else if(nickname.value === ""){
                alert("닉네임을 입력해 주세요.");
            }else if(phone2.value === ""){
                alert("전화번호를 입력해 주세요.");
            }else if(phone3.value === ""){
                alert("전화번호를 입력해 주세요.");
            }else if(birthYear.value === "선택하세요."){
                alert("생년월일을 입력해 주세요.");
            }else if(birthMonth.value === "선택하세요."){
                alert("생년월일을 입력해 주세요.");
            }else if(birthDay.value === "선택하세요."){
                alert("생년월일을 입력해 주세요.");
            }
            doc.getElementById("signUpForm").submit();
>>>>>>> Stashed changes
        }
    </script>
</body>
</html>