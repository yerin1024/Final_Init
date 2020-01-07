package kh.init.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.init.feeds.FeedDTO;
import kh.init.members.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adao;
	
	public List<MemberDTO> memberList() throws Exception{
		return adao.memberList();
	}
	public List<MemberDTO> blackList() throws Exception{
		return adao.blackList();
	}
	public int toBlack(String email) throws Exception{
		return adao.toBlack(email);
	}
	public int withdrawal(String email) throws Exception{
		return adao.withdrawal(email);
	}
	public int toMember(String email) throws Exception{
		return adao.toMember(email);
	}
	public List<FeedDTO> myFeedList(String email) throws Exception{
		return adao.myFeedList(email);
	}
	public int deleteFeed(int feed_seq) throws Exception{
		return adao.deleteFeed(feed_seq);
	}
	public List<MemberDTO> search(String searchTag, String search) throws Exception{
		return adao.search(searchTag, search);
	}
	public List<MemberDTO> searchForBlack(String searchTag, String search) throws Exception{
		return adao.searchForBlack(searchTag, search);
	}
}
