package egovframework.wini.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@EnableWebMvc 
public class FrontController {
	
	@GetMapping("goMain.do")
	public String goMain(Model model, HttpServletRequest request) {
		
		if (request.getSession(false)!=null) { // 세션이 없을 경우, url gologin.do redirect 실행
			return "main/main";
		}else { // 세션이 있을 경우, main페이지 호출
			return "redirect : goLogin.do";
		}
	}
	
	@GetMapping("goLogin.do")
	public String gologin() {
		// 로그인 페이지는 header, footer 없음.
		return "main/login";
	}
}
