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
	//친구 목록 조회
	public List<FriendDTO> getFriendsList(String id) throws Exception{

		return jdbc.selectList("Friend.selectById", id);

	}
	public List<FriendDTO> getFriendsIsOk(String my_id,String fr_id) throws Exception{
		Map<String,String> map = new HashMap<>();
		map.put("id", my_id);
		map.put("fr_id", fr_id);
		return jdbc.selectList("Friend.selectByIdOk", map);

	}
	//친구 목록 조회(아이디 검색)
	public List<FriendDTO> getFriendsList(String id,String search) throws Exception{

		String search2 = "%"+search+"%";
		System.out.println("dao 내의 서치값은"+search);
		System.out.println("dao 내의 서치값2은"+search2);
		System.out.println("dao 넘어온 이메일은 "+id);
		Map<String,String> map = new HashMap<>();
		map.put("my_id", id);
		map.put("fr_id", search2);

		return jdbc.selectList("Friend.selectBySearch", map);

	}
	// 친구 관계 삭제
	public int deleteRelation(String my_id,String fr_id) throws Exception {
		System.out.println("검색 출력 dao 내 id : "+my_id+"친구id : "+fr_id);
		Map<String,String> map = new HashMap<>();
		map.put("my_id", my_id);
		map.put("fr_id", fr_id);
		return jdbc.delete("Friend.deleteRelation",map);
	}
	//관계 바꿔
	public int changeRelation(FriendDTO dto) throws Exception {
		Map<String,String> param= new HashMap<>();
		//		param.put("id", dto.getId());
		//		param.put("pw", dto.getPw());
		//		param.put("name", dto.getName());
		//		param.put("phone", dto.getPhone());
		return jdbc.update("Members.update",param);
	}
	//친구 수락해서 우정 생김
	public int insertFriendship(String my_id,String yr_id,String relation) throws Exception {
		Map<String,String> param= new HashMap<>();
		param.put("my_id", my_id);
		param.put("yr_id", yr_id);
		param.put("relation", relation);
		return jdbc.insert("Friend.insertFriendship",param);

	}
	// 친구 요청 리스트 가져오기
	public List<FriendRequestDTO> getFndRequestList(String id) throws Exception{
		return jdbc.selectList("Friend.selectListReqById",id);

	}
	public List<FriendRequestDTO> getFndRequestIsOk(String fr_id,String my_id) throws Exception{
		Map<String,String> map = new HashMap<>();
		map.put("id", fr_id);
		map.put("from_id", my_id);
		return jdbc.selectList("Friend.selectListReqById2",map);

	}
	// 검색된 친구 요청 리스트 가져오기
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
	public int insertFndRequest(FriendRequestDTO dto,String id,int seq) throws Exception {
		Map<String,Object> param= new HashMap<>();

		param.put("seq",seq);
		param.put("from_id", id);
		param.put("to_id", dto.getTo_id());
		param.put("relation", dto.getRelation());
		return jdbc.insert("Friend.friendRequest",param);

	}
	public int selectByReqSeq() throws Exception {
		return jdbc.selectOne("Friend.selectByReqSeq");
	}
}
