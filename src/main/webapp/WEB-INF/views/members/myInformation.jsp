<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/changeMyInfo"
		method="post" id="changeMyInfo">
		<div class="container">
			<div class="changeMyInfoContainer">
				<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
					aria-labelledby="loginModalTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="title">회원정보 수정</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<label>이메일</label> ${dto.email}<br> <label>현재 비밀번호</label>
								<input type="password" class="cPw" name="currentPw"
									id="currentPw" maxlength="12"> <label class="adviseIn"
									id="adviseInCPw" hidden></label><br> <label>새로운
									비밀번호 </label> <input type="password" class="inputPw" name="pw"
									maxlength="12"> <label class="adviseIn" id="adviseInPw"
									hidden></label><br> <br> <label>새로운 비밀번호 확인</label> <input
									type="password" class="confirmPw" maxlength="12">
								<p class="adviseOut" id="advisePw" readonly>*6~15자 영문 대 소문자,
									숫자를 조합하여 사용 가능합니다.</p>
								<!-- <p class="adviseOut" id="adviseConfirmPw" readonly></p> -->
								<label>이름</label> <input type="text" class="inputName"
									name="name" maxlength="70" value=${dto.name }> <label
									class="adviseIn" id="adviseInName" hidden></label><br>
								<p class="adviseOut" id="adviseName" readonly></p>

								<label>전화번호</label> <select class="phone1">
									<option value="010" class="pOption1">010</option>
									<option value="011" class="pOption1">011</option>
									<option value="016" class="pOption1">016</option>
									<option value="017" class="pOption1">017</option>
									<option value="018" class="pOption1">018</option>
									<option value="019" class="pOption1">019</option>
								</select> -<input type="text" class="phone2" maxlength="4"
									value="${poption2}"> -<input type="text" class="phone3"
									maxlength="4" value="${poption3}"> <input type="text"
									class="phone" name="phone" maxlength="11" hidden> <label
									class="adviseIn" id="adviseInPhone" hidden></label>
								<p class="adviseOut" id="advisePhone" readonly></p>

								<input type="text" id="verif_code" name="verif_code"
									placeholder="인증번호"> <label class="adviseIn"
									id="adviseInVerifCode" hidden></label>
								<button type="button" id="sendCode" onclick="checkPhone();">send</button>
								<br>
								<p class="adviseOut" id="adviseVerifCode" readonly></p>

								<label>생년월일</label> <select id="year" class="birthYear">
									<option class="bOption1">선택하세요.</option>
								</select> <select id="month" class="birthMonth">
									<option class="bOption2">선택하세요.</option>
								</select> <select id="day" class="birthDay">
									<option class="bOption3">선택하세요.</option>
								</select> <input type="text" class="inputBirth" name="birth" hidden><br>
								<p class="adviseOut" id="adviseBirth" readonly></p>

							</div>
							<div class="modal-footer">
								<button type=button id="withdrawMem">회원탈퇴</button>
								<button type=button id="changeInfo" onclick="formValidation();">수정완료</button>
								<button type=button id="backToFeed">뒤로가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>



	<script>
	$('#currentPw').on('keyup',function() {
		var cpassword = $(this).val();
		
		$('.frInfo').remove();
					$.ajax({
							url : "${pageContext.request.contextPath}/member/identifyMemPw",
							type : "POST",
							dataType : "text",
							data:{
								pw:cpassword
							},
							success : function(res) {
							
							console.log(res);
							if(res == "yes"){
								advisePw.innerHTML = "비밀번호가 일치합니다."
				                    advisePw.style.color = "green";
				                adviseInCPw.innerHTML = "사용가능";
				                console.log("validate");
				            }else{
				            	advisePw.innerHTML = "비밀번호가 일치하지 않습니다."
				                    advisePw.style.color = "red";
				                adviseInCPw.innerHTML = "사용불가";
				                console.log("invalidate");
				            }
							
									
								},
								error : function(request, status, error) {
									console.log("ajax call went wrong:"
											+ request.responseText);
								}
							});

				});
	
//         window.onready =function(){
        	console.log('${poption}');
//         }
        var dLength = $(".pOption1").length;
       
        for(var i=0;i<dLength;i++){
        	if($(".pOption1:nth-child("+i+")").val() == '${poption1}'){
        		$(".pOption1:nth-child("+i+")").attr('selected','selected');
        	}
        	
        }
        
        var doc = document;
        var rawStr = null;
        var changeMyInfo = doc.getElementById("changeMyInfo");

        var cPw = doc.getElementsByClassName("cPw")[0];
        var pw = doc.getElementsByClassName("inputPw")[0];
        var confirmPw = doc.getElementsByClassName("confirmPw")[0];
       
        var phone = doc.getElementsByClassName("phone")[0];
        var phone1 = doc.getElementsByClassName("phone1")[0];
        var phone2 = doc.getElementsByClassName("phone2")[0];
        var phone3 = doc.getElementsByClassName("phone3")[0];
        var inputName = doc.getElementsByClassName("inputName")[0];
        var birthYear = doc.getElementsByClassName("birthYear")[0];
        var birthMonth = doc.getElementsByClassName("birthMonth")[0];
        var birthDay = doc.getElementsByClassName("birthDay")[0];
        var birth = doc.getElementsByClassName("inputBirth")[0];
        
       
       
        var verif_code = doc.getElementById("verif_code");
        
        var advisePw = doc.getElementById("advisePw");
        
        var advisePhone = doc.getElementById("advisePhone");
        var adviseBirth = doc.getElementById("adviseBirth");
        var adviseName = doc.getElementById("adviseName");

        var adviseInCPw = doc.getElementById("adviseInCPw");
        var adviseInPw = doc.getElementById("adviseInPw");
       
        var adviseInName = doc.getElementById("adviseInName");
        var adviseInPhone = doc.getElementById("adviseInPhone");
        var adviseInVerifCode = doc.getElementById("adviseInVerifCode");
        var adviseIn = doc.getElementsByClassName("adviseIn");

       

        

       
        
        

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
            
            var bLength1 = $(".bOption1").length;
            console.log(${dto.birth});
            console.log(${boption1});
            console.log(${boption2});
            console.log(${boption3});
            for(var i=0;i<bLength1;i++){
            	if($(".bOption1:nth-child("+i+")").val() ==  '${boption1}'+"년"){
            		$(".bOption1:nth-child("+i+")").attr('selected','selected');
            	}
            	
            }
            var bLength2 = $(".bOption2").length;
            
            for(var i=0;i<bLength2;i++){
            	if($(".bOption2:nth-child("+i+")").val() == '${boption2}'+"월"){
            		$(".bOption2:nth-child("+i+")").attr('selected','selected');
            	}
            	
            }
            var bLength3 = $(".bOption3").length;
            
            for(var i=0;i<bLength3;i++){
            	if($(".bOption3:nth-child("+i+")").val() == '${boption3}'+"일"){
            		$(".bOption3:nth-child("+i+")").attr('selected','selected');
            	}
            	
            }
        }

        function checkPhone(){
            phone.value = phone1.value + phone2.value + phone3.value;
            $.ajax({
                url : "${pageContext.request.contextPath}/guest/checkPhone.do",
                data : {phone : phone.value},
                dataType : "json",
                type : "post"
                }).done(function(resp){
                    console.log(resp);
                    if(resp.result == "available"){
                        adviseInPhone.innerHTML = "사용가능";
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

        function appendYear(){
            var date = new Date();
            var year = date.getFullYear();
            var selectVal = doc.getElementById("year");
            var optionIndex = 0;
            for(var i=year-100;i<=year;i++){
            	if("${boption1}" == i){
            		var opt = new Option(i+"년",i);
                	selectVal.add(opt,optionIndex++);
                    opt.setAttribute("class","bOption1");
                    opt.setAttribute("selected","selected");
            	}else{
            		var opt = new Option(i+"년",i);
                	selectVal.add(opt,optionIndex++);
                    opt.setAttribute("class","bOption1");
            	}
            	
            	
            }
        }
        
        function appendMonth(){
            var selectVal = doc.getElementById("month");
            var optionIndex = 0;
            for(var i=1;i<=12;i++){
            	if("${boption2}" == i){
            		var opt = new Option(i+"월",i);
                	selectVal.add(opt,optionIndex++);
                    opt.setAttribute("class","bOption2");
                    opt.setAttribute("selected","selected");
            	}else{
            		var opt = new Option(i+"월",i);
                	selectVal.add(opt,optionIndex++);
                    opt.setAttribute("class","bOption2");
            	}
            	}           
        }

        function appendDay(){
            var selectVal = doc.getElementById("day");
            var optionIndex = 0;
            for(var i=1;i<=31;i++){
            	if("${boption3}" == i){
            		var opt = new Option(i+"일",i);
                	selectVal.add(opt,optionIndex++);
                    opt.setAttribute("class","bOption3");
                    opt.setAttribute("selected","selected");
            	}else{
            		var opt = new Option(i+"일",i);
                	selectVal.add(opt,optionIndex++);
                    opt.setAttribute("class","bOption3");
            	}
            	
            	}            
        }        

        

        function formValidation(){

            for(var i = 0; i < adviseIn.length; i++){
                if(adviseIn[i].innerHTML === "사용불가"){
                    console.log("유효성 통과 탈락");
                    return false;
                }
            }

        	 if(pw.value === ""){
                advisePw.innerHTML = "필수 입력사항입니다."
                advisePw.style.color = "red";
                return false;
            }else if(cPw.value === ""){
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
          
          
            console.log("완성 생년월일 : " + birth.value);       
            
            changeMyInfo.submit();
        }     
        //submit 직전 유효성 검사

    </script>
	<script>
$("#withdrawMem").on("click",function(){
	location.href = "${pageContext.request.contextPath}/member/withdrawMem";
})
$("#backToFeed").on("click", function() {
			location.href = "${pageContext.request.contextPath}/feed/myFeed";
		});
</script>
</body>
</html>