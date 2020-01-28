package kh.init.admin;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.init.configuration.Utils;
import kh.init.feeds.FeedDTO;
import kh.init.members.MemberDTO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	@Autowired
	private HttpSession session;


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

		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
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
	//멤버 검색 기능
	@RequestMapping("search.do")
	public String searchProc(String searchTag, String search, Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
		String pageNavi = aService.getPageNaviSearch(cpage, searchTag, search);      
		if(pageNavi.contains("redirect:search.do?page=")) {
			return pageNavi;
		}
		mod.addAttribute("pageNavi", pageNavi);
		List<MemberDTO> searchList = aService.searchForMemberPaging(searchTag, search, start, end);
		mod.addAttribute("memberList", searchList);
		return "admin/manageMember";
	}
	//멤버를 블랙멤버로 
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
		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
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
	//블랙 검색 기능
	@RequestMapping("searchForBlack.do")
	public String searchForBlack(String searchTag, String search, Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
		String pageNavi = aService.getPageNaviSearchBlack(cpage, searchTag, search);  
		if(pageNavi.contains("redirect:searchForBlack.do?page=")) {
			return pageNavi;
		}
		mod.addAttribute("pageNavi", pageNavi);
		List<MemberDTO> searchList = aService.searchForBlackPaging(searchTag, search, start, end); 
		mod.addAttribute("blackList",searchList);
		return "admin/manageBlack";
	}
	//블랙멤버 탈퇴
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
	//블랙멤버를 멤버로
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
		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
		String pageNavi = aService.getPageNaviFeed(cpage);         
		if(pageNavi.contains("redirect:totalFeedList.do?page=")) {
			return pageNavi;
		}
		mod.addAttribute("pageNavi", pageNavi);
		List<FeedDTO> feedList = aService.selectFeedByPage(start, end);
		mod.addAttribute("feedList", feedList);
		return "admin/manageFeed";
	}
	//피드 검색 기능
	@RequestMapping("searchForFeed.do")
	public String searchForFeed(String searchTag, String search, Model mod, String page) throws Exception {
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
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
	//피드 삭제 기능
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
	
	//신고
	@RequestMapping(value = "/declareReasonProc.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String declareReasonProc(String dr_seq, String declare_reason, Timestamp decalre_date) throws Exception {
		System.out.println("declareResonProc 도착!");
		System.out.println("dr_seq : "  + dr_seq);
		int feed_seq = Integer.parseInt(dr_seq.substring(dr_seq.lastIndexOf("_") + 1));
		System.out.println("feed_seq : " +feed_seq);
		String from_id = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		System.out.println("from_id : " + from_id);
		System.out.println("declare_reason : " + declare_reason);
		String to_id = aService.getReportedEmail(feed_seq);
		System.out.println("to_id : " + to_id);
		DeclareDTO ddto = new DeclareDTO(feed_seq, to_id, declare_reason, from_id, null, null);
		try {
			aService.declare(ddto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "declare";
	}
	//신고관리
	@RequestMapping("/declarationList.do")
	public String declarationList(Model mod, String page) throws Exception {
		System.out.println("declaration으로 도착!");
		System.out.println("현재 넘어온 페이지 값  : " + page);
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}

		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
		String pageNavi = aService.getPageNaviDeclare(cpage);
		if(pageNavi.contains("redirect:declarationList.do?page=")) {
			return pageNavi;
		}
		System.out.println(pageNavi);
		mod.addAttribute("pageNavi", pageNavi);
		List<DeclareDTO> declarationList = aService.selectDeclareByPage(start, end);
		System.out.println("selectDeclareByPage다녀옴");
		for(DeclareDTO tmp : declarationList) {
			System.out.println(tmp.getFrom_id());
		}
		mod.addAttribute("declarationList", declarationList );
		return "admin/manageDeclaration";
	}
	@RequestMapping("searchForDeclare.do")
	public String searchForDeclare(String searchTag, String search, Model mod, String page) throws Exception {
		System.out.println("searchTag : " +searchTag);
		System.out.println("search : " +search);
		int cpage = 1;
		if(page != null) {
			cpage = Integer.parseInt(page); 
		}
		int start = cpage * Utils.recordCountPerPage - (Utils.recordCountPerPage-1);
		int end =  cpage * Utils.recordCountPerPage;
		String pageNavi = aService.getPageNaviSearchDeclare(cpage, searchTag, search);    
		if(pageNavi.contains("redirect:searchForDeclare.do?page=")) {
			return pageNavi;
		}
		System.out.println(pageNavi);
		mod.addAttribute("pageNavi", pageNavi);
		List<DeclareDTO> DeclarationList = aService.searchForDeclarePaging(searchTag, search, start, end);
		for(DeclareDTO tmp : DeclarationList) {
			System.out.println(tmp.toString());
		}
		mod.addAttribute("declarationList", DeclarationList);
		return "admin/manageDeclaration";
	}
	//신고게시물 삭제 및 블랙 경고
	@RequestMapping("deleteDeclareFeedProc.do")
	@ResponseBody
	public String deleteDeclareFeedProc(String feed) throws Exception {
		System.out.println("신고게시물 삭제 및 블랙 경고 controller");
		int feed_seq = Integer.parseInt(feed);
		System.out.println("controller " + feed_seq);
		int deleteR = aService.deleteDeclareFeed(feed_seq);
		System.out.println("deleteR : " + deleteR);
		if (deleteR > 0) {
			return feed_seq+"";
		} else {
			return "deleteFeed fail";
		}
	}
}
