package egovframework.wini.service.impl.eqmnM;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.wini.service.eqmnM.EqmnMService;
import egovframework.wini.service.eqmnM.EqmnMVO;

@Service("EqmnMService")
public class EqmnMServiceImpl implements EqmnMService {
	
	@Resource(name="epmnMMapper")
	EqmnMMapper eqMMap;
	
	//list 뽑기
	@Override
	public List<EqmnMVO> callEqpmnMain(EqmnMVO vo) {
		
		return eqMMap.callEqpmnMain(vo);
	}
	//점검용 리스트 테이블
	@Override
	public List<EqmnMVO> doSearchAjaxC(EqmnMVO vo) {
			
		return eqMMap.doSearchAjaxC(vo);
	}
	//등록//-1이면 rollback 0이면 업로드 실패 0건 그외며 몇건 실행되었는지 -2면 자식요소 존재
	@Override
	public int insertEqpmnMAjax(EqmnMVO vo) {
		//구분을 위한 객체
				int result = 0;
				try {
					result = eqMMap.insertEqpmnMAjax(vo);
					System.out.println(result);
					if(result >0) {
						return result;
					}
				} catch (Exception e) {
				System.out.println(e);
				return -1;
				}
				return result;
	}

	@Override
	public int eqpmnModiDoAjax(EqmnMVO vo) {
		int result = 0;
		try {
			result = eqMMap.eqpmnModiDoAjax(vo);
			if(result >0) {
				return result;
			}
		} catch (Exception e) {
		System.out.println(e);
		return -1;
		}
		return result;
	}

	@Override
	public int eqpmnDelAjax(EqmnMVO vo) {
		int result = 0;
		try {
			result = eqMMap.eqpmnDelAjax(vo);
			if(result >0) {
				return result;
			}
		} catch (Exception e) {
			System.out.println(e);
		return -1;
		}
		return result;
	}


	
	
	

}
