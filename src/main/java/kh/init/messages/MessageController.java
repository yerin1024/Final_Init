package kh.init.messages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/message")
@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	@RequestMapping("messageList")
	public String toMsgList() {
		System.out.println("message home 도착");
		return "messageList";
	}
	
//	@RequestMapping("sendFly.msg")
//	public String sendMsg() {
//		
//	}
	
	
}
