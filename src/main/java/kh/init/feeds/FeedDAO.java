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
	
	public List<FeedDTO> selectAll() throws Exception{
		List<FeedDTO> list = jdbc.selectList("Feed.selectAll");
		return list;
	}
	
	public FeedDTO detailView(String feed_seq) throws Exception{
		FeedDTO dto = jdbc.selectOne("detailView", feed_seq);
		return dto;
	}
}
