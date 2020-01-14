package kh.init.advisors;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

public class AuthAdvisor {

	@Autowired
	private HttpSession session;
	
	// 회원가입, 로그인을 제외한 모든 페이지 로그인 세션 확인 후 접근 advisor
//	public String loginCheck(ProceedingJoinPoint pjp) { 
//		String user = (String) session.getAttribute("loginInfo");
//		System.out.println(user);
//		
//		Object result = null;
//		
//		if(user != null) {
//			try {
//				result = pjp.proceed(pjp.getArgs());
//				System.out.println("advisor : " + result);
//			}catch(Throwable e) {
//				e.printStackTrace();
//				return "error";
//			}			
//		}else {
//			return "error";
//		}return (String)result;
//	}
	
}
