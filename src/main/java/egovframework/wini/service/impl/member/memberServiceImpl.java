package egovframework.wini.service.impl.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.wini.service.member.memberService;

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
		return memberMapper.userInsert(param);
	}

}
