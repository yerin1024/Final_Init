package kh.init.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int insert(MemberDTO dto) {
		return jdbc.insert("Member.insert", dto);
	}
	
	public int checkEmail(String email) {
		return jdbc.selectOne("Member.checkEmail", email);
	}
	
	public int checkNickname(String nickname) {
		return jdbc.selectOne("Member.checkNickname", nickname);
	}
	
	public int checkPhone(String phone) {
		return jdbc.selectOne("Member.checkPhone", phone);
	}
	
	public String getProfile(String email) {
		return jdbc.selectOne("Member.getProfile", email);
	}
	
	public int isLoginOk(String email, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("pw", pw);
		return jdbc.selectOne("Member.isLoginOk", param);
	}
	
	public MemberDTO getMyInfo(String email) throws Exception{
    	return jdbc.selectOne("Member.selectById",email);
    	
    }
	public int withdrawMem(String email) throws Exception {
    	System.out.println("dao 회원탈퇴 인자값은 "+email);
		
        return jdbc.delete("Member.delete",email);
    }
    
    public int changeMyInfo(String email,MemberDTO dto) throws Exception {
    	Map<String,String> param= new HashMap<>();
		param.put("id", email);
		param.put("pw", dto.getPw());
		param.put("name", dto.getName());
		param.put("phone", dto.getPhone());
		param.put("birth", dto.getBirth());
		param.put("profile_img", dto.getProfile_img());
		param.put("nickname", dto.getNickname());
		param.put("profile_msg", dto.getProfile_msg());

		return jdbc.update("Member.update",param);
    }
	public MemberDTO getMyInfoByFriend(String fr_id) throws Exception{
		return jdbc.selectOne("Member.selectByFriend",fr_id);
	}
}
