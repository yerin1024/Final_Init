package kh.init.members;


import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.init.configuration.Utils;
import net.nurigo.java_sdk.api.Message;

@RequestMapping("/guest")
@Controller
public class GuestController {

	@Autowired
	private GuestService service;
	
	@Autowired
	private HttpSession session;
	
	JsonObject obj = new JsonObject();
	
	//회원가입	페이지 로드
	@RequestMapping("/signUp.do")
	public String toSignUp(Model model) {
		return "members/signUp";
	}
	
	//회원가입	처리(신규회원 추가)
	@RequestMapping("/signUpProc.do")
	public String toSignUpProc(MemberDTO dto, MultipartFile profileImg, Model model) {
		System.out.println("가입 요청 정보 : " + dto.toString());
		String path = session.getServletContext().getRealPath("files");
		if(profileImg.getOriginalFilename() == "") { //프로필 미등록 시
			service.insert(dto, null, path);
		}else { //프로필 등록 시 
			service.insert(dto, profileImg, path);
		}
		return "main";
	}

	//이메일 중복확인
	@RequestMapping(value="/checkEmail.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckEmail(String email) {
		System.out.println("이메일 중복확인 : " + email);		
		if(service.checkEmail(email) <= 0) { //사용 가능 이메일
			obj.addProperty("result", "available"); 
			return obj.toString();
		}else { //사용 불가 이메일
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}
	
	//닉네임 중복확인
	@RequestMapping(value="/checkNickname.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckNickname(String nickname) {
		System.out.println("닉네임 중복확인 : " + nickname);
		if(service.checkNickname(nickname) <= 0) { //사용 가능 닉네임
			obj.addProperty("result", "available");
			return obj.toString();
		}else { //사용 불가 닉네임
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}
	
	//전화번호 중복확인
	@RequestMapping(value="/checkPhone.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckPhone(String phone) {
		System.out.println("전화번호 중복확인 : " + phone);
		if(service.checkPhone(phone) <= 0) { //사용 가능 번호
			obj.addProperty("result", "available");
			return obj.toString();
		}else { //사용 불가 번호
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}
	
	//휴대폰 본인인증 인증번호 전송
	@RequestMapping("/sendVerifCode.do")
	@ResponseBody
	public String toSendVerifCode(String phone) {
		String ranNum = service.sendVerifCode(phone); //인증번호 생성
		System.out.println("인증번호 생성 : " + ranNum);
		obj.addProperty("result", ranNum);
		return obj.toString();
		//클라이언트에 넘기지 않고 서버로 다시 값 반환받아 처리 예정
	}
	
	@RequestMapping("/verifyUser.do")
	public String toVerifyUser() {
		return "signUp";
	}		
}
