package kh.init.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.configuration.Configuration;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int insert(MemberDTO dto) {
		return jdbc.insert("Member.insert", dto);
	}
	
	public int checkEmail(String email) {
		Map<String, String> param = new HashMap<>();
		param.put("col", "email");
		param.put("val", email);
		return jdbc.selectOne("Member.checkOverlap", param);
	}
	
	public int checkNickname(String nickname) {
		Map<String, String> param = new HashMap<>();
		param.put("col", "nickname");
		param.put("val", nickname);
		return jdbc.selectOne("Member.checkOverlap", param);
	}
	
	public int checkPhone(String phone) {
		Map<String, String> param = new HashMap<>();
		param.put("col", "phone");
		param.put("val", phone);
		return jdbc.selectOne("Member.checkOverlap", param);
	}
	
	public String getProfile(String email) {
		return jdbc.selectOne("Member.getProfile", email);
	}
	
	public int resetPw(String email, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("pw", pw);		
		return jdbc.update("Member.resetPw", param);
	}
	
	public int isLoginOk(String email, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("pw", pw);
		return jdbc.selectOne("Member.isLoginAvailable", param);
	}
	//내 정보 가져오기
	public MemberDTO getMyInfo(String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("val", email);
		param.put("col", "email");
    	return jdbc.selectOne("Member.selectMember",param);
    }
	//회원 탈퇴
	public int withdrawMem(String email) throws Exception {
    	System.out.println("dao 회원탈퇴 인자값은 "+email);
		
        return jdbc.delete("Member.delete",email);
    }
    //회원 정보 수정
    public int changeMyInfo(String email,MemberDTO dto) throws Exception {
    	Map<String,String> param= new HashMap<>();
		param.put("id", email);
		param.put("name", dto.getName());
		param.put("phone", dto.getPhone());
		param.put("birth", dto.getBirth());
		System.out.println("################## : " + dto.getProfile_img());
		param.put("profile_img", dto.getProfile_img());
		param.put("nickname", dto.getNickname());
		param.put("profile_msg", dto.getProfile_msg());
		return jdbc.update("Member.update",param);
    }
    
    //비밀번호 수정
    public int changePw(String email, String pw) throws Exception{
    	Map<String, String> param = new HashMap<>();
    	param.put("email", email);
    	param.put("pw", pw);
    	return jdbc.update("Member.changePw", param);
    }
    
    //친구 목록에서 친구 정보 가져오기
	public MemberDTO getMyInfoByFriend(String fr_id) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("val", fr_id);
		param.put("col", "email");
    	return jdbc.selectOne("Member.selectMember",param);
	}
	public int insertBlock(BlockDTO dto) {
		return jdbc.insert("Member.insertBlock", dto);
	}
	public int deleteBlock(BlockDTO dto) throws Exception {
    	System.out.println("dao 회원탈퇴 인자값은 "+dto);
		
        return jdbc.delete("Member.deleteBlock",dto);
    }
	public List<BlockDTO> getMyBlock(BlockDTO dto) throws Exception{
		
    	return jdbc.selectList("Member.selectBlock",dto);
    }
}
