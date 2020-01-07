package kh.init.members;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.init.members.MemberDTO;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;

	//로그인	
	@RequestMapping("/login.do")
	public String toLogin(String email, String pw) {
		System.out.println("id : " + email);
		System.out.println("pw : " + pw);

		if(service.isLoginOk(email, pw) > 0) {
			session.setAttribute("loginInfo", email);
			return "main";
		}else {
			return "error";
		}
	}
	@RequestMapping("/goMyInfo")
	public String goMyInfo() {
		System.out.println("개인 정보 CON 도착.");
		return "myInformation";
	}

	@RequestMapping(value = "/getMyPage", produces ="text/html; charset=utf-8")
	public String getMyPage() {
		System.out.println("마이페이지 CON 도착.");
		ModelAndView mav = new ModelAndView();
		try {
			MemberDTO dto = service.getMyPageService((String)session.getAttribute("loginInfo"));

			mav.addObject("dto",dto);

			return "good";
		}catch(Exception e) {
			e.printStackTrace();
			return "job";
		}
	}
	@RequestMapping("/withdrawMem")
	public String getout() {
		System.out.println("회원 탈퇴 CON 도착.");
		try {
			int result = service.withdrawMemService("kks@naver.com");
			if(result> 0) {
				session.invalidate();
				System.out.println("회원탈퇴 성공하셨슴당.");
				return "";
			}else {
				System.out.println("회원탈퇴 실패하셨슴당.");
				return "goodjob";
			}


		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "home";
		}


	}

	@RequestMapping("/changeMyInfo")
	public String changeInfo(String pw,String name,String phone) {
		System.out.println("회원 정보 수정 CON 도착.");
		try {
			MemberDTO dto = new MemberDTO();

			int result = service.changeMyInfoService((String)session.getAttribute("loginInfo"), dto);
			if(result> 0) {

				System.out.println("정보변경에 성공하셨슴당.");
				return "home";
			}else {
				System.out.println("정보변경에 실패하셨슴당.");
				return "home";
			}


		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "redirect:home";
		}
	} 
}
