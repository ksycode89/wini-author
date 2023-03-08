package egovframework.wini.web.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@EnableWebMvc 
public class memberController {

	@RequestMapping("goJoinMember.do")
	public String gologin() {
		// 로그인 페이지는 header, footer 없음.
		return "main/joinMember";
	}
}
