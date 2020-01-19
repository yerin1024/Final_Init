package kh.init.members;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

@RequestMapping("/guest")
@Controller
public class GuestController {

	@Autowired
	private GuestService service;

	@Autowired
	private MemberService serviceMember;

	@Autowired
	private HttpSession session;

	//	JsonObject obj = new JsonObject();

	//회원가입	페이지 로드
	@RequestMapping("/signUp.do")
	public String toSignUp(Model model) {
		return "members/signUp";
	}

	//회원가입	처리(신규회원 추가)
	@RequestMapping("/signUpProc.do")
	public String toSignUpProc(MemberDTO dto, MultipartFile profileImg, Model model) {
		System.out.println("가입 요청 정보 : " + dto.toString());
		String path = session.getServletContext().getRealPath("files");
		if(profileImg.getOriginalFilename() == "") { //프로필 미등록 시
			dto.setId_type("E");
			service.insert(dto, null, path);
		}else { //프로필 등록 시 
			dto.setId_type("E");
			service.insert(dto, profileImg, path);
		}
		return "main";
	}

	//카카오 계정 회원가입처리(신규회원 추가)
	@RequestMapping(value="/kakaoSignup", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toSignUpKakao(String access_token, Model model) {
		session.setAttribute("accessToken", access_token);
		HashMap<String, Object> userInfo = serviceMember.getKakaoInfo(access_token);

		JsonObject obj = new JsonObject();
		obj.addProperty("kakaoProfile", (String) userInfo.get("profile_image"));
		obj.addProperty("user_id", (String) userInfo.get("user_id"));
		System.out.println("userInfo : " + userInfo);
		return obj.toString();
	}

	//카카오 계정 회원가입처리(신규회원 추가)
	@RequestMapping("/kakaoSignupProc")
	public String toSignUpKakaoProc(MemberDTO dto, MultipartFile profileImg, Model model) {
		System.out.println("가입 요청 정보 : " + dto.toString());
		String path = session.getServletContext().getRealPath("files");
		if(profileImg.getOriginalFilename() == "") { //프로필 미등록 시
			dto.setId_type("K");
			service.insert(dto, null, path);
		}else { //프로필 등록 시 
			dto.setId_type("K");
			service.insert(dto, profileImg, path);
		}
		return "main";
	}

	//이메일 중복확인
	@RequestMapping(value="/checkEmail.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckEmail(String email) {
		System.out.println("이메일 중복확인 : " + email);	

		JsonObject obj = new JsonObject();

		if(service.checkEmail(email) <= 0) { //사용 가능 이메일
			obj.addProperty("result", "available"); 
			return obj.toString();
		}else { //사용 불가 이메일
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}

	//닉네임 중복확인
	@RequestMapping(value="/checkNickname.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckNickname(String nickname) {

		System.out.println("닉네임 중복확인 : " + nickname);

		JsonObject obj = new JsonObject();

		if(service.checkNickname(nickname) <= 0) { //사용 가능 닉네임
			obj.addProperty("result", "available");
			return obj.toString();
		}else { //사용 불가 닉네임
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}

	//전화번호 중복확인
	@RequestMapping(value="/checkOverlap.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toCheckPhone(String phone) {

		System.out.println("전화번호 중복확인 : " + phone);

		JsonObject obj = new JsonObject();

		if(service.checkPhone(phone) <= 0) { //사용 가능 번호
			obj.addProperty("result", "available");
			return obj.toString();
		}else { //사용 불가 번호
			obj.addProperty("result", "unavailable");
			return obj.toString();
		}
	}

	//휴대폰 본인인증 인증번호 전송
	@RequestMapping(value="/sendVerifCode.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toSendVerifCode(String phone) {
		//		String ranNum = service.sendVerifCode(phone); //인증번호 생성
		//		session.setAttribute("verifyCode", ranNum);
		//		System.out.println("인증번호 생성 : " + ranNum);
		JsonObject obj = new JsonObject();
		obj.addProperty("result", "Verify Code sent");
		return obj.toString();
		//클라이언트에 넘기지 않고 서버로 다시 값 반환받아 처리 예정
	}

	@RequestMapping(value="/verifyUser.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toVerifyUser(String verifyCode) {

		JsonObject obj = new JsonObject();

		String originCode = (String)session.getAttribute("verifyCode");
		if(service.verifyUser(verifyCode, originCode)) {
			obj.addProperty("result", "verified");
		}else {
			obj.addProperty("result", "unverified");
		}
		return obj.toString();
	}	

	@RequestMapping(value="/removeVerifSession.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toRemoveVerifSession() {
		session.removeAttribute("verifyCode");
		JsonObject obj = new JsonObject();
		obj.addProperty("result", "Verif Code removed");
		return obj.toString();
	}	
}
