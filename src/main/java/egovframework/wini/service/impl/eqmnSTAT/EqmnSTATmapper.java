package egovframework.wini.service.impl.eqmnSTAT;

import java.util.List;
import java.util.Map;

public interface EqmnSTATmapper {
	// 장비 리스트 조회
	List<Map<String,Object>> getEqmnList();
	List<Map<String,Object>> getEqmnList2(Map<String, Object> param);
	List<Map<String,Object>> getEqmnList3(Map<String, Object> param);
	
	// 통계 데이터 조회
	List<Map<String, Object>> getStat(Map<String, Object> param);
	// 통계 데이터 갯수 조회
	int getStatCnt(Map<String, Object> param);
	// 통계 'Y' 갯수 조회
	List<Map<String, Object>> getStatChckResult(Map<String, Object> param);
	// 장비 리스트 조회
}
