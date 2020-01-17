package kh.init.messages;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.friends.FriendDTO;
import kh.init.members.MemberDTO;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int insertMsgSeq() {
		int result = jdbc.selectOne("Message.insertMsgSeq");
		return result;
	}
	
	// 메시지 입력
	public int insertMsg(MessageDTO dto, String from_id, String to_id) { 
		Map<String, Object> prm = new HashMap<>();
		prm.put("from_id", from_id);
		prm.put("to_id", to_id);
		prm.put("contents", dto.getContents());
		return jdbc.insert("Message.insertMsg", prm);
	}
	
	// 메시지 30개 출력
	public List<MessageDTO> selectThirty(String from_id, String to_id){
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", from_id);
		prm.put("to_id", to_id);
		return jdbc.selectList("Message.selectThirty", prm);
	}
	
	// 전체 메시지
	public List<MessageDTO> selectAll(String from_id, String to_id){
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", from_id);
		prm.put("to_id", to_id);
		return jdbc.selectList("Message.selectAll", prm);
	}
	
	// 읽음 변경				// to_id: 상대	from_id: 나
	public int readCheck(String to_id, String from_id) {
		Map<String, String> prm = new HashMap<>();
		prm.put("to_id", to_id);
		prm.put("from_id", from_id);
		return jdbc.update("Message.readCheck", prm);
	}
	
	// 메시지 미리 보기 목록					from_id: 나,		to_id: 상대
	public MessageDTO previewMsg(String from_id, String to_id){
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", from_id);
		prm.put("to_id", to_id);
		return jdbc.selectOne("Message.previewMsg", prm);
	}
	
	// 읽지 않은 메시지 수
	public int unreadCount(String to_id, String from_id) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("to_id", to_id);
		prm.put("from_id", from_id);
		int result = jdbc.selectOne("Message.unreadCount", prm);
		return result;
	}
	
	// new 메시지 존재 여부
	public int isNewMsg(String from_id) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("from_id", from_id);
		int result = jdbc.selectOne("Message.isNewMsg", prm);
		return result;
	}
	
	// 친구 목록
	public List<MessageDTO> friendList(String my_id){ 
		Map<String, String> prm = new HashMap<>();
		prm.put("my_id", my_id);
		return jdbc.selectList("Message.friendList", prm);
	}
	
	// 친구 검색
	public List<FriendDTO> searchUser(FriendDTO dto){
		Map<String, String> prm = new HashMap<>();
		prm.put("my_id", dto.getMy_id());
		prm.put("fr_id", dto.getFr_id());
		return jdbc.selectList("Message.searchUser", prm);
	}
	
	// 닉네임 변환
//	public List<MemberDTO> friendListConvert(MemberDTO dto){
//		Map<String, String> prm = new HashMap<>();
//		prm.put("email", dto.getEmail());
//		return jdbc.selectList("Message.friendListConvert", prm);
//	}
	
	
	
	
	
	
	
}
