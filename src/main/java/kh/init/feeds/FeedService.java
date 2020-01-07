package kh.init.feeds;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;



@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	public int registerFeed(FeedDTO dto,String iPath,String vPath) {
		File filePath = new File(iPath);
		String contents=dto.getContents();
		String imageTag = "";
		String videoTag = "";
		if(!filePath.exists()) {
			filePath.mkdir();
		}
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(dto.getContents());
		
		while(m.find()) {
			String oriName = m.group(2);
			String sysName = System.currentTimeMillis() + "_" + oriName ;
			System.out.println(oriName);
			System.out.println(sysName);
			String imgString = m.group(1).split(",")[1];
			byte[] imgBytes = Base64Utils.decodeFromString(imgString);
			
			
			try {
				FileOutputStream fos = new FileOutputStream(iPath + "/" + sysName);
				DataOutputStream dos = new DataOutputStream(fos);
				dos.write(imgBytes);
				dos.flush();
				dos.close();
				contents = dto.getContents().replaceFirst(Pattern.quote(m.group(1)), "imageFiles/"+sysName);
				dto.setContents(contents);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		Pattern p1 = Pattern.compile(".*?(<img.*?>).*?");
		Matcher m1 = p1.matcher(dto.getContents());
		while(m1.find()) {
			System.out.println(m1.group(1));
			imageTag+=m1.group(1);
			contents = contents.replaceFirst(Pattern.quote(m1.group(1)), "");
		}

		MultipartFile[] files = dto.getFiles();
		File videoPath = new File(vPath);
		if(!(videoPath.exists())) {
			videoPath.mkdir();
		}
		int result = 0;
		try {
			if(files.length!=0) {
				for(MultipartFile file : files) {
					String sysName = System.currentTimeMillis()+"_"+file.getOriginalFilename();
					String videoSrc =  "videoFiles/"+sysName;
					file.transferTo(new File(videoPath+"/"+sysName));
					String videotag = "<video src=\""+videoSrc+"\" controls>";
					videoTag+=videotag;
				}
				System.out.println(imageTag);
				System.out.println(videoTag);
				dto.setImage(imageTag);
				dto.setVideo(videoTag);
				dto.setContents(contents);
			}
			result = dao.registerFeed(dto);
		}catch(Exception e) {
			e.printStackTrace();
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
		String contents = dto.getContents();
		List<String> tags = new ArrayList<>();
		
		Pattern p = Pattern.compile(".*?(<img.*?>).*?");
		Matcher m = p.matcher(contents);
		while(m.find()) {
			tags.add(m.group(1));
			contents = contents.replaceFirst(Pattern.quote(m.group(1)), "");
		}
		
		Pattern p1 = Pattern.compile(".*?(<video.*?>).*?");
		Matcher m1 = p1.matcher(contents);
		while(m1.find()) {
			tags.add(m1.group(1));
			contents = contents.replaceFirst(Pattern.quote(m1.group(1)), "");
		}
		
		System.out.println("tag정리후 : "+contents);
		String tagss="";
		
		for(int i=0; i<tags.size(); i++) {
			if(i==0) {
				tagss+="<div class='carousel-item active'>"+tags.get(i)+"</div>";
			}
			tagss+="<div class='carousel-item'>"+tags.get(i)+"</div>";
		}
		tagss="<div class=\"carousel-inner\">"+tagss;
		tagss="<div id=\"carouselExampleControls\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"false\">"+tagss;
		tagss=tagss+"</div>";
		String anker = "<a class=\"carousel-control-prev\" href=\"#carouselExampleControls\" role=\"button\" data-slide=\"prev\">";
		anker+="<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>";
		anker+="<span class=\"sr-only\">Previous</span></a>";
		anker+="<a class=\"carousel-control-next\" href=\"#carouselExampleControls\" role=\"button\" data-slide=\"next\">";
		anker+="<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\r\n<span class=\"sr-only\">Next</span></a>";
		anker+="</div>";
		tagss+=anker;
		contents = tagss+contents;
		dto.setContents(contents);
//		System.out.println(tags.size());
//		System.out.println(contents);
		return dto;
	}
}
