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
		String manager = "init_manager"; // 관리자 이메일 아이디
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
		String contents= "<!DOCTYPE html>\r\n" + 
				"<html lang='en'>\r\n" + 
				"<head>\r\n" + 
				"    <meta charset='UTF-8'>\r\n" + 
				"    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\r\n" + 
				"    <meta http-equiv='X-UA-Compatible' content='ie=edge'>\r\n" + 
				"    <title>Document</title>\r\n" + 
				"    <link href='https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap' rel='stylesheet'>\r\n" + 
				"</head>\r\n" + 
				"<style>\r\n" + 
				"*{\r\n" + 
				"    font-family: 'Noto Sans KR'\r\n" + 
				"}\r\n" + 
				".pwDiv{\r\n" + 
				"    border:1px solid grey;\r\n" + 
				"    border-radius: 10px;\r\n" + 
				"    margin:15px;\r\n" + 
				"    padding: 10px;\r\n" + 
				"}\r\n" + 
				"a{\r\n" + 
				"    text-decoration-line: none;\r\n" + 
				"}\r\n" + 
				"</style>\r\n" + 
				"<body>\r\n" + 
				"    <div style='width:100%'>\r\n" + 
				"        <div style='max-width:600px;margin:0 auto;font-family:Roboto,Arial,Helvetica,sans-serif;font-size:16px;line-height:1.5;border:1px solid #e2e2e2'>\r\n" + 
				"          <div align='center' style='padding:30px;background-color:#34558b;' class='logo-area'>\r\n" + 
				"            <p style='font-size:80px;color:white;font-weight:bold;margin:0px;letter-spacing:10px;'>In;t</p>\r\n" + 
				"          </div>\r\n" + 
				"          <div style='max-width:90%;margin-left:auto;margin-right:auto;margin-top:40px' class='nomal-paragraph'>\r\n" + 
				"            <div style='margin-top:20px'>\r\n" + 
				"                <p style='text-align: center;font-size:20px;'><strong>[Init] 임시 비밀번호 발급 안내</strong></p>\r\n" + 
				"                <hr style='border:0;border-top:solid 1px #e2e2e2;width:90%;margin:30px auto' class='horizontal-line'>\r\n" + 
				"                <br>" + user + "님 Init 임시 비밀번호가 발급되었습니다.\r\n" + 
				"                <div class='pwDiv'>\r\n" + 
				"                    <p style='height:30px;line-height:30px;font-weight:bold;'> 임시 비밀번호 : " + ranChar + "</p>\r\n" + 
				"                </div>\r\n" + 
				"                <br>임시 비밀번호로 로그인 후 반드시 비밀번호를 재설정하여 사용하시기 바랍니다.\r\n" + 
				"                <br>비밀번호 재설정은 <strong>'MyFeed > 회원정보 > 비밀번호 변경'</strong> 에서 가능합니다.\r\n" + 
				"            </div>\r\n" + 
				"          </div>\r\n" + 
				"          <hr style='border:0;border-top:solid 1px #e2e2e2;width:90%;margin:30px auto' class='horizontal-line'>\r\n" + 
				"          <div style='display:flex;max-width:90%;margin-left:auto;margin-right:auto;margin-top:40px' class='nomal-paragraph'>\r\n" + 
				"            <div style='margin-top:20px;width:20%;border-right:1px solid grey;'>\r\n" + 
				"                 <img src='/resources/images/logo.png' style='width:80%;'>\r\n" + 
				"                </div>\r\n" + 
				"            <div style='margin-left:22px;margin-top:20px;width:80%;'>\r\n" + 
				"            본 메일은 사용자 요청에 의한 발신전용 메일이오니 문의사항이 있으시면 <a href='/localhost/main' style='font-weight:600;color:#34558b;'>고객센터</a>로 문의하여 주시기 바랍니다.\r\n" + 
				"            </div>\r\n" + 
				"          </div>\r\n" + 
				"          <div align='center' style='padding-top:40px;padding-right:10px;padding-bottom:10px;padding-left:10px;margin-bottom:30px;'>\r\n" + 
				"            <a href='/localhost/main' style='display: inline-block; color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border-radius: 60px; width: auto; border-width: 1px; border-style: solid; border-color: rgb(0, 0, 0); padding: 10px 25px;' target='_blank'>Init 바로가기</a>\r\n" + 
				"          </div>      \r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(manager));
			msg.setRecipients(Message.RecipientType.TO, to);
			msg.setSubject("[Init] 임시 비밀번호 발급 안내"); // 메일 타이틀
			msg.setContent(contents, "text/html;charset=UTF-8");
			Transport.send(msg); // 메일 전송
		} catch (MessagingException mex) {
			System.out.println("send failed, exception: " + mex);
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
