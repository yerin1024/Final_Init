package kh.init.feeds;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.init.members.MemberDTO;
import kh.init.members.MemberService;

@RequestMapping("/feed")
@Controller
public class FeedController {

	@Autowired
	private FeedService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private HttpSession session;

	@RequestMapping("/myFeed")

	public String myFeed(Model model) {
		System.out.println("wholeFeed 도착");
		List<FeedDTO> list = null;
		try {
			MemberDTO dto = mservice.getMyPageService("kks@naver.com");
			list = service.selectAll();
			model.addAttribute("dto", dto);
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}

		return "feeds/myFeed";
	}

	@RequestMapping("/deleteProc")
	public String deleteProc(int feed_seq) {
		System.out.println("삭제 도착!");
		System.out.println(feed_seq + " ㅁㄴㅇㅁㄴ");
		try {
			int result =  service.deleteFeed(feed_seq);
			int replyResult = service.deleteReply(feed_seq);
			System.out.println(result + "행이 삭제되었습니다.");
			System.out.println(replyResult + "행이 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:myFeed";
	}

	@RequestMapping("/writeFeed")
	public String writeFeed() {
		return "feeds/writeFeed";
	}


	@RequestMapping("/writeFeedProc")
	public String writeFeedProc(FeedDTO dto) {
		System.out.println("게시물 등록 도착!");		
		//임시 이메일과 닉네임 ->이후에 세션으로 변경해야함
		String email = "yes";
		String nickname = "yes";
		dto.setEmail(email);
		dto.setNickname(nickname);
		int result = 0;		
		List<String> mediaList = ((ArrayList<String>)session.getAttribute("mediaList"));		
		try {
			result = service.registerFeed(dto, mediaList);
			System.out.println(result + "행의 게시물이 등록");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:myFeed";
	}


	@RequestMapping(value="/mediaTmpUpload", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String mediaTmpUpload(MultipartFile file) {
		System.out.println("mediaTmpUpload 도착");
		String path = session.getServletContext().getRealPath("mediaTmp");

		String fileType = file.getContentType();
		fileType = fileType.split("/")[0];
		System.out.println("fileType : "+fileType);

		String filePath = service.mediaTmpUpload(file, path);
		((ArrayList<String>)session.getAttribute("mediaList")).add(filePath);

		System.out.println("{\"result\" : \""+filePath+"\", \"type\" : \""+fileType+"\"}");
		return "{\"result\" : \""+filePath+"\", \"type\" : \""+fileType+"\"}";
	}



	@RequestMapping("/wholeFeed")
	public String wholeFeed(Model model) {
		System.out.println("wholeFeed 도착");
		List<FeedDTO> list = null;
		try {
			list = service.selectAll();
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/feeds/wholeFeed";
	}

	@RequestMapping("/detailView")
	public String detailView(int feed_seq, Model model) {
		System.out.println("detailView 도착");
		FeedDTO dto = null;
		List<ReplyDTO> replyList = null;
		List<String> list = null;
		try {
			dto = service.detailView(feed_seq);
			replyList = service.viewAllReply(feed_seq);
			list = service.getMediaList(feed_seq);
			model.addAttribute("replylist",replyList);
			model.addAttribute("media", list);
			model.addAttribute("dto", dto);	
		}catch(Exception e) {
			e.printStackTrace();
		}			
		return "/feeds/detailView";
	}

	@RequestMapping("/modifyFeedProc")
	public String modifyFeedProc(FeedDTO dto,Model model) {
		System.out.println("게시물 수정 시작!");
		System.out.println(dto.getFeed_seq());
		try {
			int result = service.modifyFeed(dto);
			System.out.println(result + "행이 수정되었습니다!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/feeds/modifyFeedView";
	}
	@RequestMapping("/modifyFeedView")
	public String modifyFeedView(int feed_seq,FeedDTO dto,Model model) {
		System.out.println("게시물 수정페이지 도착!");
		System.out.println(dto.getFeed_seq());
		try {
			dto = service.detailView(feed_seq);
			model.addAttribute("dto",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/feeds/modifyFeedView";
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//                                             댓글기능
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	@RequestMapping("/registerReply")
	@ResponseBody
	public String registerReply(ReplyDTO dto) {
		System.out.println("댓글 등록도착!");
		System.out.println("피드시퀀스:"+dto.getFeed_seq());
		System.out.println("댓글 내용입니다 :"+dto.getContents());
		String result = null;
		//나중에 세션값으로 대체
		dto.setNickname("abd");
		System.out.println(dto.getFeed_seq()+ " : "+dto.getContents()+" : "+dto.getNickname());
		try {
			result = service.registerReply(dto);
			System.out.println(dto.getFeed_seq()+"??????????");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("/modifyReply")
	public String modifyReply(FeedDTO dto) {
		return "feeds/myFeed";
	}

	@RequestMapping("/deleteReply")
	@ResponseBody
	public String deleteReply(int reply_seq) {
		System.out.println("댓글 삭제 도착!!");
		System.out.println(reply_seq+"이 댓글 삭제로 넘어옴!");
		int result = 0;
		try {
			result = service.deleteReply(reply_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(reply_seq+"");
		return  reply_seq+"";
	}
	@RequestMapping("/viewAllReply")
	@ResponseBody
	public String viewReply(int feed_seq,Model model) {
		System.out.println("게시물 댓글 보기 도착!!");
		System.out.println(feed_seq);
		try {
			List<ReplyDTO> list = service.viewAllReply(feed_seq);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "feeds/myFeed";
	}
}
