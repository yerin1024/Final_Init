package kh.init.home;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/main")
	public String toMain() {
		return "main";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";
	}
}
