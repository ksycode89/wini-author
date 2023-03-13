package egovframework.wini.service.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface memberService {
	// 아이디 중복체크
	int duplicateCheck (Map<String, Object> param);
	
	// 회원가입 실행
	int userInsert (Map<String, Object> param);
	
	// 로그인 실행
	Map<String, Object> userLogin (Map<String, Object> param);
	
	// 메뉴 조회
	List<Map<String,Object>> getMenu ();
}
