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
	
	
}
