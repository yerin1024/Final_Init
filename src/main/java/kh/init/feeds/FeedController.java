package kh.init.feeds;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String deleteProc(String seq) {
		System.out.println("삭제 도착!");
		System.out.println(seq);
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
		String email = "yes";
		String nickname = "yes";
		String image = "";
		String video = "";
		dto.setImage(image);
		dto.setVideo(video);
		dto.setEmail(email);
		dto.setNickname(nickname);
		System.out.println(dto.toString());
		String imagePath = session.getServletContext().getRealPath("imageFiles");
		String videoPath = session.getServletContext().getRealPath("videoFiles");
		int result = service.registerFeed(dto,imagePath,videoPath);        
		System.out.println(result + "행의 게시물이 등록");
		return "redirect:myFeed";
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
	public String detailView(String feed_seq, Model model) {
		System.out.println("detailView 도착");
		System.out.println(feed_seq);
		FeedDTO dto = null;
		try {
			dto = service.detailView(feed_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		
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
	public String modifyFeedView(String feed_seq,FeedDTO dto,Model model) {
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
}