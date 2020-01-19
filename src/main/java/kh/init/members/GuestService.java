package kh.init.members;

import java.io.File;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.init.configuration.Configuration;
import kh.init.configuration.Utils;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class GuestService {

	@Autowired
	private MemberDAO dao;
	@Autowired
	private Configuration config;
	
	//회원가입 처리
	@Transactional("txManager")
	public int insert(MemberDTO dto, MultipartFile profile_img, String path) {
		File filePath = new File(path); 
		System.out.println(filePath);
		if(!filePath.exists()) {
			filePath.mkdir();
		}
		if(profile_img != null) { //사용자 프로필 사진 등록 시 이메일로 구분값 주어 사진 저장
			String profile =  "/files/" + dto.getEmail() + "_profile_img.jpg";
			dto.setProfile_img(profile);
			try {
				profile_img.transferTo(new File(path + "/" + dto.getEmail() + "_profile_img.jpg"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			dto.setPw(config.encrypt(dto.getPw())); //비밀번호 encryption 적용
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao.insert(dto);
	}
	
	//이메일 중복확인
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	//닉네임 중복확인
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}
	
	//전화번호 중복확인
	public int checkPhone(String phone) {
		return dao.checkPhone(phone);
	}
	
	//인증번호 전송 
	public String sendVerifCode(String phone) {
		String api_key = "NCSUEKNQT3HPHHH9";
		String api_secret = "ILQGY1OP8WXQE5ZZ42KAEXVFK5EWA4UZ";
		Message coolsms = new Message(api_key, api_secret);
		HashMap<String, String> set = new HashMap<String, String>();
		String ranNum = Utils.generateCertNum(); // 인증번호 생성
		JSONObject result = null;
		
        set.put("to", phone); // 수신번호
        set.put("from", "01051922972"); // 발신번호 
        set.put("text", "[Init] 인증번호는 [" + ranNum + "]입니다."); // 문자내용
        set.put("type", "sms"); // 문자 타입
        
        try {
			result = coolsms.send(set); // 전송
		} catch (CoolsmsException e) {
			e.printStackTrace();
		} // 보내기&전송결과받기
//        if (result.get("status") == true) {
//            // 메시지 보내기 성공 및 전송결과 출력
//            System.out.println("성공");            
//            System.out.println(result.get("group_id")); // 그룹아이디
//            System.out.println(result.get("result_code")); // 결과코드
//            System.out.println(result.get("result_message"));  // 결과 메시지
//            System.out.println(result.get("success_count")); // 메시지아이디
//            System.out.println(result.get("error_count"));  // 여러개 보낼시 오류난 메시지 수
//        } else {
//            // 메시지 보내기 실패
//            System.out.println("실패");
//            System.out.println(result.get("code")); // REST API 에러코드
//            System.out.println(result.get("message")); // 에러메시지
//        } 
        return ranNum;
    }
	
	public boolean verifyUser(String verifyCode, String originCode) {
		System.out.println("verifyCode : " + verifyCode );
		System.out.println("originCode : " + originCode);
		if(verifyCode.equals(originCode)) 
		return true;
		return false;
	}
	
	public String getProfile(String email) {
		return dao.getProfile(email);
	}
}
