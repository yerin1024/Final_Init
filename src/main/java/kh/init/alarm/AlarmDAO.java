package kh.init.alarm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.feeds.ReplyDTO;
import kh.init.friends.FriendRequestDTO;

@Repository
public class AlarmDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	// 댓글 작성자;좋아요 알림 / 피드seq 넣어서 게시물 작성자의 email 리턴 -> 나온 이메일을 alarmReply에 (공유seq, email)
	public String alarmWho(int feed_seq) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("feed_seq", feed_seq);
		return jdbc.selectOne("Alarm.alarmReplyWho",prm);
	}
	
	// 댓글 알림 추가			dual 리턴값 받아서 넣기 // email에 alarmWho 리턴값 넣기
	public int alarmReply(int sharedSeq, String email) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("shardSeq",sharedSeq);
		prm.put("email",email);
		return jdbc.insert("Alarm.alarmReply",prm);
	}
	
	// 좋아요 알림 추가
	public int alarmLike(int sharedSeq, String email) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("shardSeq",sharedSeq);
		prm.put("email",email);
		return jdbc.insert("Alarm.alarmLike",prm);
	}
	
	// 친구 요청 알림 추가
	public int alarmFriend(int sharedSeq, FriendRequestDTO fdto) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("shardSeq",sharedSeq);
//		prm.put("email", email);	// tb_friend_request의 to_id
		prm.put("email", fdto.getTo_id());
		return jdbc.insert("Alarm.alarmFriend",prm);
	}
	
	// 알림 목록
	public List<AlarmDTO> alarmList(String email){
		Map<String, Object> prm = new HashMap<>();
		prm.put("email",email);
		return jdbc.selectList("Alarm.alarmList",prm);
	}
	
	// 알림 목록 2
	public List<AlarmVO> alarmList2(String email){
		Map<String, Object> prm = new HashMap<>();
		prm.put("email",email);
		return jdbc.selectList("Alarm.alarmList2",prm);
	}
	
	// 새 알림이 있는지
	public int isNewAlarm(String email) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("email",email);
		return jdbc.selectOne("Alarm.isNewAlarm", prm);
	}
	
	// 읽음 완료로 표시 변경
	public int alarmCheck(String email) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("email",email);
		return jdbc.update("Alarm.alarmCheck", prm);
	}
	
	// 알림 삭제
	public int deleteAlarm(String email, int alarm_seq) {
		Map<String, Object> prm = new HashMap<>();
		prm.put("email",email);
		prm.put("alarm_seq",alarm_seq);
		return jdbc.update("Alarm.deleteAlarm", prm);
	}
	
	

}
