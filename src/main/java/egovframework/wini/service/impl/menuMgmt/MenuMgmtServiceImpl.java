package egovframework.wini.service.impl.menuMgmt;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.wini.service.menuMgmt.MenuMgmtService;
import egovframework.wini.service.menuMgmt.MenuMgmtVO;
import egovframework.wini.service.menuMgmt.TreeVO;

@Service("menuMgmtService")
public class MenuMgmtServiceImpl extends EgovAbstractServiceImpl implements MenuMgmtService {
	
	@Resource(name="menuMgmtDAO")
	 private MenuMgmtDAO menuMgmtDAO;
	
	@Override
	public TreeVO selectMenuMgmtTreeList(MenuMgmtVO vo) throws Exception {
		
		List list = menuMgmtDAO.selectMenuMgmtTreeList(vo); // 정보 조회
		
		TreeVO wtreeRoot = new TreeVO();
		TreeVO wtreeChild2 = new TreeVO();
		TreeVO wtreeChild3 = new TreeVO();
	        
	        for (int i = 0; i < list.size(); i++) {
	            Map map = (Map) list.get(i);            
	            
	           
	            if (map.get("menuStep").equals("1")) {
	                wtreeRoot = setTreeValue((String) map.get("menuId"), (String) map.get("menuNm"), (String) map.get("menuAt"));
	            }
	            
	            if (map.get("menuStep").equals("2")) {
	                
	                wtreeChild2 = new TreeVO();
	                wtreeChild2 = setTreeValue((String) map.get("menuId"), (String) map.get("menuNm"), (String) map.get("menuAt"));
	                wtreeRoot.addChildren(wtreeChild2);                
	            }
	            
	            if (map.get("menuStep").equals("3")) {
	                wtreeChild3 = new TreeVO();
	                wtreeChild3 = setTreeValue((String) map.get("menuId"), (String) map.get("menuNm"), (String) map.get("menuAt"));
	                wtreeChild2.addChildren(wtreeChild3);                
	            }
	            
	        }

	        return wtreeRoot;
	        
	    }
	    
	    public TreeVO setTreeValue(String menuId, String menuNm, String chkUpper) {
	        
	        String cState = "";
	        
	        TreeVO wvo = new TreeVO();
	        wvo.setId(menuId);
	        wvo.setText(menuNm);
	        
	        if(chkUpper.equals("N")) {
	            cState = "open";
	        } else {
	            cState = "closed";
	        }
	        
	        wvo.setState(cState);
	        
	        return wvo;
	        
	    }
	    
    
}
