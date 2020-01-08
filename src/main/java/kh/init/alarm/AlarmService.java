package kh.init.alarm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmDAO dao;

}
