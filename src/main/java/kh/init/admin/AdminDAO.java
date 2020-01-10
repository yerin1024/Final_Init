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
	//페이징
	//member페이징
	public int recordTotal() throws Exception{
		return jdbc.selectOne("Admin.dbMember");
	}
	public List<MemberDTO> selectByPage(int start, int end) throws Exception{
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.selectByPage",map);
	}
	//member페이징(검색기능)
	public int recordSearchForMember(String searchTag, String search) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		return jdbc.selectOne("Admin.dbsearchForMember",map);
	}
	public List<MemberDTO> searchForMemberPaging(String searchTag, String search, int start, int end) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.searchForMemberPaging",map);
	}
	//black페이징
	public int recordBlack() throws Exception{
		return jdbc.selectOne("Admin.dbBlack");
	}
	public List<MemberDTO> selectBlackByPage(int start, int end) throws Exception{
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.selectBlackByPage",map);
	}
	//black페이징(검색기능)
	public int recordSearchForBlack(String searchTag, String search) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		return jdbc.selectOne("Admin.dbsearchForBlack",map);
	}
	public List<MemberDTO> searchForBlackPaging(String searchTag, String search, int start, int end) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.searchForBlackPaging",map);
	}
	//feed관리
	public List<FeedDTO> totalFeedList() throws Exception{
		return jdbc.selectList("Admin.totalFeedList");
	}
	public int deleteFeed(int feed_seq) throws Exception{
		return jdbc.delete("Admin.deleteFeed", feed_seq);
	}
	//feed페이징
	public int recordFeed() throws Exception{
		return jdbc.selectOne("Admin.dbFeed");
	}
	public List<FeedDTO> selectFeedByPage(int start, int end) throws Exception{
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.selectFeedByPage",map);
	}
	//feed페이징(검색기능)
	public int recordSearchForFeed(String searchTag, String search) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		return jdbc.selectOne("Admin.dbsearchForFeed",map);
	}
	public List<FeedDTO> searchForFeedPaging(String searchTag, String search, int start, int end) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.searchForFeedPaging",map);
	}
}
