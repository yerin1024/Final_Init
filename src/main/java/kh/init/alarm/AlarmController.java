package kh.init.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@RequestMapping("/alarm")
@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService service;
	
	@RequestMapping("alarmMain")
	public String toAlarm() {
		System.out.println("alarm main 도착");
		return "messages/alarm";
	}
	
	@RequestMapping(value="/test.al", produces="text/html; charset=utf8")
	@ResponseBody
	public String testAl(String email) {
		System.out.println("테스트 시작");
		List<AlarmVO> result = service.alarmList2("123@123.123");
		// 나중엔 이메일 부분 session id로 받을 것
		
//		for(AlarmVO tmp : result) {
//			System.out.println(tmp.getType() + " : " + tmp.getReg_date() + " : "
//				+ tmp.getEmail() + " : " + tmp.getNickname_r() + " : " + tmp.getContents() + " : "
//				+ tmp.getFrom_id() + " : " + tmp.getEmail_lk());
//		}
		
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	@RequestMapping(value="/delete.al", produces="text/html; charset=utf8")
	@ResponseBody
	public String deleteAlarm(String email, int alarm_seq) {
		System.out.println("삭제 테스트 시작");
		System.out.println("알림 시퀀스 : " + alarm_seq);
		service.deleteAlarm("123@123.123", alarm_seq);
		List<AlarmVO> result = service.alarmList2("123@123.123");
		// 나중엔 이메일 부분 session id로 받을 것
		
//		for(AlarmVO tmp : result) {
//			System.out.println(tmp.getType() + " : " + tmp.getReg_date() + " : "
//				+ tmp.getEmail() + " : " + tmp.getNickname_r() + " : " + tmp.getContents() + " : "
//				+ tmp.getFrom_id() + " : " + tmp.getEmail_lk());
//		}
		
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	
	
//	@RequestMapping(value="/sendFly.msg", produces="text/html; charset=utf8")
//	@ResponseBody
//	public String sendMsg(MessageDTO dto, String to_id) {
//		int result = service.insertMsg(dto, "123@123.123", "098@123.123");
//		System.out.println("전송할 메시지 : ");
//		
//		JsonObject obj = new JsonObject();
//		obj.addProperty("contents", dto.getContents());
//		return obj.toString();
//	}

}
