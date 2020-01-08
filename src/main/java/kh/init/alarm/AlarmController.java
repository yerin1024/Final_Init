package kh.init.alarm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/alarm")
@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService service;

}
