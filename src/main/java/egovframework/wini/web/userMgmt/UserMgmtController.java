package egovframework.wini.web.userMgmt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import egovframework.wini.service.common.CommonService;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.ModelMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.annotation.Resource;

@Controller
@EnableWebMvc
public class UserMgmtController {
	
    @Resource(name = "defaultService")
    private CommonService commonService;
	
	@GetMapping("userMgmt.do")
	public String userMgmt() {
		
		return "mgmt/userMgmt";
	}
	
	@GetMapping("srchUserMgmt.do")
	public String wrkrMng(@RequestParam Map<String, Object> commandMap, ModelMap model, HttpServletRequest request) throws Exception {
		
		Map<String, Object> codeMap = commonService.list_map("userMgmtDAO.selectWrkrMngList", "userMgmtDAO.selectWrkrMngListCnt", commandMap);
		
        model.addAttribute("resultList", codeMap.get("resultList"));
        model.addAttribute("resultCnt", codeMap.get("resultCnt"));
        model.addAttribute("paginationInfo", codeMap.get("paginationInfo"));
		
		return "mgmt/userMgmt";
	}
}


