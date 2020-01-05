package kh.init.feeds;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

@Service
public class FeedService {
	@Autowired
	private FeedDAO dao;
	
	public int registerFeed(FeedDTO dto,String iPath,String vPath) {
		File filePath = new File(iPath);
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
				String contents = dto.getContents().replaceFirst(Pattern.quote(m.group(1)), "/files/"+sysName);
				dto.setContents(contents);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dao.registerFeed(dto);
	}
	
}
