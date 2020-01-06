package kh.init.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.init.members.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adao;
	
	public List<MemberDTO> memberList() throws Exception{
		return adao.memberList();
	}
	public List<MemberDTO> blackList() throws Exception{
		return adao.blackList();
	}
	public int toBlack(String email) throws Exception{
		return adao.toBlack(email);
	}
	public int withdrawal(String email) throws Exception{
		return adao.withdrawal(email);
	}
	public int toMember(String email) throws Exception{
		return adao.toMember(email);
	}
}
