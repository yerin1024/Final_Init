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
	public MemberDTO getMyPageService(String email) throws Exception{
		
		
		MemberDTO dto = dao.getMyInfo(email);
		System.out.println("왜값이 안나와"+dto.getEmail());
			return dto;
		
		
	}
	
	@Transactional("txManager")
	public int withdrawMemService(String email) throws Exception {
			
			    System.out.println("회원 탈퇴 입력된 값은 "+ email);
				int result = dao.withdrawMem(email);
				return result;
			   
		}
	
	@Transactional("txManager")
	public int changeMyInfoService(String id,MemberDTO dto) throws Exception {
			
			
				int result = dao.changeMyInfo(id,dto);
				return result;
			   
		}
}
