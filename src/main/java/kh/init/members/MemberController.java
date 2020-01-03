package kh.init.members;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
