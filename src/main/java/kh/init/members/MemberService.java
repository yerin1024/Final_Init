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

	public String getAccessToken(String code) {
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			//    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			//    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=4f039db4ba705950489f1f29405d6c6c");
			sb.append("&redirect_uri=http://localhost/member/kakaoLoginProc");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			//    결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			//    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			//    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + accessToken);
			System.out.println("refresh_token : " + refreshToken);

			br.close();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return accessToken;
	}

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
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname =  properties.getAsJsonObject().get("nickname").getAsString();
			if(properties.getAsJsonObject().get("profile_image") != null) {
				profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
			}			
			
			String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
			String is_email_verified = kakaoAccount.getAsJsonObject().get("is_email_verified").getAsString();
			String birthday = kakaoAccount.getAsJsonObject().get("birthday").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("profile_image", profile_image);
			userInfo.put("email", email);
			userInfo.put("is_email_verified", is_email_verified);
			userInfo.put("birthday", birthday);	
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
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(manager));
			msg.setRecipients(Message.RecipientType.TO, to);
			msg.setSubject("[Init] 임시 비밀번호 발급 안내"); // 메일 타이틀
			msg.setContent(user + "님 Init 임시 비밀번호가 발급되었습니다." // 메일 내용
					+ "아래의 임시 비밀번호로 로그인 하신 후 반드시 비밀번호를 재설정하시기 바랍니다."
					+ "비밀번호 재설정은 MyFeed > 보안 설정 > 비민번호 변경 에서 가능합니다."
					+ "임시 비밀번호 : " + ranChar, "text/html");
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
