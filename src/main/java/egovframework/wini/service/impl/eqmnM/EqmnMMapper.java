package egovframework.wini.service.impl.eqmnM;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.wini.service.eqmnM.EqmnMVO;

@Mapper("epmnMMapper")
public interface EqmnMMapper {
	//리스트가져오기
	public List<EqmnMVO>callEqpmnMain(EqmnMVO vo);
	//리스트가져오기[r검색 점검용]
	public List<EqmnMVO>doSearchAjaxC(EqmnMVO vo);
	//insert
	public int insertEqpmnMAjax(EqmnMVO vo);
	//modi
	public int eqpmnModiDoAjax(EqmnMVO vo);
	//modi
	public int eqpmnDelAjax(EqmnMVO vo);
	
}
