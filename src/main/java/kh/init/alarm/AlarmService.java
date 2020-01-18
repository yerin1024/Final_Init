package kh.init.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.init.feeds.ReplyDTO;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmDAO dao;
	
	@Transactional("txManager")
	public List<AlarmDTO> alarmList(String email){
		return dao.alarmList(email);
	}
	
	@Transactional("txManager")
	public List<AlarmVO> alarmList2(String email){
		return dao.alarmList2(email);
	}
	
	@Transactional("txManager")
	public String alarmWho(int feed_seq){
		return dao.alarmWho(feed_seq);
	}
	
	@Transactional("txManager")
	public int deleteAlarm(String email, int alarm_seq) {
		return dao.deleteAlarm(email, alarm_seq);
	}
	

}
