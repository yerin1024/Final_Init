package kh.init.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.init.members.MemberDTO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	
	@RequestMapping("adminHome.do")
	public String adminHome() throws Exception{
		return "admin/adminHome";
	}
	@RequestMapping("blackList.do")
	public String blackList(Model mod) throws Exception{
		List<MemberDTO> blackList = aService.blackList();
		mod.addAttribute("blackList", blackList);
		return "admin/manageBlack";
	}
	@RequestMapping("memberList.do")
	public String memberList(Model mod) throws Exception{
		List<MemberDTO> memberList = aService.memberList();
		mod.addAttribute("memberList", memberList);
		return "admin/manageMember";
	}
	@RequestMapping("blackProc.do")
	@ResponseBody
	public String blackProc(MemberDTO mdto) throws Exception{
		int toBlack = aService.toBlack(mdto.getEmail());
		if(toBlack>0) {
			return "black success";
		}else {
			return "black fail";
		}
	}
	@RequestMapping("withdrawalProc.do")
	@ResponseBody
	public String withdrawalProc(MemberDTO mdto) throws Exception{
		int withdrawal = aService.withdrawal(mdto.getEmail());
		if(withdrawal>0) {
			return "withdrawal success";
		}else {
			return "withdrawal fail";
		}
	}
	@RequestMapping("toMemberProc.do")
	@ResponseBody
	public String toMember(MemberDTO mdto) throws Exception{
		int toMember = aService.toMember(mdto.getEmail());
		if(toMember>0) {
			return "toMember success";
		}else {
			return "toMember fail";
		}
	}
}
