package kh.init.members;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.init.configuration.Configuration;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	
	//관리자 로그인 유효성 감시
	@RequestMapping("/adminLoginProc.do")
	public String toadminLogin(String email, String pw) {
		if(email != null && pw != null) {
			System.out.println("로그인 시도 : " + email);		
			if(service.isLoginOk(email, pw) > 0) { // 로그인 허가
				session.setAttribute("loginInfo", service.getMemberDTO(email)); // 세션 로그인정보 담기
				return "redirect:/admin/memberList.do";
			}else {
				return "redirect:/adminHome";
			}
		}else {
			System.out.println("'email input' or 'pw input' is detected as null.");
			return "adminHome";
		}
	}
	
	// 로그인	유효성 검사
	@RequestMapping("/loginProc.do")
	public String toLogin(String email, String pw) {
		if(email != null && pw != null) {
			System.out.println("로그인 시도 : " + email);		
			if(service.isLoginOk(email, pw) > 0) { // 로그인 허가
				session.setAttribute("loginInfo", service.getMemberDTO(email)); // 세션 로그인정보 담기
				return "redirect:/feed/getFriendFeed";
			}else {
				return "main";
			}
		}else {
			System.out.println("'email input' or 'pw input' is detected as null.");
			return "main";
		}
	}
	
	// 로그인	유효성 검사
	@RequestMapping(value="/kakaoLoginProc", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String toKaKaoLogin(String access_token) {		
		session.setAttribute("accessToken", access_token); //access_token 세션 저장
		HashMap<String, Object> userInfo = service.getKakaoInfo(access_token); //access_token 이용해 정보 얻기
		session.setAttribute("loginInfo", service.getMemberDTO((String) userInfo.get("user_id"))); //카카오 사용자 loginInfo 세션 셋팅
		
		JsonObject obj = new JsonObject();
		obj.addProperty("result", "loginSuccess");
		return obj.toString();
	}

	// 로그아웃 세션 삭제
	@RequestMapping("/logout.do")
	public String toLogout() {
		if(session.getAttribute("accessToken") != null) {
			session.removeAttribute("accessToken");
			System.out.println("카카오 세션 삭제 완료");
		}
		System.out.println("로그아웃 > " + session.getAttribute("loginInfo").toString() + " 세션 삭제");
		session.removeAttribute("loginInfo");
		System.out.println("로그아웃 실시 > 로그인 세션 삭제 완료");
		return "redirect:/main";
	}

	// 비밀번호 찾기
	@RequestMapping("/findPwProc.do")
	@ResponseBody
	public String toFindPwProc(String email) {
		System.out.println("사용자 이메일  : " + email);
		JsonObject obj = new JsonObject();
		
		String result = service.findPw(email);
		if(result == "invalid") {
			obj.addProperty("result", "invalid");
		}else if(result == "error occured"){
			obj.addProperty("result", "error");
		}else {
			obj.addProperty("result", "success");
			obj.addProperty("email", email);
		}
		return obj.toString();		    
	}

	@RequestMapping(value="/goMyInfo", produces="text/html;charset=UTF-8")  //내 정보 (편집) 가기
	@ResponseBody
	public String goMyInfo(String email) {
		System.out.println("개인 정보 CON 도착.");
		
		MemberDTO mDto = (MemberDTO)session.getAttribute("loginInfo");
		String emailResult =mDto.getEmail().replace("@", "%40");
		System.out.println("고인포 : "+ emailResult);
		try {			
			MemberDTO dto = service.getMyPageService(mDto.getEmail());
			System.out.println(dto.getEmail());
			System.out.println(dto.getName());
			String poption1 = dto.getPhone().substring(0, 4);
			String poption2 = dto.getPhone().substring(3, 7);
			String poption3 = dto.getPhone().substring(7, 11);
			String boption1 = dto.getBirth().substring(0, 4);
			String boption2 = dto.getBirth().substring(5, 6);
			String boption3 = dto.getBirth().substring(6, 8);
			JsonObject obj = new JsonObject();
			Gson g = new Gson();
			obj.addProperty("dto", g.toJson(dto));
			obj.addProperty("poption1", poption1);
			obj.addProperty("poption2", poption2);
			obj.addProperty("poption3", poption3);
			obj.addProperty("boption1", boption1);
			obj.addProperty("boption2", boption2);
			obj.addProperty("boption3", boption3);
			
			System.out.println(obj.toString());
			return obj.toString();
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value="/goMyProfile", produces="text/html;charset=UTF-8") //내 프로필(편집) 가기
	@ResponseBody
	public String goMyProfile(String email) {
		System.out.println("개인 프로필 수정 CON 도착.");
		try {
			MemberDTO mDto = (MemberDTO)session.getAttribute("loginInfo");
			MemberDTO dto = service.getMyPageService(mDto.getEmail());
			System.out.println("dto 프로필 사진 : " + dto.getProfile_img());
			System.out.println(dto.getNickname());
			System.out.println(dto.getProfile_msg());
			
			Gson g = new Gson();
			JsonObject obj = new JsonObject();
			obj.addProperty("dto", g.toJson(dto));
			System.out.println(obj.toString());
			return obj.toString();
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("/withdrawMem") //회원 탈퇴 하기
	public String getout() {
		System.out.println("회원 탈퇴 CON 도착.");
		try {
			MemberDTO mDto = (MemberDTO)session.getAttribute("loginInfo");
			int result = service.withdrawMemService(mDto.getEmail());
			System.out.println(result);
			if(result> 0) {
				session.invalidate();
				System.out.println("회원탈퇴 성공하셨슴당.");
				return "main";
			}else {
				System.out.println("회원탈퇴 실패하셨슴당.");
				return "error";
			}


		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "error";
		}
	}

	@RequestMapping("/changeMyInfo") //회원 정보 수정하기
	public String changeInfo(MemberDTO dto, Model model) {
		System.out.println("회원 정보 수정 CON 도착.");
		MemberDTO mDto = (MemberDTO)session.getAttribute("loginInfo");
		try {
			int result = 0;
			model.addAttribute("email", mDto.getEmail());
			if(mDto.getEmail() != null) {
				result = service.changeMyInfoService(mDto.getEmail(), dto);
			}else {
				result = 0;
			}
			if(result > 0) {
				System.out.println("정보변경에 성공하셨슴당.");
				return "redirect:/feed/myFeed";
			}else {
				System.out.println("정보변경에 실패하셨슴당.");
				return "error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "redirect:/feed/myFeed";
		}
	} 
	
	@RequestMapping("/changePw") // 비밀번호 변경
	@ResponseBody
	public String changePw(String pw) {
		String email = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		JsonObject obj = new JsonObject();
		try {
			if(service.changePw(email, pw) > 0) {
				obj.addProperty("result", "complete");
			}else {
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return obj.toString();
	}

	@RequestMapping("/changeProfile") //프로필 바꿔버리기
	public String changeMyProfile(MemberDTO dto, MultipartFile profileImg,Model model) {
		System.out.println("회원 정보 수정 CON 도착.");
		System.out.println("dto 출력 : " + dto.toString());
		String path = session.getServletContext().getRealPath("files");
		MemberDTO mDto = (MemberDTO)session.getAttribute("loginInfo");
		 
		model.addAttribute("email", mDto.getEmail());
		System.out.println("이메일는 "+mDto.getEmail());
		System.out.println("파일명은 : " + profileImg.getOriginalFilename());
		int result = 0;
		System.out.println("현재 프로필 이미지는? " + mDto.getProfile_img());
		try {
			if(profileImg.getOriginalFilename() == "") {
				result = service.changeMyProfileService(mDto.getEmail(), dto,null,path);
			}else {
				result = service.changeMyProfileService(mDto.getEmail(), dto,profileImg,path);
			}
			
			
			if(result> 0) {
				session.removeAttribute("loginInfo");
				session.setAttribute("loginInfo", service.getMemberDTO(mDto.getEmail())); // 세션 로그인정보 담기
				System.out.println("정보변경에 성공하셨슴당.");
				return "redirect:/feed/myFeed";
			}else {
				System.out.println("정보변경에 실패하셨슴당.");
				return "error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("입력실패.");
			return "redirect:/feed/myFeed";
		}
	}

	@RequestMapping("/identifyMemPw")
	@ResponseBody
	public String identifyMemPw(String pw) {
		System.out.println("현재 비밀번호 확인 CON 도착"); 
		System.out.println("현재 적은 비번은 "+pw);
		JsonObject obj = new JsonObject();
		try {
			MemberDTO mDto = (MemberDTO)session.getAttribute("loginInfo");
			MemberDTO dto = service.identifyMemPwService(mDto.getEmail());
			System.out.println("비번은 "+dto.getPw());
			if(Configuration.encrypt(pw).equalsIgnoreCase(dto.getPw())) {
				obj.addProperty("result", "validate");
			}else {
				obj.addProperty("result", "invalidate");
			}
			return obj.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	@RequestMapping("/blockMem") // 비밀번호 변경
	@ResponseBody
	public String blockMem(String yr_id) {
		String myEmail = ((MemberDTO)session.getAttribute("loginInfo")).getEmail();
		
		try {
			String result =service.blockService(myEmail, yr_id);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
}
