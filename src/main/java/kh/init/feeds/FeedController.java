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
	public String myFeed() {
		return "feeds/myFeed";
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
		dto.setEmail(email);
		dto.setNickname(nickname);
		System.out.println(dto.toString());
		String imagePath = session.getServletContext().getRealPath("imageFiles");
		String videoPath = session.getServletContext().getRealPath("videoFiles");
		int result = service.registerFeed(dto,imagePath,videoPath);
		
	
		
		System.out.println(result + "행의 게시물이 등록");
		return "redirect:/home";
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
		FeedDTO dto = null;
		try {
			dto = service.detailView(feed_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		
		return "/feeds/detailView";
	}
}
