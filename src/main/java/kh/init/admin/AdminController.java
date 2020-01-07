package kh.init.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.init.feeds.FeedDTO;
import kh.init.members.MemberDTO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private AdminService aService;

	@RequestMapping("adminHome.do")
	public String adminHome() throws Exception {
		return "admin/adminHome";
	}

	@RequestMapping("blackList.do")
	public String blackList(Model mod) throws Exception {
		List<MemberDTO> blackList = aService.blackList();
		mod.addAttribute("blackList", blackList);
		return "admin/manageBlack";
	}

	@RequestMapping("memberList.do")
	public String memberList(Model mod) throws Exception {
		List<MemberDTO> memberList = aService.memberList();
		mod.addAttribute("memberList", memberList);
		return "admin/manageMember";
	}

	@RequestMapping("blackProc.do")
	@ResponseBody
	public String blackProc(String blackMember) throws Exception {
		System.out.println(blackMember);
		int toBlack = aService.toBlack(blackMember);
		if (toBlack > 0) {
			return blackMember;
		} else {
			return "black fail";
		}
	}

	@RequestMapping("withdrawalProc.do")
	@ResponseBody
	public String withdrawalProc(String withdrawal) throws Exception {
		String email = withdrawal.substring(withdrawal.lastIndexOf("_") + 1);
		System.out.println(email);
		int withdrawalR = aService.withdrawal(email);
		if (withdrawalR > 0) {
			return withdrawal;
		} else {
			return "withdrawal fail";
		}
	}

	@RequestMapping("toMemberProc.do")
	@ResponseBody
	public String toMember(String cbMember) throws Exception {
		System.out.println(cbMember);
		String email = cbMember.substring(cbMember.lastIndexOf("_") + 1);
		System.out.println(email);
		int toMemberR = aService.toMember(email);
		if (toMemberR > 0) {
			return cbMember;
		} else {
			return "toMember fail";
		}
	}

	@RequestMapping("goFeed.do")
	public String goFeed(String email, Model mod) throws Exception {
		List<FeedDTO> list = aService.myFeedList(email);
		mod.addAttribute("list", list);
		return "feeds/myFeed";
	}

	@RequestMapping("deleteFeed.do")
	public String deleteFeedProc(int feed_seq) throws Exception {
		int deleteR = aService.deleteFeed(feed_seq);
		if (deleteR > 0) {
			return "deleteFeed success";
		} else {
			return "deleteFeed fail";
		}
	}

	@RequestMapping("search.do")
	public String searchProc(String searchTag, String search, Model mod) throws Exception {
		System.out.println(searchTag + ":" + search); 
		List<MemberDTO> searchList = aService.search(searchTag, search); 
		mod.addAttribute("memberList",searchList); 
		return "admin/manageMember";
	}
	@RequestMapping("searchForBlack.do")
	public String searchForBlack(String searchTag, String search, Model mod) throws Exception {
		System.out.println(searchTag + ":" + search); 
		List<MemberDTO> searchList = aService.searchForBlack(searchTag, search); 
		mod.addAttribute("blackList",searchList);
		return "admin/manageBlack";
	}
}
