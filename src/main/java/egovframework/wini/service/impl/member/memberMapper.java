package egovframework.wini.service.impl.member;

import java.util.List;
import java.util.Map;

import egovframework.wini.comm.CommandMap;


public interface memberMapper {
	// 아이디 중복체크
	int duplicateCheck (Map<String, Object> param);
	
	// 회원가입 실행
	int userInsert (Map<String, Object> param);
	
	// 로그인 실행
	Map<String, Object> userLogin (Map<String, Object> param);
	
	//회원정보가져오기
	Map<String, Object> userInfo (Map<String, Object> param);
	
	// 메뉴 조회
	List<Map<String,Object>> getMenu();
	
}
