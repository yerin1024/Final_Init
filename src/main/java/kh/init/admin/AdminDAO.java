package kh.init.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.members.MemberDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<MemberDTO> memberList() throws Exception{
		return sst.selectList("Admin.memberList");
	}
	public List<MemberDTO> blackList() throws Exception{
		return sst.selectList("Admin.blackList");
	}
	public int toBlack(String email) throws Exception{
		return sst.update("Admin.toBlack", email);
	}
	public int withdrawal(String email) throws Exception{
		return sst.delete("Admin.withdrawal",email);
	}
	public int toMember(String email) throws Exception{
		return sst.update("Admin.toMember", email);
	}
}
