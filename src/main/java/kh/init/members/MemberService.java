package kh.init.members;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.init.configuration.Configuration;
import kh.init.configuration.Utils;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	// 로그인 유효성 검사
	public int isLoginOk(String email, String pw) {
		try {
			pw = Configuration.encrypt(pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao.isLoginOk(email, pw);
	}

	//카카오 로그인 access_token 이용해 userId, profile 사진 뽑기 
	public HashMap<String, Object> getKakaoInfo(String access_Token){

		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			String profile_image = "none";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			JsonObject profile = kakaoAccount.getAsJsonObject().get("profile").getAsJsonObject();
			
			String user_id = element.getAsJsonObject().get("id").getAsString();
		
			if(profile.getAsJsonObject().get("profile_image_url") != null) {
				profile_image = profile.getAsJsonObject().get("profile_image_url").getAsString();
			}			
			
			userInfo.put("user_id", user_id);
			userInfo.put("profile_image", profile_image);
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return userInfo;				
	}
	
	public void kakaoLogout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result = "";
			String line = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}

	public MemberDTO getMemberDTO(String email) {
		MemberDTO dto;
		try {
			dto = dao.getMyInfo(email);
			return dto;	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 비밀번호 찾기 이메일 임시비밀번호 전송
	@Transactional("txManager")
	public String findPw(String email) {
		if(dao.checkEmail(email) < 1) { // 이메일 유효 여부 확인
			return "invalid";
		}
		// 자바 메일 
		String host = "smtp.naver.com";
		String manager = "init_manager@naver.com"; // 관리자 이메일 아이디
		String password = "initmanager6"; // 관리자 이메일 pw
		String to = email; // 사용자 이메일
		String ranChar = Utils.generateCertChar(); // 임시 비밀번호 생성
		String user = null;
		try {
			user = dao.getMyInfo(email).getName();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try { // 임시 비밀번호로 DB 변경
			dao.resetPw(email, Configuration.encrypt(ranChar));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
				
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(manager, password);
			}
		});		
		
		String contents= "<div style='width:100%'>\r\n" + 
				"        <div style='max-width:600px;margin:0 auto;font-family:Roboto,Arial,Helvetica,sans-serif;font-size:16px;line-height:1.5;border:1px solid #e2e2e2'>\r\n" + 
				"          <div align='center' style='padding:30px;background-color:#34558b;' class='logo-area'>\r\n" + 
				"            <p style='font-size:80px;color:white;font-weight:bold;margin:0px;letter-spacing:10px;'>In;t</p>\r\n" + 
				"          </div>\r\n" + 
				"          <div style='max-width:90%;margin-left:auto;margin-right:auto;margin-top:40px' class='nomal-paragraph'>\r\n" + 
				"            <div style='margin-top:20px'>\r\n" + 
				"                <p style='text-align: center;font-size:20px;'><strong>[Init] 임시 비밀번호 발급 안내</strong></p>\r\n" + 
				"                <hr style='border:0;border-top:solid 1px #e2e2e2;width:90%;margin:30px auto' class='horizontal-line'>\r\n" + 
				"                <br>"+ user +"님 Init 임시 비밀번호가 발급되었습니다.\r\n" + 
				"                <div class='pwDiv' style='border:1px solid grey;border-radius: 10px;margin:15px;padding: 10px;'>\r\n" + 
				"                    <p style='height:30px;line-height:30px;font-weight:bold;'> 임시 비밀번호 :" + ranChar + "</p>\r\n" + 
				"                </div>\r\n" + 
				"                <br>임시 비밀번호로 로그인 후 반드시 비밀번호를 재설정하여 사용하시기 바랍니다.\r\n" + 
				"                <br>비밀번호 재설정은 <strong>'MyFeed > 회원정보 > 비밀번호 변경'</strong> 에서 가능합니다.\r\n" + 
				"            </div>\r\n" + 
				"          </div>\r\n" + 
				"          <hr style='border:0;border-top:solid 1px #e2e2e2;width:90%;margin:30px auto' class='horizontal-line'>\r\n" + 
				"          <div style='display:flex;max-width:90%;margin-left:auto;margin-right:auto;margin-top:40px' class='nomal-paragraph'>\r\n" + 
				"            <div style='margin-top:20px;width:20%;border-right:1px solid grey;'>\r\n" + 
				"                 <img src='data:image/png;base64,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' style='width:80%;'>\r\n" + 
				"                </div>\r\n" + 
				"            <div style='margin-left:22px;margin-top:20px;width:80%;'>\r\n" + 
				"            본 메일은 사용자 요청에 의한 발신전용 메일이오니 문의사항이 있으시면 <a href='http://192.168.60.13/main' style='font-weight:600;color:#34558b;text-decoration-line:none;'>고객센터</a>로 문의하여 주시기 바랍니다.\r\n" + 
				"            </div>\r\n" + 
				"          </div>\r\n" + 
				"          <div align='center' style='padding-top:40px;padding-right:10px;padding-bottom:10px;padding-left:10px;margin-bottom:30px;'>\r\n" + 
				"            <a href='http://192.168.60.13/main' style='display:inline-block;text-decoration-line:none;color:rgb(255, 255, 255); background-color: rgb(0, 0, 0); border-radius: 60px; width: auto; border-width: 1px; border-style: solid; border-color: rgb(0, 0, 0); padding: 10px 25px;' target='_blank'>Init 바로가기</a>\r\n" + 
				"          </div>      \r\n" + 
				"        </div>\r\n" + 
				"      </div>";
		try {			
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(manager));
			msg.setRecipients(Message.RecipientType.TO, to);
			msg.setSubject("[Init] 임시 비밀번호 발급 안내"); // 메일 타이틀
			msg.setContent(contents, "text/html;charset=UTF-8");
			try {
				Transport.send(msg); // 메일 전송
			}catch(Exception e) {				
				e.printStackTrace();
				return "error occured";
			}									
		} catch (MessagingException mex) {
			System.out.println("send failed, exception: " + mex);
			return "invalid";
		}
		return ranChar;
	}

	@Transactional("txManager")
	public MemberDTO getMyPageService(String email) throws Exception{
		System.out.println(email);
		MemberDTO dto = dao.getMyInfo(email);
		return dto;		
	}

	//회원 탈퇴
	@Transactional("txManager")
	public int withdrawMemService(String email) throws Exception {

		System.out.println("회원 탈퇴 입력된 값은 "+ email);
		int result = dao.withdrawMem(email);
		return result;

	}
	
	//내 정보 변경하기
	@Transactional("txManager")
	public int changeMyInfoService(String id,MemberDTO dto) throws Exception {
		int result = dao.changeMyInfo(id,dto);
		return result;
	}
	
	//내 비밀번호 변경
	public int changePw(String email, String pw) throws Exception{
		int result = dao.changePw(email, Configuration.encrypt(pw));
		return result;
	}
	
	//내 프로필 변경하기
	@Transactional("txManager")
	public int changeMyProfileService(String id,MemberDTO dto,MultipartFile profile_img, String path) throws Exception {
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdir();
		}
		System.out.println(profile_img);
		if(profile_img != null) {		
			String profile =  "/files/" + dto.getEmail() + "_profile_img.jpg";
			dto.setProfile_img(profile);
			try {
				profile_img.transferTo(new File(path + "/" + dto.getEmail() + "_profile_img.jpg"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		int result = dao.changeMyInfo(id,dto);
		return result;

	}

	public MemberDTO identifyMemPwService(String email) throws Exception{

		MemberDTO dto = dao.getMyInfo(email);
		return dto;
	}
}
