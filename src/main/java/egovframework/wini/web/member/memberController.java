package egovframework.wini.web.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import egovframework.wini.service.member.memberService;

@Controller
@EnableWebMvc 
public class memberController {
	@Resource(name = "memberService")
	private memberService memberService;
	
	//	아이디 중복체크
	@RequestMapping("duplicateCheck.do")
	@ResponseBody
	public int duplicateCheck(@RequestParam Map<String, Object> commandMap) {
		int idchk = memberService.duplicateCheck(commandMap);
		return idchk;
	}
	// 회원가입
	@RequestMapping("userInsert.do")
	@ResponseBody
	public int userInsert(@RequestParam Map<String, Object> commandMap) {
		int insertResult = memberService.userInsert(commandMap);
		return insertResult;
	}
	// 로그인
	@RequestMapping("userLogin.do")
	@ResponseBody
	public Object userLogin(@RequestParam Map<String, Object> commandMap, HttpSession session) {
		Map<String, Object> result = memberService.userLogin(commandMap);
		Map<String, Object> userInfo = (Map<String, Object>) result.get("userInfo");
		if (result.get("chk").equals("Y")) {
			session.setAttribute("userInfo", userInfo); // 세션 연결
		}
		return result.get("chk");
	}
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest re) {
		re.getSession().invalidate(); // 세션 해제
		return "redirect: goLogin.do";
	}
	
	
}
