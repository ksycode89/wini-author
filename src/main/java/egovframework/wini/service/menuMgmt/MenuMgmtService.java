package egovframework.wini.service.menuMgmt;

public interface MenuMgmtService {
	
	/** 메뉴목록 트리 조회 **/
	TreeVO selectMenuMgmtTreeList(MenuMgmtVO vo) throws Exception;
	
	
}
