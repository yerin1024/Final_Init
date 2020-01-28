package kh.init.feeds;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.init.alarm.AlarmDAO;
import kh.init.members.MemberDTO;



@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private AlarmDAO aldao;

	@Transactional
	public int registerFeed(FeedDTO dto, List<String> mediaList, String mediaPath, String realPath) throws Exception{
		int feed_seq = dao.getFeedSeq();
		dto.setFeed_seq(feed_seq);
		String contents = dto.getContents();

		//해시태그 찾아냄
		Pattern p = Pattern.compile("(#[가-히a-zA-Z]*[가-히a-zA-Z])");
		Matcher m = p.matcher(contents);
		String hashtag = "";
		while(m.find()) {
			hashtag += (m.group(0)+",");
		}
		dto.setHashtag(hashtag);


		int result = dao.registerFeed(dto);

		//임시로 mediaTmp에 넣어뒀던 미디어들을 media폴더로 복사해줌
		File path = new File(mediaPath);
		if(!(path.exists())) {
			path.mkdir();
		}
		if(mediaList!=null) { //파일첨부
			for(int i=0; i<mediaList.size(); i++) {
				System.out.println("mediaList("+i+") -"+mediaList.get(i)+" register");

				File fromFile = new File(realPath+mediaList.get(i));

				//mediaTmp라는 폴더 경로를 Tmp부분을 없애주는 과정을 통해 media폴더로 옮겨줌
				File toFile = new File(realPath+mediaList.get(i).replace("Tmp", ""));
				fromFile.renameTo(toFile);

				//기존의 tmp폴더에 있는 파일은 삭제해줌
				//혹시 이 과정에서 지워지지 않았을 파일들을 매일 정기적으로 지워주는 스케줄러 GarbageDeleteScheduler를 만들어놓음
				fromFile.delete();

				//피드에 해당하는 파일들을 등록해줌
				dao.registerMedia(feed_seq, mediaList.get(i).replace("Tmp", ""));
			}
		}

		return result;
	}

	public String mediaTmpUpload(MultipartFile file, String tmpPath) throws Exception{

		String oriName = file.getOriginalFilename();
		String sysName = System.currentTimeMillis()+oriName;

		//임시로 mediaTmp폴더에 넣어주는 과정
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



	//myFeed를 위한
	public Map<String, Object> getMyFeed(int page, String email) throws Exception{
		int totalFeed = dao.getMyFeedCount(email);
		int startNum = 0;
		int endNum = 0;
		if (page==1){
			startNum = 1;
			endNum = 12;  //데이터를 10개씩 가져오겠다.
		}else{
			startNum = page+(11*(page-1));  //10개씩 가져오고싶다면  9로 
			endNum = page*12;   //20, 40, 60
			if(startNum>totalFeed) {
				return null;
			}else if(endNum>totalFeed) {
				endNum = totalFeed;
			}
		}
		List<FeedDTO> list = (List<FeedDTO>)dao.getMyFeed(email, startNum, endNum).get("list");
		List<Integer> rnum = (List<Integer>)dao.getMyFeed(email, startNum, endNum).get("rnum");
		List<String> cover = new ArrayList<>();//전체피드의 바둑판 대문사진

		//미디어리스트 체크
		for(FeedDTO tmp : list) {
			int feed_seq = tmp.getFeed_seq();
			List<String> media = dao.getMediaList(feed_seq);
			if(media.size()==0) { //이미지나 비디오가 없기 때문에 제목으로 커버를 만들어야되는 경우
				cover.add("<div class='cover'>"+tmp.getTitle()+"</div>");
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
		map.put("list", list);
		map.put("rnum", rnum);
		map.put("cover", cover);
		map.put("startNum", startNum);
		map.put("endtNum", endNum);
		return map;
	}
	//myFeed를 위한
		public Map<String, Object> getMyFeedByFriend(int page, String email,String myEmail) throws Exception{
			int totalFeed = dao.getMyFeedCount(email);
			int startNum = 0;
			int endNum = 0;
			if (page==1){
				startNum = 1;
				endNum = 12;  //데이터를 10개씩 가져오겠다.
			}else{
				startNum = page+(11*(page-1));  //10개씩 가져오고싶다면  9로 
				endNum = page*12;   //20, 40, 60
				if(startNum>totalFeed) {
					return null;
				}else if(endNum>totalFeed) {
					endNum = totalFeed;
				}
			}
			List<FeedDTO> list = (List<FeedDTO>)dao.getMyFeedByFriend(email, myEmail, startNum, endNum).get("list");
			List<Integer> rnum = (List<Integer>)dao.getMyFeedByFriend(email, myEmail, startNum, endNum).get("rnum");
			List<String> cover = new ArrayList<>();//전체피드의 바둑판 대문사진

			//미디어리스트 체크
			for(FeedDTO tmp : list) {
				int feed_seq = tmp.getFeed_seq();
				List<String> media = dao.getMediaList(feed_seq);
				if(media.size()==0) { //이미지나 비디오가 없기 때문에 제목으로 커버를 만들어야되는 경우
					cover.add("<span class='cover' style='width:100%;height:100%'>"+tmp.getTitle()+"</span>");
				}else {
					if(media.get(0).endsWith("mp4")) { //파일이 동영상일 경우
						String video = "<video class='cover' style='width:100%;height:100%' src=\""+media.get(0)+"\">";
						cover.add(video);
					}else {//파일이 이미지
						String img = "<img class='cover' style='width:100%;height:100%' src=\""+media.get(0)+"\">";
						cover.add(img);
					}
				}
			}

			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("rnum", rnum);
			map.put("cover", cover);
			map.put("startNum", startNum);
			map.put("endtNum", endNum);
			return map;
		}
	
		public Map<String, Object> getMyScrapFeed(int page, String email) throws Exception{
			int totalFeed = dao.getMyFeedCount(email);
			int startNum = 0;
	        int endNum = 0;
	        if (page==1){
	            startNum = 1;
	            endNum = 12;  //데이터를 10개씩 가져오겠다.
	        }else{
	        	startNum = page+(11*(page-1));  //10개씩 가져오고싶다면  9로 
	        	endNum = page*12;   //20, 40, 60
	        	if(startNum>totalFeed) {
	        		return null;
	        	}else if(endNum>totalFeed) {
	        		endNum = totalFeed;
	        	}
	        }
			List<FeedDTO> list = (List<FeedDTO>)dao.getMyScrapFeed(email, startNum, endNum).get("list");
			List<Integer> rnum = (List<Integer>)dao.getMyScrapFeed(email, startNum, endNum).get("rnum");
			List<String> cover = new ArrayList<>();//전체피드의 바둑판 대문사진

			//미디어리스트 체크
			for(FeedDTO tmp : list) {
				int feed_seq = tmp.getFeed_seq();
				List<String> media = dao.getMediaList(feed_seq);
				if(media.size()==0) { //이미지나 비디오가 없기 때문에 제목으로 커버를 만들어야되는 경우
					cover.add("<div class='cover'>"+tmp.getTitle()+"</div>");
				}else {
					if(media.get(0).endsWith("mp4")) { //파일이 동영상일 경우
						String video = "<video class='cover' style='width:100%;height:100%' src=\""+media.get(0)+"\">";
						cover.add(video);
					}else {//파일이 이미지
						String img = "<img class='cover' style='width:100%;height:100%' src=\""+media.get(0)+"\">";
						cover.add(img);
					}
				}
			}
					
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("rnum", rnum);
			map.put("cover", cover);
			map.put("startNum", startNum);
			map.put("endtNum", endNum);
			return map;
		}


	public Map<String, Object> wholeFeed(int page, String keyword, String email) throws Exception{
		int totalFeed = dao.selectAllCount(keyword, email);
		int startNum = 0;
		int endNum = 0;
		if (page==1){
			startNum = 1;
			endNum = 12;  //데이터를 10개씩 가져오겠다.
		}else{
			startNum = page+(11*(page-1));  //10개씩 가져오고싶다면  9로 
			endNum = page*12;   //20, 40, 60
			if(startNum>totalFeed) {
				return null;
			}else if(endNum>totalFeed) {
				endNum = totalFeed;
			}
		}

		if(keyword!=null) {
			keyword = "%"+keyword+"%";
		}
		List<FeedDTO> list = (List<FeedDTO>)dao.selectAll(keyword, startNum, endNum, email).get("list");
		System.out.println("service list : "+list.toString());
		List<Integer> rnum = (List<Integer>)dao.selectAll(keyword, startNum, endNum, email).get("rnum");
		List<String> cover = new ArrayList<>();//전체피드의 바둑판 대문사진

		//미디어리스트 체크
		for(FeedDTO tmp : list) {
			int feed_seq = tmp.getFeed_seq();
			List<String> media = dao.getMediaList(feed_seq);
			if(media.size()==0) { //이미지나 비디오가 없기 때문에 제목으로 커버를 만들어야되는 경우
				cover.add("<div class='cover' >"+tmp.getTitle()+"</div>");
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
		map.put("list", list);
		map.put("rnum", rnum);
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


	public Map<String, Object> scrapFeed(String email) throws Exception{
		List<FeedDTO> list = dao.scrapFeed(email);
		List<String> cover = new ArrayList<>();

		//미디어 체크
		for(FeedDTO tmp : list) {
			int feed_seq = tmp.getFeed_seq();
			List<String> media = dao.getMediaList(feed_seq);
			if(media.size()==0) {
				cover.add("<div class='cover' style='display:inline-block;'>"+tmp.getTitle()+"</div>");
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


	public FeedDTO detailView(int feed_seq) throws Exception{
		FeedDTO dto = dao.detailView(feed_seq);
		String contents = dto.getContents();
		String hashtags = dto.getHashtag();

		if(hashtags!=null) {
			String[] hashtag = hashtags.split(","); //해쉬태그들을 ,로 연결시켜놨음
			for(int i=0; i<hashtag.length; i++) {
				System.out.println(hashtag[i]); 
				//피드의 내용에 해쉬태그가 있을 경우 눌렀을 때 전체피드에서 그 키워들 검색하는 a태그를 붙여줌
				contents = contents.replace(hashtag[i], "<a href=\"wholeFeed?keyword=%23"+hashtag[i].replace("#", "")+"\">"+hashtag[i]+"</a>");
			}
		}
		dto.setContents(contents);
		return dto;
	}

	public List<FeedDTO> getFriendFeed(int page, String email) throws Exception{
		System.out.println("service page: "+page);
		System.out.println("service email:"+ email);
		int totalFeed = dao.getFriendFeedCount(email);
		int startNum = 0;
		int endNum = 0;
		if (page==1){
			startNum = 1;
			endNum = 10;  //데이터를 10개씩 가져오겠다.
		}else{
			startNum = page+(9*(page-1));  //10개씩 가져오고싶다면 19->9로 
			endNum = page*10;   //20, 40, 60
			if(startNum>totalFeed) {
				return null;
			}else if(endNum>totalFeed) {
				endNum = totalFeed;
			}
		}
		System.out.println();
		List<FeedDTO> list = dao.getFriendFeed(email, startNum, endNum);
		System.out.println("email확인 : " + email);
		System.out.println("service getFriendFeed size : "+list.size());
		System.out.println("service startNum: "+startNum);
		System.out.println("service endNum: "+endNum);
		for(int z=0; z<list.size(); z++) {
			FeedDTO dto = list.get(z);
			String contents = dto.getContents();
			String hashtags = dto.getHashtag();

			if(hashtags!=null) {
				String[] hashtag = hashtags.split(","); //해쉬태그들을 ,로 연결시켜놨음
				for(int i=0; i<hashtag.length; i++) {
					System.out.println(hashtag[i]); 
					//피드의 내용에 해쉬태그가 있을 경우 눌렀을 때 전체피드에서 그 키워들 검색하는 a태그를 붙여줌
					contents = contents.replace(hashtag[i], "<a href=\"wholeFeed?keyword=%23"+hashtag[i].replace("#", "")+"\">"+hashtag[i]+"</a>");
				}
			}
			dto.setContents(contents);
			list.set(z, dto);
		}
		return list;
	}




	//controller-detailView에서 media 목록을 얻기 위한 service
	public List<String> getMediaList(int feed_seq) throws Exception{
		List<String> list = dao.getMediaList(feed_seq);
		System.out.println("service list : "+list.toString());

		if(list.size()==0) {
			System.out.println("title입력");
//			String title = dao.getTitle(feed_seq);
//			list.add("<div class='cover' style=\"display:inline-block;text-align:center;font-size:70px;padding-top:200px;word-break:break-all\">"+title+"</div>");
		}else {
			System.out.println("list size = "+list.size());
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).endsWith("mp4")) { //파일이 동영상일 경우
					System.out.println("파일이 동영상입니다.");
					String video = "<video class='cover' style=\"height:100%;size:20px;text-align:center;vertical-align:center\" src=\""+list.get(i)+"\">";
					list.set(i, video);
				}else {//파일이 이미지
					System.out.println("파일이 이미지입니다.");
					String img = "<img class='cover' style=\"height:100%;size:20px;text-align:center;vertical-align:center\" src=\""+list.get(i)+"\">";
					list.set(i, img);
				}
			}
		}
		return list;
	}
	
	//controller-detailView에서 media 목록을 얻기 위한 service(친구를 위한)
	public List<String> getMediaListForFriendFeed(int feed_seq) throws Exception{
	List<String> list = dao.getMediaList(feed_seq);
	System.out.println("service list : "+list.toString());

	if(list.size()==0) {
		
	}else {
		System.out.println("list size = "+list.size());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).endsWith("mp4")) { //파일이 동영상일 경우
				System.out.println("파일이 동영상입니다.");
				String video = "<video class='cover' src=\""+list.get(i)+"\">";
				list.set(i, video);
			}else {//파일이 이미지
				System.out.println("파일이 이미지입니다.");
				String img = "<img class='cover' src=\""+list.get(i)+"\">";
				list.set(i, img);
			}
		}
	}
	return list;
}

	//controller-detailView에서 profile_img 목록을 얻기 위한 service
	public String getProfile_img(String email) throws Exception{
		String profile_img = dao.getProfile_img(email);
		return profile_img = "<img src=\"" +profile_img + "\">";
	}

	//신고 
	public List<Integer> getDeclare(String from_id) throws Exception{
		return dao.getDeclareFeed(from_id);
	}


	//-----------좋아요 & 스크랩----------------------------	

	//feed_seq에 해당하는 게시글을 나의 email이 좋아요를 눌렀는지 확인
	public int likeCheck(int feed_seq, String email) throws Exception{
		int result = dao.likeCheck(feed_seq, email);
		return result;
	}
	//feed_seq에 해당하는 게시글을 나의 email이 스크랩했는지 확인
	public int bookmarkCheck(int feed_seq, String email) throws Exception{
		int result = dao.bookmarkCheck(feed_seq, email);
		return result;
	}

	//좋아요를 눌렀을때
	@Transactional
	public int insertLike(int feed_seq, String email) throws Exception{
		int like_seq = dao.getLikeSeq();
		int result = dao.insertLike(like_seq, feed_seq, email);
		String receiverEmail = aldao.alarmReceiver(feed_seq);	//--- 좋아요 당한 사람 찾기
		aldao.alarmLike(like_seq, receiverEmail); 				//--- 좋아요 알림 추가
		return result;
	}
	public int deleteLike(int feed_seq, String email) throws Exception{
		int result = dao.deleteLike(feed_seq, email);
		return result;
	}

	//스크랩을 눌렀을때
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
		replyDAO.registerReply(dto);
		String receiverEmail = aldao.alarmReceiver(dto.getFeed_seq());	//--- 댓글 주인 찾기
		aldao.alarmReply(reply_seq, receiverEmail);						//--- 댓글 알림 추가
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", dto.getEmail());
		map.put("contents", dto.getContents());
		map.put("reply_seq", dto.getReply_seq());
		map.put("parent", dto.getParent());
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
	public int updateReply(ReplyDTO dto)throws Exception{
		int result = replyDAO.updateReply(dto);
		return result;
	}

}