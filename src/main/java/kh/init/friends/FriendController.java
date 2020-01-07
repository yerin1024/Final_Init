package kh.init.friends;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.init.members.MemberService;



@RequestMapping("/member")
@Controller
public class FriendController {


	@Autowired
	private MemberService service;

	@Autowired
	private HttpSession session;

	@RequestMapping("/friendRequest")
	public String friendRequest() {
		return "home";
	}
	@RequestMapping("/acceptFndRequest")
	public String acceptFndRequest() {
		return "home";
	}
	@RequestMapping("/cutFndRelation")
	public String cutFndRelation() {
		return "home";
	}
	@RequestMapping("/selectFndList")
	public String selectFndList() {
		return "home";
	}
}

