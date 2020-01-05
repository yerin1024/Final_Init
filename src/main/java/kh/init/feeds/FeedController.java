package kh.init.feeds;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/feed")
@Controller
public class FeedController {

	@Autowired
	private FeedService service;

	@Autowired
	private HttpSession session;

	@RequestMapping("/write")
	public String write() {
		System.out.println("write 도착");
		return "/feeds/write";
	}

	@RequestMapping("/writeProc")
	public String writeProc(FeedDTO dto) {
		System.out.println("writeProc 도착");
		dto.setEmail("yerin102@nate.com");
		dto.setNickname("yerinNickname");
		
		String filePath = session.getServletContext().getRealPath("files");
		File path = new File(filePath);
		if(!(path.exists())) {
			System.out.println();
			path.mkdir();
		}
		try {
			for(MultipartFile tmp : dto.getFiles()) {
				System.out.println(tmp.getContentType());
				String oriName = tmp.getOriginalFilename();
				String sysName = System.currentTimeMillis()+oriName;
				tmp.transferTo(new File(path+"/"+sysName));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/home";
	}
}
