package egovframework.wini.service.impl.member;

import java.util.List;
import java.util.Map;

import egovframework.wini.comm.CommandMap;


public interface memberMapper {
	int duplicateCheck(Map<String, Object> param);
	int userInsert(Map<String, Object> param);
	
}
