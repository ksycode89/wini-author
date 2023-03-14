package egovframework.wini.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.wini.service.common.CommonService;
import egovframework.wini.web.common.jqgridJason;

@Service("defaultService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements
	CommonService {

    /** defaultDAO */
    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * 목록 조회 후 map에 담아 return;
     * 
     * @param queryId , queryId2(cnt 쿼리ID), param Map
     * @return Map
     * @exception Exception
     */
    @Override
    public Map<String, Object> list_map(String queryId, String queryId2, Map<String, Object> param) throws Exception {

        int page = 1;
        int rowNum = 10;
        int pageSize = 10;

        if (param.get("page") != null && !param.get("page").equals("")) {
            page = Integer.parseInt("" + param.get("page"));
        }

        if (param.get("rowNum") != null && !param.get("rowNum").equals("")) {
            rowNum = Integer.parseInt("" + param.get("rowNum"));
        }

        if (param.get("pageSize") != null && !param.get("pageSize").equals("")) {
            pageSize = Integer.parseInt("" + param.get("pageSize"));
        }

        // Paging
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(page); // 페이지 번호
        paginationInfo.setRecordCountPerPage(rowNum); // row건수
        paginationInfo.setPageSize(pageSize); // 페이지 건수

        param.put("rowNum", rowNum);
        param.put("page", page);
        param.put("pageSize", pageSize);

        int totCnt = (Integer) defaultDAO.selectByPk(queryId2, param);

        List result = defaultDAO.list(queryId, param);

        paginationInfo.setTotalRecordCount(totCnt); // 총건수

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("resultList", result);
        map.put("resultCnt", totCnt);
        map.put("paginationInfo", paginationInfo);

        return map;

    }
    
    @Override
    public jqgridJason list(String queryId, Map<String, Object> param) throws Exception {

        jqgridJasonDAO jqdao = new jqgridJasonDAO();

        jqgridJason resultData = new jqgridJason();
        
        if(param != null) {
            resultData = jqdao.makeJqgridJason(defaultDAO.list(queryId, param));
        } else {
            resultData.setErrMsg("에러발생 : param is null");
        }

        return resultData;
    }
    
    @Override
    public int mult_save(List<String> queryID, List<String> queryIUD, jqgridJason param) throws Exception {
        // TODO Auto-generated method stub

        List<Map> save_data = param.getRows();

        // log.debug("save rows  ======"+save_data.size());

        if (queryID.size() > 0) {

            for (int i = 0; i < queryID.size(); i++) {
                String qId = queryID.get(i);
                String idu = queryIUD.get(i);
                Map<String, Object> dataMap = save_data.get(i);

                egovLogger.debug("queryID  ======" + qId);
                egovLogger.debug("idu      ======" + idu);
                egovLogger.debug("data     ======" + dataMap.toString());

                if (idu != null && idu.equals("I")) {
                    defaultDAO.insert(qId, dataMap);
                } else if (idu != null && idu.equals("U")) {
                    defaultDAO.update(qId, dataMap);
                } else if (idu != null && idu.equals("D")) {
                    defaultDAO.delete(qId, dataMap);
                } else {
                    return -1;
                }
            }

            return 1;
        } else {
            return 0;
        }

    }
}
