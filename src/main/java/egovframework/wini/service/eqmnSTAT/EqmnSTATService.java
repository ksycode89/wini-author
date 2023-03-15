package egovframework.wini.service.eqmnSTAT;

import java.util.List;
import java.util.Map;

public interface EqmnSTATService {
	// 장비 리스트 조회
	List<Map<String,Object>> getEqmnList(Map<String, Object> param);
		
	// 통계 데이터 조회
	Map<String, Object> getStat(Map<String, Object> param);
}
