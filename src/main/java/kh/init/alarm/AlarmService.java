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
	public ReplyDTO alarmReplyWho(int reply_seq){
		return dao.alarmReplyWho(reply_seq);
	}

}
