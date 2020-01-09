package kh.init.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.init.friends.FriendDTO;
import kh.init.messages.MessageDTO;

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
	public String testAl() {
		System.out.println("테스트 시작");
		
		JsonObject obj = new JsonObject();
		obj.addProperty("contents", "테스트용 화면 띄우기");
		return obj.toString();
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
