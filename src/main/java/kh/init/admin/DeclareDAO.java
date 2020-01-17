package kh.init.admin;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.members.MemberDTO;

@Repository
public class DeclareDAO {
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int insertDeclare(DeclareDTO ddto) throws Exception{
		return jdbc.insert("Admin.declare",ddto);
	}
	public String getReportedEmail(int feed_seq) throws Exception{
		return jdbc.selectOne("Feed.getReportedEmail",feed_seq);
	}
	public List<DeclareDTO> declarationList() throws Exception{
		return jdbc.selectList("Admin.declarationList");
	}
	//Declare 페이징
	public int recordDeclare() throws Exception{
		return jdbc.selectOne("Admin.dbDeclare");
	}
	public List<DeclareDTO> selectDeclareByPage(int start, int end) throws Exception{
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.selectDeclareByPage",map);
	}
	//declare페이징(검색기능)
	public int recordSearchForDeclare(String searchTag, String search) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		return jdbc.selectOne("Admin.dbsearchForDeclare",map);
	}
	public List<DeclareDTO> searchForDeclarePaging(String searchTag, String search, int start, int end) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("searchTag", searchTag);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		return jdbc.selectList("Admin.searchForDeclarePaging",map);
	}
}
