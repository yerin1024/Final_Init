package kh.init.feeds;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.init.members.MemberDTO;



@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	@Autowired
	private ReplyDAO replyDAO;

	@Transactional
	public int registerFeed(FeedDTO dto, List<String> mediaList, String mediaPath, String realPath) throws Exception{
		int feed_seq = dao.getFeedSeq();
		dto.setFeed_seq(feed_seq);
		
		String contents = dto.getContents();
		Pattern p = Pattern.compile("(#[가-히a-zA-Z]*[가-히a-zA-Z])");
		Matcher m = p.matcher(contents);
		String hashtag = "";
		while(m.find()) {
			hashtag += (m.group(0)+",");
		}
		dto.setHashtag(hashtag);
		
		int result = dao.registerFeed(dto);
		File path = new File(mediaPath);
		
		if(!(path.exists())) {
			path.mkdir();
		}
		if(mediaList!=null) { //파일첨부
			for(int i=0; i<mediaList.size(); i++) {
				System.out.println("mediaList("+i+") -"+mediaList.get(i)+" register");

				File fromFile = new File(realPath+mediaList.get(i));

				File toFile = new File(realPath+mediaList.get(i).replace("Tmp", ""));
				fromFile.renameTo(toFile);

				fromFile.delete();

				dao.registerMedia(feed_seq, mediaList.get(i).replace("Tmp", ""));
			}
		}

		return result;
	}

	public List<FeedDTO> selectAll() throws Exception{
		List<FeedDTO> list = dao.selectAll(null);
		return list;
	}
	
	public Map<String, Object> scrapFeed(String email) throws Exception{
		List<FeedDTO> list = dao.scrapFeed(email);
		List<String> cover = new ArrayList<>();

		//미디어 체크
		for(FeedDTO tmp : list) {
			int feed_seq = tmp.getFeed_seq();
			List<String> media = dao.getMediaList(feed_seq);
			if(media.size()==0) {
				cover.add("<span class='cover'>"+tmp.getTitle()+"</span>");
			}else {
				if(media.get(0).endsWith("mp4")) { //파일이 동영상일 경우
					String video = "<video class='cover' src=\""+media.get(0)+"\">";
					cover.add(video);
				}else {//파일이 이미지
					String img = "<img class='cover' src=\""+media.get(0)+"\">";
					cover.add(img);
				}
			}
			System.out.println(cover);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("scrapList", list);
		map.put("cover", cover);
		return map;

	}

	public Map<String, Object> wholeFeed(String keyword) throws Exception{
		

		if(keyword!=null) {
			keyword = "%"+keyword+"%";
		}
		List<FeedDTO> list = dao.selectAll(keyword);
		List<String> cover = new ArrayList<>();

		//미디어 체크
		for(FeedDTO tmp : list) {
			int feed_seq = tmp.getFeed_seq();
			List<String> media = dao.getMediaList(feed_seq);
			if(media.size()==0) {
				cover.add("<span class='cover'>"+tmp.getTitle()+"</span>");
			}else {
				if(media.get(0).endsWith("mp4")) { //파일이 동영상일 경우
					String video = "<video class='cover' src=\""+media.get(0)+"\">";
					cover.add(video);
				}else {//파일이 이미지
					String img = "<img class='cover' src=\""+media.get(0)+"\">";
					cover.add(img);
				}
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("dtoList", list);
		map.put("cover", cover);
		return map;
	}

	public List<MemberDTO> searchFriend(String keyword) throws Exception{
		List<MemberDTO> list = dao.searchFriend(keyword);
		return list;
	}

	
	
	@Transactional
	public int deleteFeed(int feed_seq)throws Exception{
		int feedResult = dao.deleteFeed(feed_seq);
		int replyResult = replyDAO.deleteReply("feed_seq",feed_seq);
		return replyResult;
	}

	public int modifyFeed(FeedDTO dto)throws Exception{

		int result = dao.modifyFeed(dto);
		return result;
	}




	public FeedDTO detailView(int feed_seq) throws Exception{
		FeedDTO dto = dao.detailView(feed_seq);
		String contents = dto.getContents();
		String hashtags = dto.getHashtag();
		if(hashtags!=null) {
			String[] hashtag = hashtags.split(",");
			for(int i=0; i<hashtag.length; i++) {
				System.out.println(hashtag[i]);
				contents = contents.replace(hashtag[i], "<a href=\"wholeFeed?keyword=%23"+hashtag[i].replace("#", "")+"\">"+hashtag[i]+"</a>");
			}
		}
		dto.setContents(contents);
		System.out.println(contents);
		return dto;
	}

	public List<String> getMediaList(int feed_seq) throws Exception{
		List<String> list = dao.getMediaList(feed_seq);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).endsWith("mp4")) { //파일이 동영상일 경우
				String video = "<video src=\""+list.get(i)+"\">";
				list.set(i, video);
			}else {//파일이 이미지
				String img = "<img src=\""+list.get(i)+"\">";
				list.set(i, img);
			}
		}
		return list;
	}

	public int likeCheck(int feed_seq, String email) throws Exception{
		int result = dao.likeCheck(feed_seq, email);
		return result;
	}
	public int bookmarkCheck(int feed_seq, String email) throws Exception{
		int result = dao.bookmarkCheck(feed_seq, email);
		return result;
	}



	public String mediaTmpUpload(MultipartFile file, String tmpPath) throws Exception{

		String oriName = file.getOriginalFilename();
		String sysName = System.currentTimeMillis()+oriName;

		File path = new File(tmpPath);
		if(!(path.exists())){
			path.mkdir();
		}
		try {
			file.transferTo(new File(path+"/"+sysName));
		}catch(Exception e) {
			e.printStackTrace();
		}

		//파일경로 리턴
		System.out.println("/mediaTmp/"+sysName);
		return "/mediaTmp/"+sysName;
	}

	
	
	@Transactional
	public int insertLike(int feed_seq, String email) throws Exception{
		int like_seq = dao.getLikeSeq();
		int result = dao.insertLike(like_seq, feed_seq, email);
		return result;
	}

	public int deleteLike(int feed_seq, String email) throws Exception{
		int result = dao.deleteLike(feed_seq, email);
		return result;
	}


	public int insertBookmark(int feed_seq, String email) throws Exception{
		int result = dao.insertBookmark(feed_seq, email);
		return result;
	}

	public int deleteBookmark(int feed_seq, String email) throws Exception{
		int result = dao.deleteBookmark(feed_seq, email);
		return result;
	}

	//	--------------------------댓글
	public String registerReply(ReplyDTO dto)throws Exception{
		Gson gson = new Gson();
		int reply_seq = replyDAO.replyNextSeq();
		dto.setReply_seq(reply_seq);
		int result = replyDAO.registerReply(dto);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nickname", dto.getNickname());
		map.put("contents", dto.getContents());
		map.put("reply_seq", dto.getReply_seq());
		String jsonString = gson.toJson(map);
		return jsonString;
	}
	public int deleteReply(int reply_seq)throws Exception{
		int result = replyDAO.deleteReply("reply_seq",reply_seq);
		return result;
	}
	public List<ReplyDTO> viewAllReply(int feed_seq)throws Exception{
		List<ReplyDTO> list = replyDAO.viewAllReply(feed_seq);
		return list;
	}
}
