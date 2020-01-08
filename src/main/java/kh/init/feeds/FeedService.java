package kh.init.feeds;
import java.io.File;
import java.util.List;

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
	public int deleteFeed(ReplyDTO dto)throws Exception{
		int result = dao.deleteFeed(dto);
		return result;
	}
	public int deleteFeedAndReply(ReplyDTO dto)throws Exception{
		int result = replyDAO.deleteFeedAndReply(dto);
		return result;
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
	
	public int registerReply(FeedDTO dto)throws Exception{
		int result = replyDAO.registerReply(dto);
		return result;
	}
	public int deleteReply(ReplyDTO dto)throws Exception{
		int result = replyDAO.deleteReply(dto);
		return result;
	}
	public List<ReplyDTO> viewReply(int feed_seq)throws Exception{
		List<ReplyDTO> list = replyDAO.viewReply(feed_seq);
		return list;
	}
}
