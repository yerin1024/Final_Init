package kh.init.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/guest")
@Controller
public class GuestController {

	@Autowired
	private GuestService service;

	//회원가입	
	@RequestMapping("/signUp.do")
	public String toSignUp() {
		return "signUp";
	}

	@RequestMapping("/emailCheck.do")
	public String toCheckEmail() {
		//ajax 비동기로 동작
		return "signUp";
	}

	@RequestMapping("/verifyUser.do")
	public String toVerifyUser() {
		//ajax 비동기로 동작
		return "signUp";
	}

	//아이디 찾기
		
		
	//비밀번호 찾기
		
}
