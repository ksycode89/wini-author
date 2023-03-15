package egovframework.wini.service.eqmn;

import java.util.List;


public interface EqmnService {
	//매개변수로 인한 list뽑기
	List<EqmnVO> eqmnList(EqmnVO vo);
	//계층관리
	List<EqmnVO> CallEqmnTree();
	//등록
	int doAddAjax(EqmnVO vo);
	//최상위 등록
	int doAddRAjax(EqmnVO vo);
	//수정
	int eqpmnModiDo(EqmnVO vo);
	//삭제
	int eqpmnDelAjax(EqmnVO vo);
	
	
}
