package kh.init.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/guest")
@Controller
public class GuestController {

	@Autowired
	private GuestService service;

	//회원가입	
	@RequestMapping("/signUp.do")
	public String toSignUp() {
		return "members/signUp";
	}
	
	@RequestMapping("/signUpProc.do")
	public String toSignUpProc(MemberDTO dto, MultipartFile profileImg) {
		System.out.println(dto.getEmail());
		System.out.println(dto.getBirth());
		System.out.println(dto.getName());
		System.out.println(dto.getNickname());
		System.out.println(dto.getPhone());
		System.out.println(dto.getPw());
		System.out.println("여기서부터 파일!! "); 
		System.out.println(profileImg);
		System.out.println(profileImg.getName());
		System.out.println(profileImg.getOriginalFilename());
		
		
		return "main";
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
