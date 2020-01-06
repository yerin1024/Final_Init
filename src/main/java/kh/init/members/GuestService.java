package kh.init.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestService {

	@Autowired
	private MemberDAO dao;
	
	
}
