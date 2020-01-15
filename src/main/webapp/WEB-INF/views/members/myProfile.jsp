<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/member/changeProfile" method="post" enctype="multipart/form-data" id="changeProfile">
        <div class="container">
            <div class="signUpContainer">
                <div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="title">프로필 편집</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                               
                                
                                
                                <label>프로필 사진</label>
                                <img src="resources/default_profile_img.png" id="setProfile" style="width:50px;">
                                <button type="button" id="deletePic">X</button>
                                <input type="file" id="profileImg" name="profileImg" ><br> 
                                <p class="adviseOut" id="adviseProfile" readonly>*프로필 사진 미등록시 기본이미지로 등록됩니다.</p>
                                
                                <label>닉네임 : </label>
                                <input type="text" class="inputNick" name="nickname" maxlength="20" value="${dto.nickname }">
                                <label class="adviseIn" id="adviseInNickname" hidden></label><br>
                                <p class="adviseOut" id="adviseNickname" readonly>*4~20자 영문 대 소문자, 숫자, 특수문자(_)만 사용 가능합니다.</p>
                                <label>상태 매세지 : </label>
                                <input type="text" class="inputProfile_msg" name="profile_msg" maxlength="200" value="${dto.profile_msg }">
                                <label class="adviseIn" id="adviseInProfile-msg" hidden></label><br>
                                <p class="adviseOut" id="adviseProfile-msg" readonly>*4~200자 영문 대 소문자, 숫자, 특수문자(_)만 사용 가능합니다.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="changeProfileBtn" onclick="formValidation();">편집 완료</button>
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
        var changeProfile = doc.getElementById("changeProfile");

       
        var nickname = doc.getElementsByClassName("inputNick")[0];
       
        var profile_msg = doc.getElementsByClassName("profile_msg")[0];
       
        var adviseNickname = doc.getElementById("adviseNickname");
       
        var adviseInNickname = doc.getElementById("adviseInNickname");
      
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
        
        

        

        function formValidation(){

            for(var i = 0; i < adviseIn.length; i++){
                if(adviseIn[i].innerHTML === "사용불가"){
                    console.log("유효성 통과 탈락");
                    return false;
                }
            }

        	if(nickname.value === ""){
            	adviseNickname.innerHTML = "필수 입력사항입니다."
                adviseNickname.style.color = "red";
                return false;
            }
        	  	
        	
            console.log("완성 닉네임 : " + nickname.value);
                  
            
            changeProfile.submit();
        }     
        //submit 직전 유효성 검사

    </script>

</body>
</html>