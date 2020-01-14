package kh.init.home;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.init.members.MemberDTO;

@Controller
public class HomeController {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/main")
	public String toMain() {
		return "main";
	}

	@RequestMapping("/home")
	public String home() {
		//임시로 home에 생성하도록 했고 이후에 로그인 성공하는 순간으로 바꿔야함 
		session.setAttribute("mediaList", new ArrayList<String>());

		MemberDTO tmpInfo = new MemberDTO("yerinEMAIL", "yerinPW", "yerinNICKNAME", "yerin", "010", "19961024", null,null,null,null,null,null);
		session.setAttribute("loginInfo", tmpInfo);
		System.out.println("homeController :" + ((MemberDTO)session.getAttribute("loginInfo")).toString());
		return "home";
	}
	
	@RequestMapping("/fileTest")
	public String test() {
		return "fileTest";
	}
	
	@RequestMapping("/gridTest")
	public String toGridJsp() {
		return "frames/frame_grid";
	}
	
	@RequestMapping("/singleTest")
	public String toSingleJsp() {
		return "frames/frame_single";
	}	
}
