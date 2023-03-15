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
		//마스터테이블 넣기
		public int insertMaster(EqmnCVO vo);
		//디테일 테이블 넣기
		public int insertMasterD(EqmnCDVO vo);
		//삭제 마스터
		public int eqpmnMDelAjax( int chckSn);
		//삭제 디테일
		public int eqpmnCDDelAjax( int chckSn);

}
