package kh.init.friends;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.init.members.MemberDTO;



@RequestMapping("/friend")
@Controller
public class FriendController {


	@Autowired
	private FriendService service;

	@Autowired
	private HttpSession session;

	@RequestMapping("/friendRequest")
	public String friendRequest(FriendDTO dto,Model model) {
		try { 
		int result = service.friendRequestService(dto);
		 if(result > 0) {
			 return "feeds/myFeed";
		 }else {
			 return "feeds/myFeed";
		 }
		
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	@RequestMapping("/acceptFndRequest")
	@ResponseBody
	public String acceptFndRequest(String yr_id,String my_relation) {
		System.out.println("친구 수락 CON 도착"); 
		System.out.println(yr_id);
		try {
		    String my_id =(String)session.getAttribute("id");
			int result = service.acceptFriendRequest("kks@naver.com", yr_id,"1");
			return "ok";
		 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}
	@RequestMapping("/cutFndRelation")
	@ResponseBody
	public String cutFndRelation(String yr_id) {
		System.out.println("친구끊기 CON 도착.");
		String my_id =(String)session.getAttribute("id");
		try {
		int result = service.cutFriendship("kks@naver.com", yr_id);
		return "ok";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	@RequestMapping(value ="/selectFndList" ,produces ="application/text; charset=utf-8")
	@ResponseBody
	public String selectFndList(Model model) {
		System.out.println("친구목록 조회 CON 도착.");
		try {
			List<MemberDTO> list = service.getFriendsListService("kks@naver.com");
			List<MemberDTO> waitlist = service.getRequestMemList("kks@naver.com");
			System.out.println("waitlist size ="+waitlist.size());
			
			System.out.println(list.size());
			
			Gson g = new Gson();
			
			g.toJson(waitlist);
			JsonObject obj = new JsonObject();
		    if(waitlist.size() != 0) {
            obj.addProperty("waitlist", g.toJson(waitlist));
		    }
		    if(list.size() != 0) {
            obj.addProperty("list", g.toJson(list));
		    }
            System.out.println(obj.toString());
			return obj.toString();
			}catch(Exception e) {
				e.printStackTrace();
				return "error";
			}
		
	}
}

