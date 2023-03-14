package egovframework.wini.service.common;

import java.util.List;
import java.util.Map;

import egovframework.wini.web.common.jqgridJason;

public interface CommonService {

    Map<String, Object> list_map(String queryId, String queryId2, Map<String, Object> param) throws Exception; // map 사용시
    
    jqgridJason list(String queryId, Map<String, Object> param) throws Exception; // jqgrid 사용시
    
    int mult_save(List<String> queryID, List<String> queryIUD, jqgridJason param) throws Exception;

}
