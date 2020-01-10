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
	public String deleteProc(int feed_seq) {
		System.out.println("삭제 도착!");
		try {
			int result =  service.deleteFeed(feed_seq);
			int replyResult = service.deleteReply(feed_seq);
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
		dto.setEmail(((MemberDTO)session.getAttribute("loginInfo")).getEmail());
		dto.setNickname(((MemberDTO)session.getAttribute("loginInfo")).getNickname());

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
		
		String filePath = null;
		String returnVal = null;
		if(file.getSize()>10485760) {
			returnVal = "{\"result\" : \"fail\"}";
			return returnVal;
		}
		
		String fileType = file.getContentType();
		
		fileType = fileType.split("/")[0];
		System.out.println("fileType : "+fileType);

		if(fileType.contentEquals("image")||fileType.contentEquals("video")) {
			filePath = service.mediaTmpUpload(file, path);
			System.out.println("filePath : " +filePath);
			((ArrayList<String>)session.getAttribute("mediaList")).add(filePath);
			
			returnVal = "{\"result\" : \""+filePath+"\", \"type\" : \""+fileType+"\"}";
		}else {
			returnVal = "{\"result\" : \"fail\"}";
		}
		return returnVal;
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
		System.out.println(feed_seq);
		int likeCheck = 0; //0은 안한것 1은 한것
		int bookmarkCheck = 0; //0은 안한것 1은 한것
		FeedDTO dto = null;
		List<ReplyDTO> replyList = null;
		List<String> list = null;
		try {
			dto = service.detailView(feed_seq);
			likeCheck = service.likeCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail());
			bookmarkCheck = service.bookmarkCheck(feed_seq, ((MemberDTO)session.getAttribute("loginInfo")).getEmail());
			
			replyList = service.viewReply(feed_seq);
			list = service.getMediaList(feed_seq);
			System.out.println(replyList.size() + "리플라이리스트 사이즈입니다.");
			System.out.println(dto.toString());
			model.addAttribute("likeCheck", likeCheck);
			model.addAttribute("bookmarkCheck", bookmarkCheck);
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

	//좋아요
	@RequestMapping(value = "/insertLike", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String insertLike(int feed_seq) {
		System.out.println("insertLike 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		
		try {
			service.insertLike(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}
	@RequestMapping(value = "/deleteLike", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String deleteLike(int feed_seq) {
		System.out.println("deleteLike 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		try {
			service.deleteLike(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}
	
	
	
	
	//북마크
	@RequestMapping(value = "/insertBookmark", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String insertBookmark(int feed_seq) {
		System.out.println("insertBookmark 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		
		try {
			service.insertBookmark(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}
	@RequestMapping(value = "/deleteBookmark", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String deleteBookmark(int feed_seq) {
		System.out.println("deleteBookmark 도착");
		System.out.println("feed_seq : "+feed_seq);
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		try {
			service.deleteBookmark(feed_seq, email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "like";
	}
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//                                             댓글기능
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	@RequestMapping("/registerReply")
	public String registerReply(FeedDTO dto) {
		System.out.println("댓글 등록도착!");
		
		//세션값 대체 임시 닉네임
		dto.setNickname("yes");
		
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
