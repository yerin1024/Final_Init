package kh.init.messages;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.init.friends.FriendDTO;

@RequestMapping("message")
@Controller
public class MessageController {
 
	@Autowired
	private MessageService service;
	
	// 메시지 메인
	@RequestMapping("messageMain")
	public String toMsgList(FriendDTO fdto, String id, Model model) {
		return "messages/messageMain";
	}
	
	// 친구 목록
	@RequestMapping(value="friendList.msg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String toFriendList(FriendDTO fdto, String id, Model model) {
		List<FriendDTO> result = service.friendList(fdto, "123@123.123"); // 123@부분 session id로 바꿔야 함
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	// 메시지 미리 보기 목록
	@RequestMapping(value="previewList.msg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String toPreviewList(FriendDTO fdto, MessageDTO dto, String to_id, Model model) {
		List<FriendDTO> resultF = service.friendList(fdto, "123@123.123"); // 123@부분 session id로 바꿔야 함
		List<MessageDTO> result = new ArrayList<>();
		
		for(FriendDTO tmp : resultF) {
			MessageDTO result2 = service.previewMsg("123@123.123", tmp.getFr_id()); // 123@부분 session id로 바꿔야 함
			result.add(result2);
		}
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	// 대화 내용 보기
	@RequestMapping(value="messageView.msg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String toView(MessageDTO dto, String fr_id, String to_id, Model model) {
		List<MessageDTO> result = service.selectAll("123@123.123", to_id); // 123@부분 session id로 바꿔야 함
		Gson gs = new Gson();
		return gs.toJson(result);
	}
	
	// 메시지 보내기
	@RequestMapping(value="sendFly.msg", produces="text/html; charset=utf8")
	@ResponseBody
	public String sendMsg(MessageDTO dto, String to_id) {
		int result = service.insertMsg(dto, "123@123.123", to_id); // 123@부분 session id로 바꿔야 함
		JsonObject obj = new JsonObject();
		obj.addProperty("contents", dto.getContents());
		return obj.toString();
	}
	
	// new 알림 있는지
	@RequestMapping(value="/isNewMsg.msg", produces="text/html; charset=utf8")
	@ResponseBody
	public String checkNewMsg(String from_id) {
		String result = Integer.toString(service.isNewMsg("123@123.123"));
//		System.out.println("메시지 알림 개수 : " + result);
		// 나중엔 이메일 부분 session id로 받을 것
		return result;
	}
	
//	@RequestMapping(value="messageView.msg", produces="text/html; charset=UTF-8", method = RequestMethod.GET)
//	@ResponseBody
//	public Object toView(MessageDTO dto, String fr_id, String to_id, Model model) {
//		System.out.println("message 상세 보기 도착");
//		List<MessageDTO> result = service.selectThirty("123@123.123", fr_id);
//		for(MessageDTO tmp : result) {
//			System.out.println(tmp.getContents() + " : " + tmp.getWrite_date());
//		}
//		
//		Map<String, Object> ret= new HashMap<String, Object>();
//		ret.put("resp", result);
//		
//		return ret;
//	}
}
