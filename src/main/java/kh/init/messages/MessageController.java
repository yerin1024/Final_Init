package kh.init.messages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/message")
@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	
}
