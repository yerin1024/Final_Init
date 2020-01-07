package kh.init.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.feeds.FeedDTO;
import kh.init.members.MemberDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<MemberDTO> memberList() throws Exception{
		return jdbc.selectList("Admin.memberList");
	}
	public List<MemberDTO> blackList() throws Exception{
		return jdbc.selectList("Admin.blackList");
	}
	public int toBlack(String email) throws Exception{
		return jdbc.update("Admin.toBlack", email);
	}
	public int withdrawal(String email) throws Exception{
		return jdbc.delete("Admin.withdrawal",email);
	}
	public int toMember(String email) throws Exception{
		return jdbc.update("Admin.toMember", email);
	}
	public List<FeedDTO> myFeedList(String email) throws Exception{
		return jdbc.selectList("Admin.myFeedList", email);
	}
	public int deleteFeed(int feed_seq) throws Exception{
		return jdbc.delete("Admin.deleteFeed", feed_seq);
	}
	public List<MemberDTO> search(String searchTag, String search) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		return jdbc.selectList("Admin.search", map);
	}
	public List<MemberDTO> searchForBlack(String searchTag, String search) throws Exception{
		System.out.println(searchTag + ":" + search);
		Map<String, Object> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		return jdbc.selectList("Admin.searchForBlack", map);
	}
}
