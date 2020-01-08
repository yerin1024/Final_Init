package kh.init.messages;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.init.friends.FriendDTO;

@RequestMapping("message")
@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	@RequestMapping("messageMain")
	public String toMsgList(FriendDTO fdto, String id, Model model) {
		System.out.println("message home 도착");
		List<FriendDTO> resultF = service.friendList(fdto, "123@123.123");
		
		model.addAttribute("list", resultF);
		return "messages/messageMain";
	}
	
	@RequestMapping("messageView.msg")
	public String toView(MessageDTO dto, String fr_id, String to_id, Model model) {
		System.out.println("message 상세 보기 도착");
		List<MessageDTO> result = service.selectThirty("123@123.123", fr_id);
		for(MessageDTO tmp : result) {
			System.out.println(tmp.getContents() + " : " + tmp.getWrite_date());
		}
		model.addAttribute("list", result);
		return "messages/messageView";
	}
	
	
//	int root = Integer.parseInt(request.getParameter("root"));
//	String writer = ((MemberDTO)request.getSession().getAttribute("loginInfo")).getId();
//	String comments = request.getParameter("comments");
//	int seq = dao.getSeq();
//	
//	CommentsDTO dto = new CommentsDTO(seq, root, writer, comments, null, null);
//	dao.write(dto);
////	댓글 currentCoPage
//	int currentCoPage=1;
//	System.out.println("currentCoPage : "+request.getParameter("currentCoPage"));
//	String currentPageRecv = request.getParameter("currentCoPage");
//	if(currentPageRecv!=null) {
//		currentCoPage=Integer.parseInt(currentPageRecv);
//	}

//	int startNum = currentCoPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
//	int endNum = currentCoPage*Configuration.recordCountPerPage;
//	
//	List<CommentsDTO> pageList = CommentsDAO.getInstance().selectCommentByPage(root, startNum, endNum);
//	Gson g = new Gson();
//	String coNavi = CommentsDAO.getInstance().getPageNavi(currentCoPage, root);
//
//	JsonObject json = new JsonObject();
//	json.addProperty("list", g.toJson(pageList));
//	json.addProperty("coNavi", coNavi);
//	json.addProperty("currentCoPage", 1);
//
//	PrintWriter pw = response.getWriter();
//	pw.append(json.toString());
//	
	
	@RequestMapping(value="/sendFly.msg", produces="text/html; charset=utf8")
	@ResponseBody
	public String sendMsg(MessageDTO dto, String to_id) {
		int result = service.insertMsg(dto, "123@123.123", "098@123.123");
		System.out.println("전송할 메시지 : ");
		
		JsonObject obj = new JsonObject();
		obj.addProperty("contents", dto.getContents());
		return obj.toString();
	}
	
//	@RequestMapping(value="/ajaxImage.do", produces="text/html; charset=utf8")
//	@ResponseBody
//	public String ajaxImage(MultipartFile img) {
//		// 받을 때 ajax에서 보낸 key로 받아야 함
//		session.setAttribute("fileList", fileList);
//		String oriname = img.getOriginalFilename();
//		((List<String>)session.getAttribute("fileList")).add(oriname);
//		String sysname = System.currentTimeMillis() + "_" + oriname;
//		String path = session.getServletContext().getRealPath("files");
//		File filePath = new File(path);
//		if(!filePath.exists()) {
//			filePath.mkdir();
//		}
//
//		try {
//			img.transferTo(new File(path+"/"+sysname));
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "fail";
//		}
//		return "/files/"+sysname;
//	}
	
//	@RequestMapping("startMsg.msg")
//	public String startMsg(FriendDTO fdto, String id) {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("message home 도착");
//		List<FriendDTO> resultF = service.friendList(fdto, "123@123.123");
//		
//		for(FriendDTO str : resultF) {
//			System.out.println(str.getFr_id());
//		}
//		mav.addObject("list", resultF);
//		return "messages/messageMain";
//	}
	

	
	
}
