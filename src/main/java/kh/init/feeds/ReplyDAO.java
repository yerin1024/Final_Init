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
	public int deleteReply(ReplyDTO dto)throws Exception{
		return jdbc.delete("Feed.deleteReply", dto);
	}
	public List<ReplyDTO> viewReply(int feed_seq)throws Exception{
		return jdbc.selectList("Feed.viewReply",feed_seq);
	}
	public int deleteFeedAndReply(ReplyDTO dto)throws Exception{
		return jdbc.delete("Feed.deleteFeedAndReply", dto);
	}
}
