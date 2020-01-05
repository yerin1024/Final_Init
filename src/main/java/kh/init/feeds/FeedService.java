package kh.init.feeds;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;

	public int registerFeed(FeedDTO dto, String vPath) {
		//김세원 이미지파일작업한 contents가 오고

		String contents = dto.getContents();
		MultipartFile[] files = dto.getFiles();
		File videoPath = new File(vPath);
		if(!(videoPath.exists())) {
			videoPath.mkdir();
		}
		int result = 0;
		try {
			for(MultipartFile file : files) {
				String sysName = System.currentTimeMillis()+"_"+file.getOriginalFilename();
				String videoSrc =  "videoFiles/"+sysName;
				file.transferTo(new File(videoPath+"/"+sysName));
				String videoTag = "<video src=\""+videoSrc+"\" controls>";
				contents = contents+videoTag;
			}

			dto.setContents(contents);

			result =  dao.registerFeed(dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<FeedDTO> selectAll() throws Exception{
		List<FeedDTO> list = dao.selectAll();
		return list;
	}
	
	public FeedDTO detailView(String feed_seq) throws Exception{
		FeedDTO dto = dao.detailView(feed_seq);
		return dto;
	}
}
