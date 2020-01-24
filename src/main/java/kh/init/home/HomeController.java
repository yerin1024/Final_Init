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
		session.setAttribute("mediaList", new ArrayList<String>());
		return "main";
	}

	@RequestMapping("/adminHome")
	public String toadminHome() {
		return "adminHome";
		
	}
	@RequestMapping("/home")
	public String home() {
		session.setAttribute("mediaList", new ArrayList<String>());
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
