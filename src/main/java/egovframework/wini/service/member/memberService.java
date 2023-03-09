package egovframework.wini.service.member;

import java.util.List;
import java.util.Map;

public interface memberService {
	int duplicateCheck (Map<String, Object> param);
	int userInsert (Map<String, Object> param);
	
}
