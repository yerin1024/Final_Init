package kh.init.feeds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FeedDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int getFeedSeq() throws Exception{
		int feed_seq = jdbc.selectOne("Feed.getFeedSeq");
		return feed_seq;
	}

	public int registerFeed(FeedDTO dto) throws Exception{
		int result = jdbc.insert("Feed.registerFeed", dto);
		return result;
	}
	public int registerMedia(int feed_seq, String media) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("media", media);
		int result = jdbc.insert("Feed.registerMedia", param);
		return result;
	}
	
	public int deleteFeed(String seq) throws Exception{
		Map<String,String> param = new HashMap<String, String>();
		param.put("seq", seq);
		return jdbc.delete("Feed.deleteFeed", param);
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
