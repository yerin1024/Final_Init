package kh.init.friends;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FriendDAO {

	@Autowired
	private SqlSessionTemplate jdbc;

	public List<FriendDTO> getMyInfo(String id) throws Exception{
		return jdbc.selectList("Friends.select", id);

	}
	public int deleteRelation(String id) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		return jdbc.delete("Members.delete",map);
	}

	public int changeRelation(FriendDTO dto) throws Exception {
		Map<String,String> param= new HashMap<>();
		//		param.put("id", dto.getId());
		//		param.put("pw", dto.getPw());
		//		param.put("name", dto.getName());
		//		param.put("phone", dto.getPhone());
		return jdbc.update("Members.update",param);
	}
	public int insertFriendship(FriendDTO dto) throws Exception {
		Map<String,String> param= new HashMap<>();

		return jdbc.insert("Members.insert",param);

	}

	public FriendDTO getFndRequest(String id) throws Exception{
		return jdbc.selectOne("Members.selectById",id);

	}
	public int deleteRequest(String id) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		return jdbc.delete("Members.delete",map);
	}
	public int insertFndRequest(FriendDTO dto) throws Exception {
		Map<String,String> param= new HashMap<>();

		return jdbc.insert("Members.insert",param);

	}
}
