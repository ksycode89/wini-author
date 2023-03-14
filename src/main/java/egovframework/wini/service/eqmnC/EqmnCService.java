package egovframework.wini.service.eqmnC;

import java.util.List;
import java.util.Map;

public interface EqmnCService {
	//검색조인용	
	public List<Map<String, Object>>saerchForJoin();
	//점검 마스터 테이블
	public List<EqmnCVO> CheckMasterAJax(EqmnCVO vo);
	//점검 마스터 디테일 테이블
	public List<EqmnCDVO> CheckMasterDAJax(EqmnCDVO vo);
}
