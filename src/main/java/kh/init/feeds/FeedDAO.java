package kh.init.feeds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.init.admin.DeclareDTO;
import kh.init.members.MemberDTO;

@Repository
public class FeedDAO {

	@Autowired
	private SqlSessionTemplate jdbc;

	public int getFeedSeq() throws Exception{
		int feed_seq = jdbc.selectOne("Feed.getFeedSeq");
		return feed_seq;
	}


	
	public Map<String, Object> getMyFeed(String email, int startNum, int endNum) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("startNum", startNum+"");
		param.put("endNum", endNum+"");
		List<FeedDTO> list = jdbc.selectList("Feed.getMyFeed", param);
		List<Integer> rnum = jdbc.selectList("Feed.getMyFeedRnum", param);
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("rnum", rnum);
		return result;
	}
	public Map<String, Object> getMyFeedByFriend(String email,String myEmail, int startNum, int endNum) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("myEmail", myEmail);
		param.put("yourEmail", email);
		param.put("startNum", startNum+"");
		param.put("endNum", endNum+"");
		List<FeedDTO> list = jdbc.selectList("Feed.getMyFeedByFriend", param);
		List<Integer> rnum = jdbc.selectList("Feed.getMyFeedRnumByFriend", param);
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("rnum", rnum);
		return result;
	}
	public Map<String, Object> getMyScrapFeed(String email, int startNum, int endNum) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("startNum", startNum+"");
		param.put("endNum", endNum+"");
		List<FeedDTO> list = jdbc.selectList("Feed.getMyScrapFeed", param);
		List<Integer> rnum = jdbc.selectList("Feed.getMyScrapFeedRnum", param);
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("rnum", rnum);
		return result;
	}
	
	public int getMyFeedCount(String email) throws Exception{
		int count = jdbc.selectOne("Feed.getMyFeedCount", email);
		return count;

	}

	//wholeFeed에서 해시태그 검색 또는 그냥 기본wholeFeed뽑을때 
	public Map<String, Object> selectAll(String keyword,  int startNum, int endNum, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("startNum", startNum+"");
		param.put("endNum", endNum+"");
		param.put("email", email);
		System.out.println("keyword : "+keyword);
		System.out.println("dao sNum : "+startNum);
		System.out.println("dao eNum : "+endNum);
		List<FeedDTO> list = jdbc.selectList("Feed.selectAll", param);
		System.out.println("dao list : "+list.toString());
		List<Integer> rnum = jdbc.selectList("Feed.selectAllRnum", param);
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("rnum", rnum);
		return result;
	}
	
	public String getTitle(int feed_seq) throws Exception{
		String title = jdbc.selectOne("Feed.getTitle", feed_seq);
		System.out.println("dao title : "+title);
		return title;
	}
	public int selectAllCount(String keyword, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("email", email);
		int result = jdbc.selectOne("Feed.selectAllCount", param);
		return result;
	}

	//wholeFeed에서 친구검색했을 경우
	public List<MemberDTO> searchFriend(String email, String keyword) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("email", email);
		System.out.println("dao email : "+email);
		System.out.println("dao keyword : "+keyword);
		List<MemberDTO> list = jdbc.selectList("Feed.searchFriend", param);
		return list;
	}


	//writeFeed에서 글쓰기를 눌렀을때 내용등록
	public int registerFeed(FeedDTO dto) throws Exception{
		int result = jdbc.insert("Feed.registerFeed", dto);
		return result;
	}
	
	public int modifyFeed(FeedDTO dto)throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", dto.getFeed_seq()+"");
		param.put("title", dto.getTitle());
		param.put("contents", dto.getContents());
		param.put("relation", dto.getRelation());
		param.put("hashtag", dto.getHashtag());
		return jdbc.update("Feed.modifyFeed",param);		
	}
	
	
	//writeFeed에서 글쓰기 눌렀을때 미디어 등록
	public int registerMedia(int feed_seq, String media) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("media", media);
		int result = jdbc.insert("Feed.registerMedia", param);
		return result;
	}

	public int deleteFeed(int seq) throws Exception{
		return jdbc.delete("Feed.deleteFeed", seq);
	}

	public List<FeedDTO> scrapFeed(String email) throws Exception{
		List<FeedDTO> list = jdbc.selectList("Feed.scrapFeed", email);
		return list;
	}



	public FeedDTO detailView(int feed_seq) throws Exception{
		FeedDTO dto = jdbc.selectOne("Feed.detailView", feed_seq);
		return dto;
	}

	//controller-detailView에서 media 목록을 얻기 위한 dao
	public List<String> getMediaList(int feed_seq) throws Exception{
		List<String> list = jdbc.selectList("Feed.getMediaList", feed_seq);
		return list;
	}

	//profile_img 목록을 얻기 위한 dao
	public String getProfile_img(String email) throws Exception{
		String result = jdbc.selectOne("Feed.getProfile_img", email);
		return result;
	}
	
	//신고게시물 seq리스트
	public List<Integer> getDeclareFeed(String from_id) throws Exception{
		return jdbc.selectList("Feed.getDeclareFeed", from_id);
	}

	public int getFriendFeedCount(String email) throws Exception{
		int result = jdbc.selectOne("Feed.getFriendFeedCount", email);
		return result;
	}
	
	
	public List<FeedDTO> getFriendFeed(String email, int startNum, int endNum) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("email", email);
		param.put("startNum", startNum+"");
		param.put("endNum", endNum+"");
		List<FeedDTO> list = jdbc.selectList("Feed.getFriendFeed", param);
		return list;
	}


	//detailView 열때 좋아요체크
	public int likeCheck(int feed_seq, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("email", email);
		int result = jdbc.selectOne("Feed.likeCheck", param);
		return result;
	}

	//detailView 열때 북마크체크
	public int bookmarkCheck(int feed_seq, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("email", email);
		int result = jdbc.selectOne("Feed.bookmarkCheck", param);
		return result;
	}

	public int getLikeSeq() throws Exception{
		int like_seq = jdbc.selectOne("Feed.getLikeSeq");
		return like_seq;
	}

	//좋아요
	public int insertLike(int like_seq, int feed_seq, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("like_seq", like_seq+"");
		param.put("feed_seq", feed_seq+"");
		param.put("email", email);
		int result = jdbc.insert("Feed.insertLike", param);
		return result;
	}
	public int deleteLike(int feed_seq, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("email", email);
		int result = jdbc.insert("Feed.deleteLike", param);
		return result;
	}

	//북마크
	public int insertBookmark(int feed_seq, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("email", email);
		int result = jdbc.insert("Feed.insertBookmark", param);
		return result;
	}
	public int deleteBookmark(int feed_seq, String email) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("feed_seq", feed_seq+"");
		param.put("email", email);
		int result = jdbc.insert("Feed.deleteBookmark", param);
		return result;
	}
}
