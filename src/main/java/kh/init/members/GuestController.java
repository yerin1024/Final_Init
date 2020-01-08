package kh.init.members;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/guest")
@Controller
public class GuestController {

	@Autowired
	private GuestService service;
	
	@Autowired
	private HttpSession session;
	
	//회원가입	
	@RequestMapping("/signUp.do")
	public String toSignUp() {
		return "members/signUp";
	}
	
	@RequestMapping("/signUpProc.do")
	public String toSignUpProc(MemberDTO dto, MultipartFile profileImg) {
		String path = session.getServletContext().getRealPath("profileImg");
		System.out.println(path);
		service.insert(dto, profileImg);
		System.out.println("회원가입 컨트롤러 진입");
		return "main";
	}

	@RequestMapping(value="/checkEmail.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckEmail(String email) {
		System.out.println(email);
		if(service.checkEmail(email) > 0) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	@RequestMapping(value="/checkNickname.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckNickname(String nickname) {
		System.out.println(nickname);
		if(service.checkEmail(nickname) > 0) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	@RequestMapping(value="/checkPhone.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckPhone(String phone) {
		System.out.println(phone);
		if(service.checkEmail(phone) > 0) {
			return "available";
		}else {
			return "unavailable";
		}
	}

	@RequestMapping("/verifyUser.do")
	public String toVerifyUser() {
		//ajax 비동기로 동작
		return "signUp";
	}


	//아이디 찾기
		
		
	//비밀번호 찾기
		
}
