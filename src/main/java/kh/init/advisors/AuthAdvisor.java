package kh.init.advisors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

public class AuthAdvisor {

	@Autowired
	private HttpSession session;
	
	
}
