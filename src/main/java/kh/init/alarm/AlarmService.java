package kh.init.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.init.feeds.ReplyDTO;
import kh.init.friends.FriendRequestDTO;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmDAO dao;
	
//	@Transactional("txManager")
//	public List<AlarmDTO> alarmList(String email){
//		return dao.alarmList(email);
//	}
	
	// 피드 작성자 찾기 + 좋아요 추가 / 참고용
	@Transactional("txManager")
	public int alarmLikeWho(int feed_seq, int sharedSeq) {
		String receiverEmail = dao.alarmReceiver(feed_seq);
		return dao.alarmLike(sharedSeq, receiverEmail);
	}
	
	// 피드 작성자 찾기 + 댓글 알림 추가 / 참고용
	@Transactional("txManager")
	public int alarmReplyWho(int feed_seq, int reply_seq) {
		String receiverEmail = dao.alarmReceiver(feed_seq);
		return dao.alarmReply(reply_seq, receiverEmail);
	}
	
	@Transactional("txManager")
	public List<AlarmVO> alarmList(String email){
		return dao.alarmList(email);
	}
	
	@Transactional("txManager")
	public String alarmWho(int feed_seq){
		return dao.alarmWho(feed_seq);
	}
	
	@Transactional("txManager")
	public int deleteAlarm(String email, int alarm_seq) {
		return dao.deleteAlarm(email, alarm_seq);
	}
	
	@Transactional("txManager")
	public int alarmCheck(String email) {
		return dao.alarmCheck(email);
	}
	
	@Transactional("txManager")
	public int isNewAlarm(String email) {
		return dao.isNewAlarm(email);
	}
	
	@Transactional("txManager")
	public int alarmFriend(int sharedSeq, FriendRequestDTO dto) {
		return dao.alarmFriend(sharedSeq, dto);
	}
	
	

}
