package egovframework.wini.web.menuMgmt;

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
import egovframework.wini.service.menuMgmt.MenuMgmtService;
import egovframework.wini.service.menuMgmt.MenuMgmtVO;
import egovframework.wini.service.menuMgmt.TreeVO;
import egovframework.wini.web.common.jqgridJason;
import net.sf.json.JSONObject;

@Controller
public class MenuMgmtController {
	
	private final Log log = LogFactory.getLog(this.getClass());
	
    @Resource(name = "defaultService")
    private CommonService commonService;
    
    @Resource(name = "menuMgmtService")
    private MenuMgmtService menuMgmtService;
	
    /** 메뉴 관리 화면 호출  **/
	@RequestMapping("menuMgmt.do")
	public String menuMgmt(@RequestParam Map<String, Object> commandMap, ModelMap model, HttpServletRequest request) throws Exception {
		
		return "mgmt/menuMgmt";
	}
	
    /** 메뉴 목록 조회  **/
    @RequestMapping("menuMgmtTreeList.do")
    public void menuMgmtTreeList(HttpServletResponse response, HttpServletRequest request, MenuMgmtVO vo, Map<String, Object> commandMap) throws Exception {

        request.setCharacterEncoding("UTF-8");

        TreeVO resultData = new TreeVO();

        try {
            resultData = menuMgmtService.selectMenuMgmtTreeList(vo);
        } catch (NullPointerException e) {
            log.error("에러발생"+ e.getMessage());
        } catch (Exception e) {
            log.error("에러발생"+ e.getMessage());
        }

        log.debug("==="+resultData.toString());
        JSONObject jsonGrid = JSONObject.fromObject(resultData);
        response.setContentType("text/xml;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.println("["+jsonGrid+"]");

        printWriter.flush();
        printWriter.close();

    }
    
    /** 메뉴 상세조회 **/
    @RequestMapping("selectMenuMgmtDetail.do")
    public @ResponseBody jqgridJason selectMenuMgmtDetail(@RequestParam Map<String, Object> commandMap) throws Exception {

        jqgridJason resultData = new jqgridJason();

        try {

            resultData = commonService.list("menuMgmtDAO.selectMenuMgmtDetail", commandMap);

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
    
    /** 메뉴 정보 등록/수정/삭제 **/
    @RequestMapping("menuMgmtIUD.do")
    public void menuMgmtIUD(HttpServletResponse response, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

        jqgridJason resultData = new jqgridJason();

        try {
            
            List<String> queryId   = new ArrayList<String>();  // QueryID List
            List<String> queryIUD  = new ArrayList<String>();  // IUD List -> I: 등록, U:수정, D: 삭제
            List<Map>    save_data = new ArrayList<Map>();     // 파라미터 데이터
            
            Map<String, Object> map1 = commandMap;  
            
            if (commandMap.get("iud") != null && commandMap.get("iud").equals("I")) { // 등록
            	
                queryId.add("menuMgmtDAO.insertMenuMgmt");
                queryIUD.add("I");
                save_data.add(map1); 
                
            } else if (commandMap.get("iud") != null && commandMap.get("iud").equals("U")) { // 수정
            	
                queryId.add("menuMgmtDAO.updateMenuMgmt");
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


