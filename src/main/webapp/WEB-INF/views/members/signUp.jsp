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
                                <input type="text" class="email1"><label class="adviseIn" id="adviseInEmail"></label>@
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
                                <label class="adviseIn" id="adviseInPw"></label><br>
                                <p class="adviseOut" id="advisePw" readonly>*6~15자 영문 대 소문자, 숫자를 조합하여 사용 가능합니다.</p>
                                <label>비밀번호 확인</label>
                                <input type="password" class="confirmPw" maxlength="12">
                                <label class="adviseIn" id="adviseInConfirmPw"></label><br>
                                <p class="adviseOut" id="adviseConfirmPw" readonly></p>
                                <label>이름</label>
                                <input type="text" class="inputName" name="name" maxlength="70">
                                <label class="adviseIn" id="adviseInName"></label><br>
                                <p class="adviseOut" id="adviseName" readonly></p>
                                <label>닉네임</label>
                                <input type="text" class="inputNick" name="nickname" maxlength="20">
                                <label class="adviseIn" id="adviseInNickname"></label><br>
                                <p class="adviseOut" id="adviseNickname" readonly>*2~20자 영문 대 소문자, 숫자, 특수문자(_)만 사용 가능합니다.</p>
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
                                <p class="adviseOut" id="advisePhone" readonly></p>
                                <input type="text" class="verif_code" name="verif_code" placeholder="인증번호">
                                <label class="adviseIn" id="adviseInVerifCode"></label>
                                <button type="button" class="sendCode">send</button><br>
                                <p class="adviseOut" id="adviseVerifCode" readonly></p>
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
        var advisePw = doc.getElementById("advisePw");
        var adviseConfirmPw = doc.getElementById("adviseConfirmPw");
        var adviseNickname = doc.getElementById("adviseNickname");
        var advisePhone = doc.getElementById("advisePhone");
        var adviseBirth = doc.getElementById("adviseBirth");
        var adviseName = doc.getElementById("adviseName");
             
        
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
        
        
//         function toCheckEmail1(){
//         	if(email1.value != ""){
//         		return true
//         	}else{
//         		adviseEmail.html = "필수 입력사항입니다."
//         		adviseEmail.html = "올바른 이메일 형식이 아닙니다."
//                     adviseEmail.style.color = "red";
//         		return false;
//         	}
//         }
//         function toCheckEmail2(){
//         	if(email2.value != ""){
//         		return true
//         	}else{
//         		alert("이메일을 입력해 주세요.");
//         		return false;
//         	}
//         }        
//         function toCheckPw(){
//         	if(pw.value != ""){
//         		return true
//         	}else{
//         		alert("비밀번호를 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckConfirmPw(){
//         	if(confirmPw.value != ""){
//         		return true
//         	}else{
//         		alert("비밀번호를 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckName(){
//         	if(inputName.value != ""){
//         		return true
//         	}else{
//         		alert("이름을 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckNickname(){
//         	if(nickname.value != ""){
//         		return true
//         	}else{
//         		alert("닉네임을 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckPhone2(){
//         	if(phone2.value != ""){
//         		return true
//         	}else{
//         		alert("전화번호를 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckPhone3(){
//         	if(phone3.value != ""){
//         		return true
//         	}else{
//         		alert("전화번호를 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckYear(){
//         	if(birthYear.value != "선택하세요."){
//         		return true
//         	}else{
//         		alert("생년월일을 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckMonth(){
//         	if(birthMonth.value != "선택하세요."){
//         		return true
//         	}else{
//         		alert("생년월일을 입력해 주세요.");
//         		return false;
//         	}
//         }
//         function toCheckDay(){
//         	if(birthDay.value != "선택하세요."){
//         		return true
//         	}else{
//         		alert("생년월일을 입력해 주세요.");
//         		return false;
//         	}
//         }
        
        
        
        
        
        function formValidation(){
        	if(email1.value === ""){
        		adviseEmail.innerhtml = "필수 입력사항입니다."
                adviseEmail.style.color = "red";
        		return false;
            }else if(email2.value === ""){
                adviseEmail.innerhtml = "필수 입력사항입니다."
                adviseEmail.style.color = "red";
                return false;
            }else if(pw.value === ""){
                advisePw.innerhtml = "필수 입력사항입니다."
                advisePw.style.color = "red";
                return false;
            }else if(confirmPw.value === ""){
                adviseConfirmPw.innerhtml = "필수 입력사항입니다."
                adviseConfirmPw.style.color = "red";
                return false;
            }else if(inputName.value === ""){
            	adviseName.innerhtml = "필수 입력사항입니다."
                adviseName.style.color = "red";
                return false;
            }else if(nickname.value === ""){
            	adviseNickname.innerhtml = "필수 입력사항입니다."
                adviseNickname.style.color = "red";
                return false;
            }else if(phone2.value === ""){
            	advisePhone.innerhtml = "필수 입력사항입니다."
            	advisePhone.style.color = "red";
                return false;
            }else if(phone3.value === ""){
            	advisePhone.innerhtml = "필수 입력사항입니다."
                advisePhone.style.color = "red";
                return false;
            }else if(birthYear.value === "선택하세요."){
            	adviseBirth.innerhtml = "필수 입력사항입니다."
            	adviseBirth.style.color = "red";
                return false;
            }else if(birthMonth.value === "선택하세요."){
            	adviseBirth.innerhtml = "필수 입력사항입니다."
                adviseBirth.style.color = "red";
                return false;
            }else if(birthDay.value === "선택하세요."){
            	adviseBirth.innerhtml = "필수 입력사항입니다."
                adviseBirth.style.color = "red";
                return false;
            }      	
        	
        	
//         	if(toCheckEmail1()){
//         		rawStr = email1.value;
//                 console.log(rawStr);
//                 var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
//                 if(regExp.test(rawStr)){
//                     console.log("OK");
//                     return true
//                 }else{
//                     console.log("Nope");
//                     return false;
//                 }
//             }
//         	if(toCheckEmail2()){
//             	 rawStr = email2.value;
//                  console.log(rawStr);
//                  var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
//                  if(regExp.test(rawStr)){
//                      console.log("ok");
//                  }else{
//                      console.log("nope");
//                  }
//             }
//         	email.value = email1.value + "@" + email2.value;
//         	if(toCheckPw()){
//             	rawStr = pw.value;
//                 console.log(rawStr);
//                 var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
//                 if(regExp.test(rawStr)){
//                     console.log("ok");
//                 }else{
//                     console.log("nope");
//                 }
//             }
//         	if(toCheckConfirmPw()){
//             	if(confirmPw.value != pw.value){
//                     console.log("nope");
//                 }else{
//                     console.log("Ok");
//                 }
//             }
//         	if(toCheckName()){
//             	rawStr = inputName.value;
//                 console.log(rawStr);
//                 var regExp = /^[가-힣]{2,35}$/;
//                 if(regExp.test(rawStr)){
//                     console.log("OK");
//                 }else{
//                     console.log("nope");
//                 }
//             }
//         	if(toCheckNickname()){
//             	rawStr = nickname.value;
//                 console.log(rawStr);
//                 var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{3,18}[A-Za-z0-9]{1}$/;
//                 if(regExp.test(rawStr)){
//                     console.log("ok");
//                 }else{
//                     console.log("nope");
//                 }
//             }
//         	if(toCheckPhone2()){
//             	rawStr = phone2.value;
//                 console.log(rawStr);
//                 var regExp = /^[0-9]{3,4}$/;
//                 if(regExp.test(rawStr)){
//                     console.log("ok");
//                 }else{
//                     console.log("nope");
//                 }
//             }
//         	if(toCheckPhone3()){
//             	rawStr = phone3.value;
//                 console.log(rawStr);
//                 var regExp = /^[0-9]{4}$/;
//                 if(regExp.test(rawStr)){
//                     console.log("ok");
//                 }else{
//                     console.log("nope");
//                 }
//             }
// 			if(toCheckYear()){
                
//             }
//             if(toCheckMonth()){
                
//             }
//             if(toCheckDay()){
                
//             }        	
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
        }     
        //submit 직전 유효성 검사
        
        email1.addEventListener("keyup", function(){
            rawStr = email1.value;
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
            if(regExp.test(rawStr)){
            	adviseEmail.innerhtml = "올바른 이메일 형식이 아닙니다."
                adviseEmail.style.color = "red";
            }else{
            	adviseEmail.innerhtml = "올바른 이메일 형식이 아닙니다."
                adviseEmail.style.color = "red";
            }
        });

        email2.addEventListener("keyup", function(){
            rawStr = email2.value;
            console.log(rawStr);
            var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
            if(regExp.test(rawStr)){
                console.log("ok");
            }else{
                console.log("nope");
            }
        });

        pw.addEventListener("keyup", function(){
            rawStr = pw.value;
            console.log(rawStr);
            var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
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
        

//         email1.addEventListener("keyup", function(){
//             rawStr = email1.value;
//             console.log(rawStr);
//             var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.]*[0-9a-zA-Z]$/;
//             if(regExp.test(rawStr)){
//                 console.log("OK");
//             }else{
//                 console.log("Nope");
//             }
//         });

//         email2.addEventListener("keyup", function(){
//             rawStr = email2.value;
//             console.log(rawStr);
//             var regExp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
//             if(regExp.test(rawStr)){
//                 console.log("ok");
//             }else{
//                 console.log("nope");
//             }
//         });

//         pw.addEventListener("keyup", function(){
//             rawStr = pw.value;
//             console.log(rawStr);
//             var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
//             if(regExp.test(rawStr)){
//                 console.log("ok");
//             }else{
//                 console.log("nope");
//             }
//         });

//         confirmPw.addEventListener("keyup", function(){
//             if(confirmPw.value != pw.value){
//                 console.log("nope");
//             }else{
//                 console.log("Ok");
//             }
//         });

//         inputName.addEventListener("keyup", function(){
//             rawStr = inputName.value;
//             console.log(rawStr);
//             var regExp = /^[가-힣]{2,35}$/;
//             if(regExp.test(rawStr)){
//                 console.log("OK");
//             }else{
//                 console.log("nope");
//             }
//         });

//         nickname.addEventListener("keyup", function(){
//             rawStr = nickname.value;
//             console.log(rawStr);
//             var regExp = /^[A-Za-z]{1}[A-Za-z0-9\_]{3,18}[A-Za-z0-9]{1}$/;
//             if(regExp.test(rawStr)){
//                 console.log("ok");
//             }else{
//                 console.log("nope");
//             }
//         });
        
//         phone2.addEventListener("keyup", function(){
//             rawStr = phone2.value;
//             console.log(rawStr);
//             var regExp = /^[0-9]{3,4}$/;
//             if(regExp.test(rawStr)){
//                 console.log("ok");
//             }else{
//                 console.log("nope");
//             }
//         });

//         phone3.addEventListener("keyup", function(){
//             rawStr = phone3.value;
//             console.log(rawStr);
//             var regExp = /^[0-9]{4}$/;
//             if(regExp.test(rawStr)){
//                 console.log("ok");
//             }else{
//                 console.log("nope");
//             }
//         });  

        window.onload = function(){
            appendYear();
            appendMonth();
            appendDay();
        }

//         email2.addEventListener("blur", function(){
//             if(email1.value != "" && email2.value != ""){
//                 adviseEmail.innerHTML = "중복된 이메일입니다.";
//                 adviseEmail.style.color = "red";
//                 adviseEmail.hidden = false;
//             }          
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
//         });

//         email2.addEventListener("focus", function(){
//             adviseEmail.innerHTML = "";
//             adviseEmail.hidden = true;
//         });

//         nickname.addEventListener("blur", function(){
//             if(nickname.value != ""){
//                 adviseNickname.innerHTML = "중복된 닉네임입니다.";
//                 adviseNickname.style.color = "red";
//                 adviseNickname.hidden = false;
//             }            
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
//         });

//         phone3.addEventListener("blur", function(){
//             if(phone1.value != "" && phone2.value != "" && phone3.value != ""){
//                 advisePhone.innerHTML = "중복된 핸드폰 번호입니다.";
//                 advisePhone.style.color = "red";
//                 advisePhone.hidden = false;
//             }
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
//         });

//         phone3.addEventListener("focus", function(){
//             advisePhone.innerHTML = "";
//             advisePhone.hidden = true;
//         });  

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

    </script>
</body>
</html>