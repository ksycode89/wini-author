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
	
	@RequestMapping("goJoinMember.do")
	public String gologin() {
		// 로그인 페이지는 header, footer 없음.
		return "main/joinMember";
	}
	
//	아이디 중복체크
	@RequestMapping("duplicateCheck.do")
	@ResponseBody
	public int duplicateCheck(@RequestParam Map<String, Object> commandMap) {
		// 로그인 페이지는 header, footer 없음.
		int idchk = memberService.duplicateCheck(commandMap);
		return idchk;
	}
	
	@RequestMapping("userInsert.do")
	@ResponseBody
	public int userInsert(@RequestParam Map<String, Object> commandMap) {
		// 로그인 페이지는 header, footer 없음.
		int insertResult = memberService.userInsert(commandMap);
		return insertResult;
	}
	
	@RequestMapping("userLogin.do")
	@ResponseBody
	public Object userLogin(@RequestParam Map<String, Object> commandMap, HttpSession session) {
		Map<String, Object> result = memberService.userLogin(commandMap);
		Map<String, Object> userInfo = (Map<String, Object>) result.get("userInfo");
		if (result.get("chk").equals("Y")) {
			session.setAttribute("userId", userInfo.get("userId"));
			session.setAttribute("userNm", userInfo.get("userNm"));
			session.setAttribute("rght", userInfo.get("rght"));
		}
		return result.get("chk");
	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest re) {
		re.getSession().invalidate();
		return "redirect: goLogin.do";
	}
	
	
}
