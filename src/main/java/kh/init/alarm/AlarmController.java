package kh.init.alarm;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.init.members.MemberDTO;

@RequestMapping("/alarm")
@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService service;
	@Autowired
	private HttpSession session;
	
	// 알림 메인
	@RequestMapping("alarmMain")
	public String toAlarm() {
		System.out.println("alarm main 도착");
		return "messages/alarm";
	}
	
	// 알림 리스트 띄우기
	@RequestMapping(value="/alarmList.al", produces="text/html; charset=utf8")
	@ResponseBody
	public String alarmList() {
		System.out.println("알림 리스트 열기 성공");
		MemberDTO sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
//		List<AlarmVO> result = service.alarmList(sessionDTO.getEmail());
		List<AlarmVO> result = service.alarmList("123@123.123");
		// 나중엔 이메일 부분 session id로 받을 것
		
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	// 알림 삭제
	@RequestMapping(value="/delete.al", produces="text/html; charset=utf8")
	@ResponseBody
	public String deleteAlarm(String email, int alarm_seq) {
		System.out.println("알림 삭제 성공");
		MemberDTO sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
//		service.deleteAlarm(sessionDTO.getEmail(), alarm_seq);
//		List<AlarmVO> result = service.alarmList(sessionDTO.getEmail());
		service.deleteAlarm("123@123.123", alarm_seq);
		List<AlarmVO> result = service.alarmList("123@123.123");
		// 나중엔 이메일 부분 session id로 받을 것
		
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	// 알림 확인
	@RequestMapping(value="/alarmCheck.al", produces="text/html; charset=utf8")
	@ResponseBody
	public String alarmCheck() {
		System.out.println("알림 check 확인");
		MemberDTO sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
//		service.alarmCheck(sessionDTO.getEmail());
		service.alarmCheck("123@123.123");
		// 나중엔 이메일 부분 session id로 받을 것
		
		return null;
	}
	
	// new 알림 있는지
	@RequestMapping(value="/isNewAlarm.al", produces="text/html; charset=utf8")
	@ResponseBody
	public String checkNewAlarm(String email) {
		MemberDTO sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
//		String result = Integer.toString(service.isNewAlarm(sessionDTO.getEmail()));
		String result = Integer.toString(service.isNewAlarm("123@123.123"));
		// 나중엔 이메일 부분 session id로 받을 것
		return result;
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
