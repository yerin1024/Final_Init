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
	
	public int insertMsg(MessageDTO dto, String from_id, String to_id) { 
		Map<String, Object> prm = new HashMap<>();
		prm.put("from_id", from_id);
		prm.put("to_id", to_id);
//		prm.put("from_id", dto.getFrom_id());
//		prm.put("to_id", dto.getTo_id());
		prm.put("contents", dto.getContents());
		return jdbc.insert("Message.insertMsg", prm);
	}
	
	public List<MessageDTO> selectThirty(String from_id, String to_id){
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", from_id);
		prm.put("to_id", to_id);
//		prm.put("from_id", dto.getFrom_id());
//		prm.put("to_id", dto.getTo_id());
		return jdbc.selectList("Message.selectThirty", prm);
	}
	
	public List<MessageDTO> selectAll(MessageDTO dto){
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", dto.getFrom_id());
		prm.put("to_id", dto.getTo_id());
		return jdbc.selectList("Message.selectAll", prm);
	}
	
	public int readCheck(MessageDTO dto) {
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", dto.getFrom_id());
		prm.put("to_id", dto.getTo_id());
		return jdbc.update("Message.readCheck", prm);
	}
	
	public List<MessageDTO> previewMsg(MessageDTO dto){
		Map<String, String> prm = new HashMap<>();
		prm.put("from_id", dto.getFrom_id());
		prm.put("to_id", dto.getTo_id());
		return jdbc.selectList("Message.previewMsg", prm);
	}
	
	public int unreadCount(MessageDTO dto) {
		int result = jdbc.selectOne("Message.previewMsg");
		return result;
	}
	
	public List<FriendDTO> friendList(FriendDTO dto, String myId){
		Map<String, String> prm = new HashMap<>();
		prm.put("my_id", myId);
//		prm.put("my_id", dto.getMy_id());
//		prm.put("fr_id", dto.getFr_id());
		return jdbc.selectList("Message.friendList", prm);
	}
	
	public List<FriendDTO> searchUser(FriendDTO dto){
		Map<String, String> prm = new HashMap<>();
		prm.put("my_id", dto.getMy_id());
		prm.put("fr_id", dto.getFr_id());
		return jdbc.selectList("Message.searchUser", prm);
	}
	
	public List<MemberDTO> friendListConvert(MemberDTO dto){
		Map<String, String> prm = new HashMap<>();
		prm.put("email", dto.getEmail());
		return jdbc.selectList("Message.friendListConvert", prm);
	}
	
	
	
	
	
	
	
}
