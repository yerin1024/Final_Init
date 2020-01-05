package kh.init.feeds;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		return "redirect:../main";
	}
}
