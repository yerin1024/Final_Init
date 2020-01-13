package kh.init.feeds;
import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;



@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	@Autowired
	private ReplyDAO replyDAO;

	@Transactional
	public int registerFeed(FeedDTO dto, List<String> mediaList) throws Exception{
		int result = dao.registerFeed(dto);
		//tmp폴더에 있는 파일들 옮기는 DAO작업 와야함 
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
		return list;
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
		return "/mediaTmp/"+sysName;
	}
	
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
	public int updateReply(ReplyDTO dto)throws Exception{
		int result = replyDAO.updateReply(dto);
		return result;
	}
}
