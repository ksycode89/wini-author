package egovframework.wini.service.impl.eqmnSTAT;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.wini.service.eqmnSTAT.EqmnSTATService;

@Service("eqmnStatService")
public class EqmnSTATServiceImpl implements EqmnSTATService{
	@Autowired
	private EqmnSTATmapper eqmnStatMapper;

	@Override
	public List<Map<String, Object>> getEqmnList() {
		List<Map<String, Object>> result = eqmnStatMapper.getEqmnList();
		return result;
	}

	@Override
	public Map<String, Object> getStat(Map<String, Object> param) {
		List<Map<String, Object>> statResult = eqmnStatMapper.getStat(param);
		int cnt = eqmnStatMapper.getStatCnt(param);
		List<Map<String, Object>> statCntResult = eqmnStatMapper.getStatChckResult(param);
		Map<String, Object> resultList = new HashMap<String, Object>();
		resultList.put("data", statResult);
		resultList.put("cnt", cnt);
		resultList.put("chckResult", statCntResult);
		return resultList;
	}
}
