package egovframework.wini.service.impl.eqmn;

import java.util.List;

import javax.annotation.Resource;
import javax.swing.event.ListDataListener;

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
	
	@Override
	public int doAddAjax(EqmnVO vo) {
		String id= vo.getEqpmnId();
		String upperId= vo.getUpperEqpmnId();
		String resultId = upperId+id;
		//상위테이블+지정한문자열 = 등록될 코드
		vo.setEqpmnId(resultId);
		//중복체크
		EqmnVO vo2 = new EqmnVO();
		vo2.setEqpmnId(resultId);
		List<EqmnVO> list = eqMap.eqmnList(vo2);	
		//만들어진 id로 검색했을때 정보가 나오면 이미 존재하는 아이디 즉 null이 true면 생성가능
		if(list.isEmpty()) {
			 eqMap.doAddAjax(vo);
			 return 1;
		}
		//아니라면 return 0
		return 0;
	}
	//수정//-1이면 rollback 0이면 업로드 실패 0건 그외며 몇건 실행되었는지 
	@Override
	public int eqpmnModiDo(EqmnVO vo) {
		//구분을 위한 객체
		int result = 0;
		
		try {
			result = eqMap.eqpmnModiDo(vo);
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
	//삭제//-1이면 rollback 0이면 업로드 실패 0건 그외며 몇건 실행되었는지 -2면 자식요소 존재
	@Override
	public int eqpmnDelAjax(EqmnVO vo) {
		//구분을 위한 객체
		int result = 0;
			//삭제확인용 vo
			String delId = vo.getEqpmnId();
			EqmnVO checkVo= new EqmnVO();
			checkVo.setUpperEqpmnId(delId);
		try {
			//남은 자식요소 있는지 체크
			boolean ch = eqMap.eqmnList(checkVo).isEmpty();
			if(ch) {
				result = eqMap.eqpmnDelAjax(vo);
				System.out.println(result);
				if(result >0) {
					return result;
				}
			}else {
				result = -2;
			}
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
		return result;
	}
	


}
