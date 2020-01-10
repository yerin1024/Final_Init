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
	
	//회원가입	
	@RequestMapping("/signUp.do")
	public String toSignUp(Model model) {
		
		return "members/signUp";
	}
	
	@RequestMapping("/signUpProc.do")
	public String toSignUpProc(MemberDTO dto, MultipartFile profileImg, Model model) {
		String path = session.getServletContext().getRealPath("files");
		if(profileImg.getOriginalFilename() == "") {
			service.insert(dto, null, path);
		}else {
			service.insert(dto, profileImg, path);
		}
		System.out.println("회원가입 컨트롤러 진입");
//		model.addAttribute("profile1", service.getProfile("abcdefg@hanmail.net"));
//		model.addAttribute("profile2", service.getProfile("eunbi_46@naver.com"));
//		return "testImg";
		return "main";
	}

	@RequestMapping(value="/checkEmail.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckEmail(String email) {
		System.out.println(email);		
		if(service.checkEmail(email) <= 0) {
			obj.addProperty("result", "available");
			return obj.toString();
		}else {
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}
	
	@RequestMapping(value="/checkNickname.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckNickname(String nickname) {
		System.out.println(nickname);
		if(service.checkNickname(nickname) <= 0) {
			System.out.println("AAA");
			obj.addProperty("result", "available");
			return obj.toString();
		}else {
			System.out.println("BBB");
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}
	
	@RequestMapping(value="/checkPhone.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckPhone(String phone) {
		System.out.println(phone);
		if(service.checkPhone(phone) <= 0) {
			obj.addProperty("result", "available");
			return obj.toString();
		}else {
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}
	
	@RequestMapping("/sendVerifCode.do")
	@ResponseBody
	public String toSendVerifCode(String phone) {
		
		System.out.println("phone: " + phone);
		
		String api_key = "NCSUEKNQT3HPHHH9";
		String api_secret = "ILQGY1OP8WXQE5ZZ42KAEXVFK5EWA4UZ";
		Message coolsms = new Message(api_key, api_secret);
		String ranNum = Utils.generateCertNum();
		System.out.println(ranNum);
//		HashMap<String, String> set = new HashMap<String, String>();
//		set.put("to", "01051922972");
//		set.put("from", phone);
//		set.put("text", "[Init] 인증번호는 [" + ranNum + "] 입니다.");
//		set.put("type", "SMS");
//		set.put("app_version", "test app 2.2");
//		System.out.println("[Init] 인증번호는 [" + ranNum + "] 입니다.");
		
//		try {
//			JSONObject result = coolsms.send(set);
//			System.out.println(result.toString());
//		} catch (CoolsmsException e) {
//			e.printStackTrace();
//		}	
		obj.addProperty("result", ranNum);
		return obj.toString();
	}
	
	
		
	@RequestMapping("/verifyUser.do")
	public String toVerifyUser() {
		//ajax 비동기로 동작
		return "signUp";
	}


	//아이디 찾기
		
		
	//비밀번호 찾기
		
}
