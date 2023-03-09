package egovframework.wini.service.eqmn;

import java.util.List;


public interface EqmnService {
	//매개변수로 인한 list뽑기
	List<EqmnVO> eqmnList(EqmnVO vo);
	//계층관리
	List<EqmnVO> CallEqmnTree();
	
	
}
