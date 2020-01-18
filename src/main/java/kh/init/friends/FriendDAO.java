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

	public List<FriendDTO> getFriendsList(String id) throws Exception{
		return jdbc.selectList("Friend.selectById", id);

	}
	public List<FriendDTO> getFriendsList(String id,String search) throws Exception{
		
		String search2 = "%"+search+"%";
		System.out.println("dao 내의 서치값은"+search);
		System.out.println("dao 내의 서치값2은"+search2);
		Map<String,String> map = new HashMap<>();
		map.put("my_id", id);
		if(search != null) {
			map.put("fr_id", search2);
			}
		return jdbc.selectList("Friend.selectBySearch", map);

	}
	public int deleteRelation(String my_id,String fr_id) throws Exception {
		System.out.println("검색 출력 dao 내 id : "+my_id+"친구id : "+fr_id);
		Map<String,String> map = new HashMap<>();
		map.put("my_id", my_id);
		map.put("fr_id", fr_id);
		return jdbc.delete("Friend.deleteRelation",map);
	}

	public int changeRelation(FriendDTO dto) throws Exception {
		Map<String,String> param= new HashMap<>();
		//		param.put("id", dto.getId());
		//		param.put("pw", dto.getPw());
		//		param.put("name", dto.getName());
		//		param.put("phone", dto.getPhone());
		return jdbc.update("Members.update",param);
	}
	public int insertFriendship(String my_id,String yr_id,String relation) throws Exception {
		Map<String,String> param= new HashMap<>();
        param.put("my_id", my_id);
        param.put("yr_id", yr_id);
        param.put("relation", relation);
        return jdbc.insert("Friend.insertFriendship",param);

	}
	public List<FriendRequestDTO> getFndRequestList(String id) throws Exception{
		return jdbc.selectList("Friend.selectListReqById",id);

	}
	public List<FriendRequestDTO> getFndRequestList(String id,String search) throws Exception{
		String search2 =  "%"+search+"%";
		
		
		Map<String,String> map = new HashMap<>();
		map.put("to_id", id);
		if(search != null) {
		map.put("from_id", search2);
		}
		return jdbc.selectList("Friend.selectListReqBySearch",map);

	}
	public FriendRequestDTO getFndRequest(String id) throws Exception{
		return jdbc.selectOne("Friend.selectReqBySearch",id);

	}
	public FriendRequestDTO getFndRequest2(String id,String yr_id) throws Exception{
		Map<String,String> param= new HashMap<>();
		param.put("my_id", id);
		param.put("yr_id", yr_id);
		return jdbc.selectOne("Friend.selectReqById2",param);

	}
	public int deleteRequest(String from_id) throws Exception {
		
		return jdbc.delete("Friend.deleteRequest",from_id);
	}
	public int insertFndRequest(FriendDTO dto) throws Exception {
		Map<String,String> param= new HashMap<>();

		return jdbc.insert("Friend.friendRequest",param);

	}
}
