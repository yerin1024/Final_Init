package kh.init.feeds;
import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;



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
		int result = dao.registerFeed(dto);
		File path = new File(mediaPath);
		if(mediaList!=null||!(path.exists())) {
			path.mkdir();
		}
		for(int i=0; i<mediaList.size(); i++) {
			System.out.println("mediaList("+i+") -"+mediaList.get(i)+" register");
			
			//파일복사 코드 추가하기
			File fromFile = new File(realPath+mediaList.get(i));
			
			File toFile = new File(realPath+mediaList.get(i).replace("Tmp", ""));
			fromFile.renameTo(toFile);
			
			fromFile.delete();
			
			dao.registerMedia(feed_seq, mediaList.get(i).replace("Tmp", ""));
		}
		
		return result;
	}

	public List<FeedDTO> selectAll() throws Exception{
		List<FeedDTO> list = dao.selectAll();
		return list;
	}

	public List<FeedDTO> wholeFeed() throws Exception{
		List<FeedDTO> list = dao.selectAll();
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
	
	public String mediaTmpUpload(MultipartFile file, String tmpPath) {
		
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
	public int registerReply(FeedDTO dto)throws Exception{
		int result = replyDAO.registerReply(dto);
		return result;
	}
	public int deleteReply(int reply_seq)throws Exception{
		int result = replyDAO.deleteReply("reply_seq",reply_seq);
		return result;
	}
	public List<ReplyDTO> viewReply(int feed_seq)throws Exception{
		List<ReplyDTO> list = replyDAO.viewReply(feed_seq);
		return list;
	}
}
