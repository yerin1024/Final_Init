<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/nav.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<style>
	body{
	background-color:white;
	}
	#modalBox{
	 
	}
	</style>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/resources/jsp/nav.jsp" />
	<div id="modalBox" class="modal fade" id="myModal"
		role="dialog"  tabindex="-1" aria-labelledby="myModalLabel"
		style="margin-top: 45px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header header">
					<h4 class="modal-title" id="myModalLabel" style="color:white;">My Information</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color:white;">×</span>
					</button>

				</div>

				<div class="modal-body">
					
						<form action="${pageContext.request.contextPath}/member/changeMyInfo"
		method="post" id="signUpForm">
		
		<div class="body" style="text-align:center; color:#0D4373;">
			<!-- 이메일 -->
			<label></label>
			 
			<div class="userInput" id="email" name="email" style=" font-family:fantasy;font-size: 20px; ">${loginInfo.email}</div>
			<br>
			<label>비밀번호</label><br>
			<div id="changePwDiv" style="display:none;">
				<!-- 현재 비밀번호 -->
				<label>현재 비밀번호</label>
				<input type="password" class="userInput" autocomplete="off" id="curPw" maxlength="12">
				<p class="advise" id="adviseCurPw" readonly></p>
				<p class="hiddenResp" id="hiddenRespCurPw" style="display:none;"></p>
				<!-- 변경 비밀번호 -->			
				<label>변경 비밀번호</label><span class="required">*</span><br> 
				<input type="password" class="userInput" autocomplete="off" id="pw"
					name="pw" maxlength="12" placeholder="비밀번호(영문 대소문자, 숫자 6~15자리)">
				<!-- 변경 비밀번호 확인 -->
				<input type="password" class="userInput" autocomplete="off"
					id="confirmPw" maxlength="12" placeholder="비밀번호 재입력"><br>
				<p class="advise" id="advisePw" readonly></p>
				<p class="hiddenResp" id="hiddenRespPw" style="display:none;"></p><br>
			</div>
			<button type="button" id="changePw">비밀번호 변경</button>
			<br><button type="button" id="cancelChangePw" style="display:none;">이전</button>
			 <button type="button" id="changePwComplete" style="display:none;">변경 완료</button><br>
						
			<!-- 이름 -->
			<label>이름</label><span class="required">*</span class="required"><br> <input
				type="text" class="userInput" id="username" name="name"
				maxlength="70" value="${dto.name}">
			<p class="advise" id="adviseName" readonly></p>
			<p class="hiddenResp" id="hiddenRespName" style="display:none;"></p>
			<!-- 생년월일 -->
			<label>생년월일</label><span class="required">*</span class="required"><br> 
			<select name="year" id="birthYear">
				<option class="bOption1">선택하세요.</option>
			</select>
			<select name="month" id="birthMonth">
				<option class="bOption2">선택하세요.</option>
			</select>
			<select name="day" id="birthDay">
				<option class="bOption3">선택하세요.</option>
			</select> 
			<input type="text" id="birth" name="birth" hidden><br>
			<p class="advise" id="adviseBirth" readonly></p>
			<p class="hiddenResp" id="hiddenRespBirth" style="display:none;"></p>
			<!-- 전화번호 -->
			<label>전화번호</label><span class="required">*</span class="required"><br> <select
				id="phone1"
				style="text-align: center; width: 80px; height: 30px">
				<option class="pOption1" value="010">010</option>
				<option class="pOption1" value="011">011</option>
				<option class="pOption1" value="016">016</option>
				<option class="pOption1" value="017">017</option>
				<option class="pOption1" value="018">018</option>
				<option class="pOption1" value="019">019</option>
			</select> - <input type="text" id="phone2" maxlength="4"
				style="text-align: center; width: 80px;" value="${poption2}"> - <input
				type="text" id="phone3" maxlength="4"
				style="text-align: center; width: 80px;" value="${poption3}"> 
			<input type="text" id="phone" name="phone" maxlength="11" style="display:none;">
			<p class="advise" id="advisePhone" readonly></p>
			<p class="hiddenResp" id="hiddenRespPhone" style="display:none;"></p>
			<!-- 인증번호 -->
			<input type="text" id="verifyCode" name="verifyCode"
				placeholder="인증번호 입력" maxlength="6" style="text-align: center;">
			<button type="button" id="sendCode" onclick="checkOverlap();">인증번호
				전송</button>
			<span id="timer" readonly></span>
			<button type="button" id="resendCode"
				onclick="checkOverlap();" hidden>인증번호 재전송</button>
			<br>
			<button type="button" id="confirmVerifyCode"
				onclick="confirmVerifCode();" hidden>인증번호 확인</button>
			<br>
			<p class="advise" id="adviseVerifCode" readonly></p>
			<p class="hiddenResp" id="hiddenRespVerifCode" hidden></p>
		</div>
		<div class="footer" style="text-align:center;">
			<button type=button id="withdrawMem">회원탈퇴</button>
			<button type=button id="changeInfo" onclick="formValidation();">수정완료</button>
			<button type=button id="backToFeed">뒤로가기</button>
		</div>
	</form>
					
				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$('#modalBox').modal('show');
		var doc = document;
	
	    // 입력 변수
	    var curPw = doc.getElementById("curPw");
	    var pw = doc.getElementById("pw");
	    var confirmPw = doc.getElementById("confirmPw");
	    var username = doc.getElementById("username");
	    var birthYear = doc.getElementById("birthYear");
	    var birthMonth = doc.getElementById("birthMonth");
	    var birthDay = doc.getElementById("birthDay");
	    var birth = doc.getElementById("birth");
	    var phone = doc.getElementById("phone");
	    var phone1 = doc.getElementById("phone1");
	    var phone2 = doc.getElementById("phone2");
	    var phone3 = doc.getElementById("phone3");
	    var verifyCode = doc.getElementById("verifyCode");
	    var sendCode = doc.getElementById("sendCode");
	    var resendCode = doc.getElementById("resendCode");
	    var confirmVerifyCode = doc.getElementById("confirmVerifyCode");
	    var timer = doc.getElementById("timer");
	    var changePwDiv = doc.getElementById("changePwDiv");
	    var changePw = doc.getElementById("changePw");
	    var changePwComplete = doc.getElementById("changePwComplete");
	    var cancelChangePw = doc.getElementById("cancelChangePw");
			    
	    // 검증 실시간 확인 변수
	    var adviseCurPw = doc.getElementById("adviseCurPw");
	    var advisePw = doc.getElementById("advisePw");
	    var adviseName = doc.getElementById("adviseName");
	    var adviseBirth = doc.getElementById("adviseBirth");
	    var advisePhone = doc.getElementById("advisePhone");
	    var adviseVerifCode = doc.getElementById("adviseVerifCode");
	
	    // 검증결과 변수
	    var hiddenResp = doc.getElementsByClassName("hiddenResp");
	    var hiddenRespCurPw = doc.getElementById("hiddenRespCurPw");
	    var hiddenRespPw = doc.getElementById("hiddenRespPw");
	    var hiddenRespName = doc.getElementById("hiddenRespName");
	    var hiddenRespBirth = doc.getElementById("hiddenRespBirth");
	    var hiddenRespPhone = doc.getElementById("hiddenRespPhone");
	    var hiddenVerifCode = doc.getElementById("hiddenVerifCode");
	
	    // 기타 전역 변수
	    var setTime = 300;
	    var tid = null;
	    var rawStr = null;	
	    
	    window.onload = function(){
            appendYear();
            appendMonth();
            appendDay();
            
            var dLength = $(".pOption1").length;
    		for (var i = 0; i < dLength; i++) {
    			if ($(".pOption1:nth-child(" + i + ")").val() == '${poption1}') {
    				$(".pOption1:nth-child(" + i + ")")
    						.attr('selected', 'selected');
    			}
    		}

    		var bLength1 = $(".bOption1").length;
    		for (var i = 0; i < bLength1; i++) {
    			if ($(".bOption1:nth-child(" + i + ")").val() == '${boption1}'
    					+ "년") {
    				$(".bOption1:nth-child(" + i + ")")
    						.attr('selected', 'selected');
    			}
    		}

    		var bLength2 = $(".bOption2").length;
    		for (var i = 0; i < bLength2; i++) {
    			if ($(".bOption2:nth-child(" + i + ")").val() == '${boption2}'
    					+ "월") {
    				$(".bOption2:nth-child(" + i + ")")
    						.attr('selected', 'selected');
    			}
    		}

    		var bLength3 = $(".bOption3").length;
    		for (var i = 0; i < bLength3; i++) {
    			if ($(".bOption3:nth-child(" + i + ")").val() == '${boption3}'
    					+ "일") {
    				$(".bOption3:nth-child(" + i + ")")
    						.attr('selected', 'selected');
    			}
    		}
		}	    
	    
	    
	    changePw.addEventListener("click", function(){
	    	changePwComplete.style.display = "initial";
	    	cancelChangePw.style.display = "initial";
	    	changePw.style.display = "none";
	    	changePwDiv.style.display = "initial";
	    });
	    
		cancelChangePw.addEventListener("click", function(){
			pw.value = "";
			changePwComplete.style.display = "none";
			cancelChangePw.style.display = "none";
	    	changePw.style.display = "initial";
	    	changePwDiv.style.display = "none";
	    });
	    
	    changePwComplete.addEventListener("click", function(){
	    	if (pw.value === "") {
                advisePw.innerHTML = "필수 입력사항입니다."
                advisePw.style.color = "red";
                return false;
            } 	    	
	    	$.ajax({
	    		url: "${pageContext.request.contextPath}/member/changePw",
	    		data: {pw : pw.value},
	    		type: "post",
	    		dataType: "json"
	    	}).done(function(resp){
	    		if(resp.result == "complete"){
	    	    	changePwComplete.style.display = "none";
	    	    	cancelChangePw.style.display = "none";
	    	    	changePw.style.display = "initial";
	    	    	changePwDiv.style.display = "none";
	    	    	alert("비밀번호가 정상적으로 변경되었습니다.");
	    		}else{
	    			alert("비밀번호 변경에 실패했습니다.");
	    		}
	    	}).fail(function(a,b,c){
	    		console.log(a);
	    		console.log(b);
	    		console.log(c);s
	    	});
	    	
	    	

	    });
		

		$("#withdrawMem").on("click", function() {
			location.href = "${pageContext.request.contextPath}/member/withdrawMem";
		});
		$("#backToFeed").on("click", function() {
			location.href = "${pageContext.request.contextPath}/feed/myFeed?email=${dto.email}";
		});
		
		//현재 비밀번호 일치여부 검사 start
		curPw.addEventListener("blur", function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/member/identifyMemPw",
				data: {pw: curPw.value},
				type: "post",
				dataType: "json",
			}).done(function(resp){
				console.log(resp);
				if(resp.result == "validate"){
					adviseCurPw.innerHTML = "일치"
					adviseCurPw.style.color = "green";
					hiddenRespPw.innerHTML = "사용가능";						
				}else if(resp.result == "invalidate"){
					adviseCurPw.innerHTML = "비밀번호를 정확히 입력해 주세요."
					adviseCurPw.style.color = "red";
					hiddenRespPw.innerHTML = "사용불가";
					curPw.focus();
				}
			}).fail(function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
				hiddenRespPw.innerHTML = "사용불가";
			});
		});
			
		 // 비밀번호 유효성 검사 start
        pw.addEventListener("blur", function () {
            rawStr = pw.value;
            console.log("pw: " + rawStr);
            var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
            if (rawStr.length != 0) {
                if (regExp.test(rawStr)) {
                	if(rawStr == curPw.value){
                		advisePw.innerHTML = "기존 비밀번호와 동일하게 설정 불가합니다."
                        advisePw.style.color = "red";
                        hiddenRespPw.innerHTML = "사용불가";
                        pw.focus();
                	}
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
                if("${dto.phone}" == phone.value){
                	 advisePhone.innerHTML = "기존 번호와 동일하여 인증 불가합니다.";
                     advisePhone.style.color = "red";
                     hiddenRespPhone.innerHTML = "사용가능";
                     return false;
                }
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
                            //잠시 테스트 
                             hiddenRespPhone.innerHTML = "사용가능";
                            //
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
        	          if (resp.result == "verified") {
        	            console.log("인증 완료 ");
                        adviseVerifCode.innerHTML = "인증완료";
                        adviseVerifCode.style.color = "green";
                        hiddenRespPhone.innerHTML = "사용가능";
                        hiddenRespVerifCode.innerHTML = "사용가능";
                        sendCode.hidden = true;
                        resendCode.hidden = true;
                        verifyCode.disabled = true;
        	          } else if (resp.result == "unverified") {
        	            console.log("인증 실패 ");
        	            adviseVerifCode.innerHTML = "인증실패";
        	            adviseVerifCode.style.color = "red";
        	            hiddenRespPhone.innerHTML = "사용불가";
        	            hiddenRespVerifCode.innerHTML = "인증실패";
        	            sendCode.hidden = true;
        	            resendCode.hidden = false;
        	            verifyCode.disabled = false;
        	          };
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
            
			//생년월일 select option 생성 start
            function appendYear() {
                var date = new Date();
                var year = date.getFullYear();
                var selectVal = doc.getElementById("birthYear");
                var optionIndex = 0;
                for (var i = year - 100; i <= year; i++) {
    				if ("${boption1}" == i) {
    					var opt = new Option(i + "년", i);
    					selectVal.add(opt, optionIndex++);
    					opt.setAttribute("class", "bOption1");
    					opt.setAttribute("selected", "selected");
    				} else {
    					var opt = new Option(i + "년", i);
    					selectVal.add(opt, optionIndex++);
    					opt.setAttribute("class", "bOption1");
    				}
    			}
            }

            function appendMonth() {
                var selectVal = doc.getElementById("birthMonth");
                var optionIndex = 0;
                for (var i = 1; i <= 12; i++) {
    				if ("${boption2}" == i) {
    					var opt = new Option(i + "월", i);
    					selectVal.add(opt, optionIndex++);
    					opt.setAttribute("class", "bOption2");
    					opt.setAttribute("selected", "selected");
    				} else {
    					var opt = new Option(i + "월", i);
    					selectVal.add(opt, optionIndex++);
    					opt.setAttribute("class", "bOption2");
    				}
    			}
            }

            function appendDay() {
                var selectVal = doc.getElementById("birthDay");
                var optionIndex = 0;
                for (var i = 1; i <= 31; i++) {
    				if ("${boption3}" == i) {
    					var opt = new Option(i + "일", i);
    					selectVal.add(opt, optionIndex++);
    					opt.setAttribute("class", "bOption3");
    					opt.setAttribute("selected", "selected");
    				} else {
    					var opt = new Option(i + "일", i);
    					selectVal.add(opt, optionIndex++);
    					opt.setAttribute("class", "bOption3");
    				}
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
                if (username.value === "") {
                    adviseName.innerHTML = "필수 입력사항입니다."
                    adviseName.style.color = "red";
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
                } 
                if("${dto.phone}" != phone.value){
                	if(verifyCode.value === ""){
                		adviseVerifCode.innerHTML = "휴대폰 인증은 필수입니다."
                            adviseVerifCode.style.color = "red";
                            return false;
                	}
                }
                //모든 입력창 null 체크 end 

                //전화번호, 이메일 한 줄로 조합 start
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
                phone.value = phone1.value + phone2.value + phone3.value;
                //전화번호, 이메일 한 줄로 조합 end

                console.log("최종 휴대폰 : " + phone.value);
                console.log("최종 비밀번호 : " + pw.value);
                console.log("최종 이름 : " + username.value);
                console.log("최종 생년월일 : " + birth.value);

                doc.getElementById("signUpForm").submit();
            };		
	</script>
</body>
</html>