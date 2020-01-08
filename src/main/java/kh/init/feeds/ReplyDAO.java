package kh.init.feeds;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int registerReply(FeedDTO dto)throws Exception{
		return jdbc.insert("Feed.registerReply", dto);
	}
	public int deleteReply(int feed_seq)throws Exception{
		return jdbc.delete("Feed.deleteReply", feed_seq);
	}
	public List<ReplyDTO> viewReply(int feed_seq)throws Exception{
		System.out.println(feed_seq);
		return jdbc.selectList("Feed.viewReply",feed_seq);
	}
}
