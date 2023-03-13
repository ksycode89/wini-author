package egovframework.wini.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import egovframework.wini.service.member.memberService;

@Controller
@EnableWebMvc 
public class FrontController {
	@Resource(name = "memberService")
	private memberService memberService;
	
	@GetMapping("goMain.do")
	public String goMain(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("userInfo")==null) { // 세션이 없을 경우, url gologin.do redirect 실행
			return "redirect:goLogin.do";
		}else { // 세션이 있을 경우, main페이지 호출
			return "main/main";
		}
	}
	
	// 로그인 페이지 이동
	@RequestMapping("goLogin.do")
	public String gologin() {
		return "main/login";
	}
	// 회원가입창 페이지 이동
	@RequestMapping("goJoinMember.do")
	public String goJoinMember() {
		// 로그인 페이지는 header, footer 없음.
		return "main/joinMember";
	}
	// 아이디&비밀번호 찾기 페이지 이동
	@RequestMapping("goFindMember.do")
	public String goFindMember() {
		return "main/findMember";
	}
	// Header에 쓰이는 Menu리스트 ajax 조회
	@RequestMapping("getMenu.do")
	@ResponseBody
	public List<Map<String,Object>> getMenu() {
		// 메뉴 조회
			List<Map<String,Object>> menu = memberService.getMenu();
		return menu;
	}
}
