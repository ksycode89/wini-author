package egovframework.wini.service.eqmnC;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface EqmnCService {
	//검색조인용	
	public List<Map<String, Object>>saerchForJoin();
	//점검 마스터 테이블
	public List<EqmnCVO> CheckMasterAJax(EqmnCVO vo);
	//점검 마스터 디테일 테이블
	public List<EqmnCDVO> CheckMasterDAJax(EqmnCDVO vo);
	//입력
	public int addEqpmnDo( Map<String, Object> commandMap,int userSn);
	//삭제
	public int eqpmnCDDelAjax( int chckSn);
	
}
