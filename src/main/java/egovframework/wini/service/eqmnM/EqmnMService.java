package egovframework.wini.service.eqmnM;

import java.util.List;

public interface EqmnMService {
	//리스트가져오기
	public List<EqmnMVO>callEqpmnMain(EqmnMVO vo);

	//w점검용 목록
	public List<EqmnMVO>doSearchAjaxC(EqmnMVO vo);
	//insert
	public int insertEqpmnMAjax(EqmnMVO vo);
	//modi
	public int eqpmnModiDoAjax(EqmnMVO vo);
	//modi
	public int eqpmnDelAjax(EqmnMVO vo);
}
