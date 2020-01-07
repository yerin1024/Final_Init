package kh.init.members;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.members.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int insert(MemberDTO dto) {
		return jdbc.insert("Member.insert", dto);
	}
	
	
	public int isLoginOk(String email, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("pw", pw);
		return jdbc.selectOne("Member.isLoginOk", param);
	}
	
	public MemberDTO getMyInfo(String email) throws Exception{
    	return jdbc.selectOne("Members.selectById",email);
    	
    }
	public int withdrawMem(String email) throws Exception {
    	Map<String,String> map = new HashMap<>();
        map.put("email", email);
        return jdbc.delete("Members.delete",map);
    }
    
    public int changeMyInfo(MemberDTO dto) throws Exception {
    	Map<String,String> param= new HashMap<>();
//		param.put("id", dto.getId());
//		param.put("pw", dto.getPw());
//		param.put("name", dto.getName());
//		param.put("phone", dto.getPhone());
		return jdbc.update("Members.update",param);
    }
	
}
