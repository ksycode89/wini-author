package egovframework.wini.service.impl.eqmn;

import java.util.List;

import javax.activation.CommandMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.wini.service.eqmn.EqmnVO;

@Mapper("epmnMapper")
public interface EqmnMapper {
	
	//매개변수로 인한 list뽑기
	List<EqmnVO> eqmnList(EqmnVO vo);
	//계층형 트리용
	List<EqmnVO> CallEqmnTree();
	//등록
	int doAddAjax(EqmnVO vo);
	//수정
	int eqpmnModiDo(EqmnVO vo);
	//삭제
	int eqpmnDelAjax(EqmnVO vo);
}
