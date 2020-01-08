package kh.init.feeds;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;



@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	
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
	public int deleteFeed(String seq)throws Exception{
		int result = dao.deleteFeed(seq);
		return result;
	}
	public int modifyFeed(FeedDTO dto)throws Exception{
		int result = dao.modifyFeed(dto);
		return result;
	}
	public FeedDTO detailView(String feed_seq) throws Exception{
		FeedDTO dto = dao.detailView(feed_seq);
		return dto;
	}
	
	public List<String> getMediaList(String feed_seq) throws Exception{
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
}
