package kh.init.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.init.members.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public int isLoginOk(String email, String pw) {
		return dao.isLoginOk(email, pw);
	}
	
	@Transactional("txManager")
	public MemberDTO getMyPageService(String id) throws Exception{
		
		
		MemberDTO dto = dao.getMyInfo(id);
			return dto;
		
		
	}
	
	@Transactional("txManager")
	public int withdrawMemService(String id) throws Exception {
			
			
				int result = dao.withdrawMem(id);
				return result;
			   
		}
	
	@Transactional("txManager")
	public int changeMyInfoService(String id,MemberDTO dto) throws Exception {
			
			
				int result = dao.changeMyInfo(dto);
				return result;
			   
		}
}
