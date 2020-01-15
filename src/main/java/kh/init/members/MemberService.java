package kh.init.members;

import java.io.File;
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
		System.out.println("왜값이 안나와"+dto.getEmail());
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
