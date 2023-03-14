package egovframework.wini.service.impl.eqmnC;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.wini.service.eqmnC.EqmnCDVO;
import egovframework.wini.service.eqmnC.EqmnCVO;

@Mapper("eqmnCMapper")
public interface EqmnCMapper {
		//검색조인용	
		public List<Map<String, Object>>saerchForJoin();
		
		//점검 마스터 테이블
		public List<EqmnCVO> CheckMasterAJax(EqmnCVO vo);
		//점검 마스터 디테일테이블
		public List<EqmnCDVO> CheckMasterDAJax(EqmnCDVO vo);

}
