package kh.init.feeds;

import java.io.File;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class GarbageDeleteScheduler {
    /*
     * 5초 마다 실행
     */
//    @Scheduled(fixedDelay=5000)
//    public void init() {
//        System.out.println("init");
//        String path = "C:\\SpringWorkspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Init\\mediaTmp";
//    	File folder = new File(path);
//        while(folder.exists()) {
//    		File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
//    				
//    		for (int j = 0; j < folder_list.length; j++) {
//    			folder_list[j].delete(); //파일 삭제 
//    			System.out.println("파일이 삭제되었습니다.");		
//    		}
//        }
//    }
	//매일 밤 10시 tmp폴더에 있는 파일 삭제
    @Scheduled(cron="0 00 22 * * ?")
    public void download() {
    	System.out.println("init");
        String path = "C:\\SpringWorkspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Init\\mediaTmp";
    	File folder = new File(path);
        while(folder.exists()) {
    		File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
    				
    		for (int j = 0; j < folder_list.length; j++) {
    			folder_list[j].delete(); //파일 삭제 
    			System.out.println("파일이 삭제되었습니다.");		
    		}
        }
    }
}
