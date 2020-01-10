package kh.init.members;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;

	//로그인	
	@RequestMapping("/loginProc.do")
	public String toLogin(String email, String pw) {
		System.out.println("id : " + email);
		System.out.println("pw : " + pw);

		if(service.isLoginOk(email, pw) > 0) {
			session.setAttribute("loginInfo", email);
			return "main";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/findPw.do")
	public String toFindPw() {
		return "members/findPw";
	}
	
	@RequestMapping("/findPwProc.do")
	public String toFindPwProc(String email) {
		
		String host     = "smtp.naver.com";
	    String user   = "init_manager";
	    String password  = "initmanager6";
	    String to     = email;
	    
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		    try {
		        MimeMessage msg = new MimeMessage(session);
		        msg.setFrom(new InternetAddress(user));
		        msg.setRecipients(Message.RecipientType.TO,
		                          to);
		        msg.setSubject("비밀번호 찾기 테스트");
		        msg.setText("비밀번호 찾자찾자\n");
		        Transport.send(msg);
		        System.out.println("message sent successfully...");
		    } catch (MessagingException mex) {
		        System.out.println("send failed, exception: " + mex);
		    }
		    
		   return "main"; 
//		    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//		     protected PasswordAuthentication getPasswordAuthentication() {
//		      return new PasswordAuthentication(user, password);
//		     }
//		    });
//
//		    // Compose the message
//		    try {
//		     MimeMessage message = new MimeMessage(session);
//		     message.setFrom(new InternetAddress(user));
//		     message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//
//		     // Subject
//		     message.setSubject("[Subject] Java Mail Test");
//		     
//		     // Text
//		     message.setText("Simple mail test..");
//
//		     // send the message
//		     Transport.send(message);
//		     System.out.println("message sent successfully...");
//
//		    } catch (MessagingException e) {
//		     e.printStackTrace();
//		    }
	}
	
	@RequestMapping("/goMyInfo")
	public String goMyInfo() {
		System.out.println("개인 정보 CON 도착.");
		return "myInformation";
	}

	@RequestMapping(value = "/getMyPage", produces ="text/html; charset=utf-8")
	public String getMyPage() {
		System.out.println("마이페이지 CON 도착.");
		ModelAndView mav = new ModelAndView();
		try {
			MemberDTO dto = service.getMyPageService((String)session.getAttribute("loginInfo"));

			mav.addObject("dto",dto);

			return "good";
		}catch(Exception e) {
			e.printStackTrace();
			return "job";
		}
	}
	@RequestMapping("/withdrawMem")
	public String getout() {
		System.out.println("회원 탈퇴 CON 도착.");
		try {
			int result = service.withdrawMemService("kks@naver.com");
			if(result> 0) {
				session.invalidate();
				System.out.println("회원탈퇴 성공하셨슴당.");
				return "";
			}else {
				System.out.println("회원탈퇴 실패하셨슴당.");
				return "goodjob";
			}


		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "home";
		}


	}

	@RequestMapping("/changeMyInfo")
	public String changeInfo(String pw,String name,String phone) {
		System.out.println("회원 정보 수정 CON 도착.");
		try {
			MemberDTO dto = new MemberDTO();

			int result = service.changeMyInfoService((String)session.getAttribute("loginInfo"), dto);
			if(result> 0) {

				System.out.println("정보변경에 성공하셨슴당.");
				return "home";
			}else {
				System.out.println("정보변경에 실패하셨슴당.");
				return "home";
			}


		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "redirect:home";
		}
	} 
}
