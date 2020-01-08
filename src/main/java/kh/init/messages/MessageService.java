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
	
//	@Transactional("txManager")
//	public List<?> writeList(FriendDTO fdto, MemberDTO mdto) {
//		List<FriendDTO> list = dao.friendList(fdto);
//		
//		return "";
//	}
	
	
	@Transactional("txManager")
	public List<FriendDTO> friendList(FriendDTO fdto, String myId){
		return dao.friendList(fdto, myId);
	}
	
	@Transactional("txManager")
	public List<MessageDTO> selectThirty(String myId, String yourId){
		return dao.selectThirty(myId, yourId);
	}
	
	@Transactional("txManager")
	public int insertMsg(MessageDTO dto, String from_id, String to_id) {
		return dao.insertMsg(dto, from_id, to_id);
	}
	
	
}
