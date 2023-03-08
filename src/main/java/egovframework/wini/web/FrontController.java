package egovframework.wini.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@EnableWebMvc 
public class FrontController {
	
	@GetMapping("goMain.do")
	public String goMain() {
		// 세션이 있을 경우, main페이지 호출
		// 세션이 없을 경우, url gologin.do redirect 실행
		return "main/main";
	}
	
	@GetMapping("goLogin.do")
	public String gologin() {
		// 로그인 페이지는 header, footer 없음.
		return "main/login";
	}
}
