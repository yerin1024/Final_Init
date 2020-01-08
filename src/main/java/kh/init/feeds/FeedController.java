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

@RequestMapping("/feed")
@Controller
public class FeedController {

	@Autowired
	private FeedService service;
	@Autowired
	private HttpSession session;

	@RequestMapping("/myFeed")
	public String myFeed(Model model) {
		System.out.println("wholeFeed 도착");
		List<FeedDTO> list = null;
		try {
			list = service.selectAll();
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "feeds/myFeed";
	}

	@RequestMapping("/deleteProc")
	public String deleteProc(int seq) {
		System.out.println("삭제 도착!");
		try {
			int result =  service.deleteFeed(seq);
			System.out.println(result + "행이 삭제되었습니다.");
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
		String mediaPath = session.getServletContext().getRealPath("media");
		String realPath = session.getServletContext().getRealPath("");
		List<String> mediaList = ((ArrayList<String>)session.getAttribute("mediaList"));
		
		try {
			result = service.registerFeed(dto, mediaList, mediaPath, realPath);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(result + "행의 게시물이 등록");
		
		session.setAttribute("mediaList", null);

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
	public String detailView(String feed_seqS, Model model) {

		System.out.println("detailView 도착");
		int feed_seq = Integer.parseInt(feed_seqS);
		FeedDTO dto = null;
		List<ReplyDTO> replyList = null;
		List<String> list = null;
		try {
			dto = service.detailView(feed_seq);
			replyList = service.viewReply(feed_seq);
			list = service.getMediaList(feed_seq);
			System.out.println(replyList.size() + "리플라이리스트 사이즈입니다.");
			System.out.println(dto.toString());
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
	public String modifyFeedView(int feed_seq, Model model) {
		System.out.println("게시물 수정페이지 도착!");
		FeedDTO dto = null;
		List<String> list = null;
		try {
			dto = service.detailView(feed_seq);
			list = service.getMediaList(feed_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		model.addAttribute("media", list);
		return "/feeds/modifyFeedView";
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//                                             댓글기능
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	@RequestMapping("/registerReply")
	public String registerReply(FeedDTO dto) {
		System.out.println("댓글 등록도착!");
		System.out.println(dto.getFeed_seq()+ " : "+dto.getContents()+" : "+dto.getNickname());
		try {
			int result = service.registerReply(dto);
			System.out.println(result + "개의 댓글이 추가되었습니다");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:myFeed";
	}
	@RequestMapping("/modifyReply")
	public String modifyReply(FeedDTO dto) {
		return "feeds/myFeed";
	}

	@RequestMapping("/deleteReply")
	@ResponseBody
	public String deleteReply(ReplyDTO dto) {
		int seq = dto.getReply_seq();
		System.out.println("댓글 삭제 도착!!");
		System.out.println(dto.getFeed_seq()+": 피드 시퀀스~");
		System.out.println(dto.getReply_seq()+": 댓글피드 시퀀스~");
		int result = 0;
		try {
			result = service.deleteReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(seq+"");
		return seq+"";
	}
	@RequestMapping("/viewReply")
	@ResponseBody
	public String viewReply(int feed_seq,Model model) {
		System.out.println("게시물 댓글 보기 도착!!");
		System.out.println(feed_seq);
		try {
			List<ReplyDTO> list = service.viewReply(feed_seq);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "feeds/myFeed";
	}
}
