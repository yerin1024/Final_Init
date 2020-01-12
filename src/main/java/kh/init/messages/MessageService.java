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
	public List<FriendDTO> friendList(FriendDTO fdto, String myId){
		return dao.friendList(fdto, myId);
	}
	
	// 메시지 30개 출력
	@Transactional("txManager")
	public List<MessageDTO> selectThirty(String myId, String yourId){
		return dao.selectThirty(myId, yourId);
	}
	
	// 메시지 전체 출력
	@Transactional("txManager")
	public List<MessageDTO> selectAll(String myId, String yourId){
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
	
	
}
