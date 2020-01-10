package kh.init.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	//멤버관리
	@RequestMapping("memberList.do")
	public String memberList(Model mod, String page) throws Exception {
		System.out.println("현재 넘어온 페이지 값  : " + page);
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}

		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end =  cpage * Configuration.recordCountPerPage;
		String pageNavi = aService.getPageNavi(cpage);
		if(pageNavi.contains("redirect:memberList.do?page=")) {
			return pageNavi;
		}
		System.out.println(pageNavi);
		mod.addAttribute("pageNavi", pageNavi);
		List<MemberDTO> memberList = aService.selectByPage(start, end);
		mod.addAttribute("memberList", memberList);
		return "admin/manageMember";
	}
	@RequestMapping("search.do")
	public String searchProc(String searchTag, String search, Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end =  cpage * Configuration.recordCountPerPage;
		String pageNavi = aService.getPageNaviSearch(cpage, searchTag, search);      
		if(pageNavi.contains("redirect:search.do?page=")) {
			return pageNavi;
		}
		mod.addAttribute("pageNavi", pageNavi);
		List<MemberDTO> searchList = aService.searchForMemberPaging(searchTag, search, start, end);
		mod.addAttribute("memberList", searchList);
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

	//블랙관리
	@RequestMapping("blackList.do")
	public String blackList(Model mod,String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end =  cpage * Configuration.recordCountPerPage;
		String pageNavi = aService.getPageNaviBlack(cpage);         
		if(pageNavi.contains("redirect:blackList.do?page=")) {
			return pageNavi;
		}
		System.out.println(pageNavi);
		mod.addAttribute("pageNavi", pageNavi);
		List<MemberDTO> blackList = aService.selectBlackByPage(start, end);
		mod.addAttribute("blackList", blackList);
		return "admin/manageBlack";
	}
	@RequestMapping("searchForBlack.do")
	public String searchForBlack(String searchTag, String search, Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end =  cpage * Configuration.recordCountPerPage;
		String pageNavi = aService.getPageNaviSearchBlack(cpage, searchTag, search);  
		if(pageNavi.contains("redirect:searchForBlack.do?page=")) {
			return pageNavi;
		}
		mod.addAttribute("pageNavi", pageNavi);
		List<MemberDTO> searchList = aService.searchForBlackPaging(searchTag, search, start, end); 
		mod.addAttribute("blackList",searchList);
		return "admin/manageBlack";
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

	//피드관리
	@RequestMapping("totalFeedList.do")
	public String totalFeedList(Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end =  cpage * Configuration.recordCountPerPage;
		String pageNavi = aService.getPageNaviFeed(cpage);         
		if(pageNavi.contains("redirect:totalFeedList.do?page=")) {
			return pageNavi;
		}
		mod.addAttribute("pageNavi", pageNavi);
		List<FeedDTO> feedList = aService.selectFeedByPage(start, end);
		mod.addAttribute("feedList", feedList);
		return "admin/manageFeed";
	}
	@RequestMapping("searchForFeed.do")
	public String searchForFeed(String searchTag, String search, Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end =  cpage * Configuration.recordCountPerPage;
		String pageNavi = aService.getPageNaviSearchFeed(cpage, searchTag, search);    
		if(pageNavi.contains("redirect:searchForFeed.do?page=")) {
			return pageNavi;
		}
		System.out.println(pageNavi);
		mod.addAttribute("pageNavi", pageNavi);
		List<FeedDTO> feedList = aService.searchForFeedPaging(searchTag, search, start, end);
		for(FeedDTO tmp : feedList) {
			System.out.println(tmp.getTitle());
		}
		mod.addAttribute("feedList", feedList);
		return "admin/manageFeed";
	}
	@RequestMapping("deleteFeedProc.do")
	@ResponseBody
	public String deleteFeedProc(String feed) throws Exception {
		int feed_seq = Integer.parseInt(feed);
		System.out.println("controller " + feed_seq);
		int deleteR = aService.deleteFeed(feed_seq);
		if (deleteR > 0) {
			return feed_seq+"";
		} else {
			return "deleteFeed fail";
		}
	} 

}
