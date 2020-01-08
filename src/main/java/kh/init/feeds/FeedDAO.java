package kh.init.feeds;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FeedDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	

	public int registerFeed(FeedDTO dto) throws Exception{
		int result = jdbc.insert("Feed.registerFeed", dto);
		return result;
	}
	public int deleteFeed(ReplyDTO dto) throws Exception{
		return jdbc.delete("Feed.deleteFeed", dto);
	}
	
	public List<FeedDTO> selectAll() throws Exception{
		List<FeedDTO> list = jdbc.selectList("Feed.selectAll");
		return list;
	}
	public int modifyFeed(FeedDTO dto)throws Exception{
		return jdbc.update("Feed.modifyFeed",dto);		
	}
	
	public FeedDTO detailView(int feed_seq) throws Exception{
		FeedDTO dto = jdbc.selectOne("Feed.detailView", feed_seq);
		return dto;
	}
	
	public List<String> getMediaList(int feed_seq) throws Exception{
		List<String> list = jdbc.selectList("Feed.getMediaList", feed_seq);
		return list;
	}
}
