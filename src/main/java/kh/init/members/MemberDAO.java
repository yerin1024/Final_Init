package kh.init.members;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int isLoginOk(String email, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("pw", pw);
		return jdbc.selectOne("Member.isLoginOk", param);
	}
	
}
