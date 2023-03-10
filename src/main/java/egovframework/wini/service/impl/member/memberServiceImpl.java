package egovframework.wini.service.impl.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.wini.service.member.memberService;
import org.springframework.security.crypto.bcrypt.BCrypt;

@Service("memberService")
public class memberServiceImpl implements memberService {

	@Autowired
	private memberMapper memberMapper;
	
	@Override
	public int duplicateCheck(Map<String, Object> param) {
		return memberMapper.duplicateCheck(param);
	}

	@Override
	public int userInsert(Map<String, Object> param) {
		String encryptedPw = BCrypt.hashpw((String)param.get("userPw"), BCrypt.gensalt());
		param.put("userPw", encryptedPw);
		return memberMapper.userInsert(param);
	}

	@Override
	public Map<String, Object> userLogin(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> idChk = memberMapper.userLogin(param);
		if (idChk==null){ // ID가 DB에 없음.
			result.put("chk","N");
			return result;
		}
		// 비밀번호 일치여부 체크
		Boolean chk = BCrypt.checkpw((String)(param.get("userPw")), (String)idChk.get("userPw"));
		if(chk) { // 로그인 성공!
			// 세션 등록 필요!!!!!!!!!!!!!!
			// 정보 가져오기
			Map<String, Object> userInfo = memberMapper.userInfo(param);
			result.put("chk","Y");
			result.put("userInfo",userInfo);
			return result;
		}else{ // 로그인 실패!
			result.put("chk","N");
			return result;
		}
	}

}
