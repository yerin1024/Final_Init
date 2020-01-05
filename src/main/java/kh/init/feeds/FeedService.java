package kh.init.feeds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	
	public int registerFeed(FeedDTO dto) {
		return dao.registerFeed(dto);
	}
	
}
