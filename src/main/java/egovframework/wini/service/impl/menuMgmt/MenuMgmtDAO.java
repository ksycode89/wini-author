package egovframework.wini.service.impl.menuMgmt;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.wini.service.menuMgmt.MenuMgmtVO;

@Repository("menuMgmtDAO")
public class MenuMgmtDAO extends EgovComAbstractDAO {

	/** 메뉴리스트 트리 조회 **/
    public List selectMenuMgmtTreeList(MenuMgmtVO vo) throws Exception {
        return list("menuMgmtDAO.selectMenuMgmtTreeList",vo);
    }
    
}
