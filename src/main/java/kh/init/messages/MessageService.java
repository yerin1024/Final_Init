package kh.init.messages;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.init.friends.FriendDTO;
import kh.init.members.MemberDTO;

@Service
public class MessageService {
	
	@Autowired
	private MessageDAO dao;
	
	// 친구 목록
	@Transactional("txManager")
	public List<MessageDTO> friendList(String my_id){
		return dao.friendList(my_id);
	}
	
	// 메시지 30개 출력
	@Transactional("txManager")
	public List<MessageDTO> selectThirty(String myId, String yourId){
		dao.readCheck(yourId, myId);
		return dao.selectThirty(myId, yourId);
	}
	
	// 메시지 전체 출력
	@Transactional("txManager")
	public List<MessageDTO> selectAll(String myId, String yourId){
		dao.readCheck(yourId, myId);
		return dao.selectAll(myId, yourId);
	}
	
	// 메시지 전송
	@Transactional("txManager")
	public int insertMsg(MessageDTO dto, String from_id, String to_id) {
		return dao.insertMsg(dto, from_id, to_id);
	}
	
	// 미리 보기 목록
	@Transactional("txManager")
	public MessageDTO previewMsg(String from_id, String to_id) {
		return dao.previewMsg(from_id, to_id);
	}
	
	// 읽지 않은 메시지 수
	@Transactional("txManager")
	public int unreadCount(String to_id, String from_id) {
		return dao.unreadCount(to_id, from_id);
	}
	
	// 메시지 new 여부
	@Transactional("txManager")
	public int isNewMsg(String from_id) {
		return dao.isNewMsg(from_id);
	}
	
	// 읽음 변경
	@Transactional("txManager")
	public int readCheck(String to_id, String from_id) {
		return dao.readCheck(to_id, from_id);
	}
	
	
}
