package kh.init.feeds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/feed")
@Controller
public class FeedController {
	
	@Autowired
	private FeedService service;
	
	
}
