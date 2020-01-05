package kh.init.feeds;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FeedDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int write(FeedDTO dto) throws Exception{
		int result = jdbc.insert("write");
		return result;
	}
}
