package kh.init.friends;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.init.members.MemberDAO;
import kh.init.members.MemberDTO;

@Service
public class FriendService {
   
	@Autowired
	private FriendDAO dao;
	
	@Autowired
	private MemberDAO mdao;
	
	@Transactional("txManager")
	public List<MemberDTO> getRequestMemList(String id) throws Exception{
		List<MemberDTO> realList = new ArrayList<>();
		List<FriendRequestDTO> list = dao.getFndRequestList(id);
		System.out.println("svc listsize : "+list.size());
		
		for(int i=0; i<list.size();i++) {
			MemberDTO mlist = mdao.getMyInfo(list.get(i).getFrom_id());
			realList.add(mlist);
			
		}
		System.out.println("realList :"+realList.size());
	
		return realList;
	}
	@Transactional("txManager")
	public int acceptFriendRequest(String my_id,String yr_id,String my_relation) throws Exception{
		FriendRequestDTO dto = dao.getFndRequest2(my_id,yr_id);
		int result = dao.insertFriendship(my_id,yr_id,"1");
		int result2 = dao.insertFriendship(yr_id,my_id,dto.getRelation());
		int result3 = dao.deleteRequest(yr_id);
	    return result;
	}
	
	@Transactional("txManager")
	public int cutFriendship(String my_id, String fr_id) throws Exception{
		System.out.println("친구 끊기 svc 도착");
		int result =dao.deleteRelation(my_id, fr_id);
		int result2 =dao.deleteRelation(fr_id, my_id);
		return result;
	}
	
	@Transactional("txManager")
	public List<MemberDTO> getFriendsListService(String id) throws Exception{
		List<MemberDTO> list = new ArrayList<>();
		List<FriendDTO> flist = dao.getFriendsList(id);
		for(int i=0;flist.size()>i;i++) {
			String fr_id = flist.get(i).getFr_id();
			list.add(mdao.getMyInfoByFriend(fr_id));
		}
		
			return list;
		
		
	}
	
	@Transactional("txManager")
	public int friendRequestService(FriendDTO dto) throws Exception {
			
			    System.out.println("친구요청 서비스 도착");
				int result = dao.insertFndRequest(dto);
				return result;
			   
		}
}
