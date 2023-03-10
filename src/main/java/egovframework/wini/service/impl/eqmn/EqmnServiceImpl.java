package egovframework.wini.service.impl.eqmn;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.wini.service.eqmn.EqmnService;
import egovframework.wini.service.eqmn.EqmnVO;

@Service("EqmnService")
public class EqmnServiceImpl implements EqmnService{
	
	
	@Resource(name="epmnMapper")
	EqmnMapper eqMap;
	
	//매개변수로 리스트 뽑기
	@Override
	public List<EqmnVO> eqmnList(EqmnVO vo) {
		System.out.println("임플안");
		List<EqmnVO> list = eqMap.eqmnList(vo);
		System.err.println(list);
		return list;
	}
	//계층관리
	@Override
	public List<EqmnVO> CallEqmnTree() {
		
		return eqMap.CallEqmnTree();
	}
	


}
