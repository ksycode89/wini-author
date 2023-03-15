package egovframework.wini.web.userMgmt;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.wini.service.common.CommonService;
import egovframework.wini.service.common.EgovProperties;
import egovframework.wini.web.common.jqgridJason;
import net.sf.json.JSONObject;

@Controller
public class UserMgmtController {
	
	private final Log log = LogFactory.getLog(this.getClass());
	
    @Resource(name = "defaultService")
    private CommonService commonService;
	
    /** 사용자 목록 조회  **/
	@RequestMapping("srchUserMgmt.do")
	public String srchUserMgmt(@RequestParam Map<String, Object> commandMap, ModelMap model, HttpServletRequest request) throws Exception {
		
		Map<String, Object> codeMap = commonService.list_map("userMgmtDAO.selectUserMgmtList", "userMgmtDAO.selectUserMgmtListCnt", commandMap);
		
        model.addAttribute("resultList", codeMap.get("resultList"));
        model.addAttribute("resultCnt", codeMap.get("resultCnt"));
        model.addAttribute("paginationInfo", codeMap.get("paginationInfo"));
        model.addAttribute("parmMap", commandMap);
		
		return "mgmt/userMgmt";
	}
	
    /** 사용자 상세 조회  **/
    @RequestMapping("userMgmtDetail.do")
    public @ResponseBody jqgridJason userMgmtDetail(@RequestParam Map<String, Object> commandMap ,ModelMap model) throws Exception {
        
        jqgridJason resultData = new jqgridJason();
        
        try {
    
            resultData = commonService.list("userMgmtDAO.selectUserMgmtDetail", commandMap);
       
        } catch (SQLException e) {
            log.error("에러발생"+ e.getMessage());
        } catch (Exception e) {
            log.error("에러발생"+ e.getMessage());
        }
        
        /** SPARROW : NULL_RETURN 조치 **/
        if(resultData == null){
            resultData = new jqgridJason();
        }
        return resultData;
    }
    
    /** 사용자 등록, 수정, 삭제  **/
    @RequestMapping("userMgmtIUD.do")
    public void userMgmtIUD(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

            jqgridJason resultData = new jqgridJason();
            
            try {
                
                List<String> queryId   = new ArrayList<String>();  // QueryID List
                List<String> queryIUD  = new ArrayList<String>();  // IUD List -> I: 등록, U:수정, D: 삭제
                List<Map>    save_data = new ArrayList<Map>();     // 파라미터 데이터
                
                Map<String, Object> map1 = commandMap;  
                
                if (commandMap.get("iud") != null && commandMap.get("iud").equals("U")) { // 수정        
                	
                	queryId.add("userMgmtDAO.updateUserMgmt");        
                    queryIUD.add("U");     
                    save_data.add(map1);  
                    
                } else if (commandMap.get("iud") != null && commandMap.get("iud").equals("S")) { // 비밀번호 초기화
                	
                	//비밀번호를 1로 초기화
                	String clearPw = BCrypt.hashpw("1", BCrypt.gensalt());
                	commandMap.put("user_pw", clearPw);
                	
                    queryId.add("userMgmtDAO.clearUserPw");        
                    queryIUD.add("U");     
                    save_data.add(map1);                
                }
                
                resultData.setRows(save_data);            
                int result = commonService.mult_save(queryId, queryIUD, resultData);
                
                resultData.setErrCd(""+result);
                resultData.setErrMsg("정상등록");
            } catch (SQLException e) {
                resultData.setErrCd("-1");
                resultData.setErrMsg(EgovProperties.getProperty("Globals.tmpErrorMsg"));
                log.error("에러발생"+ e.getMessage());
            } catch (Exception e) {
                resultData.setErrCd("-1");
                resultData.setErrMsg(EgovProperties.getProperty("Globals.tmpErrorMsg"));
                log.error("에러발생"+ e.getMessage());
            }
            
            response.setContentType("text/plain;charset=utf-8");
            JSONObject jsonGrid = JSONObject.fromObject(resultData);
            PrintWriter printWriter = response.getWriter();
            printWriter.println(jsonGrid);
            
            printWriter.flush();
            printWriter.close();
            
    }
}


