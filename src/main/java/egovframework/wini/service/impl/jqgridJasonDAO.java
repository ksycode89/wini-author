package egovframework.wini.service.impl;


import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import egovframework.wini.web.common.jqgridJason;

public class jqgridJasonDAO implements Serializable {

    public Map loadJqgridJason(Map params, int totalCount,
            HttpServletRequest request) {

        /*
         * 검색조건 추가 (검색조건 필요시 수정필요)
         */
        Map map = new HashMap();
        // map.put("a", new String("a"));

        /*
         * 파라메터 추출
         */
        int page = Integer.parseInt(request.getParameter("page"));
        int rows = Integer.parseInt(request.getParameter("rows"));
        String sortoder = request.getParameter("sord");
        String sidx = request.getParameter("sidx");

        /** SPARROW : INTEGER_OVERFLOW 조치 **/
        if (page < 0) {
            page = 1;
        }
        if (rows < 0) {
            page = 1;
        }

        /*
         * 페이징처리 알고리즘
         */
        int start_row = (page - 1) * rows + 1;
        int end_row = (page - 1) * rows + rows;

        /*
         * 총Count
         */

        int max_page = totalCount / rows;
        if (totalCount % rows != 0)
            max_page++;

        map = params; // 검색조건을 jqgrid 조건과 합한다.

        /*
         * 페이징처리 파라메터
         */
        map.put("start_row", start_row);
        map.put("end_row", end_row);
        map.put("sord", sortoder);
        map.put("sidx", sidx);

        map.put("page", page);
        map.put("rows", rows);
        map.put("max_page", max_page);

        /*
         * 데이터 추출 (sqlMap 서비스 수정필요)
         */

        /*
         * Json 형태로 값 변경
         */
        /*
         * jqgridJason jq = new jqgridJason(); jq.setRows(dataSource);
         * jq.setPage(page); jq.setRecords(rows); jq.setTotal(max_page);
         */

        return map;
    }

    public Map loadJqgridJason(Map params, int totalCount) {

        /*
         * 검색조건 추가 (검색조건 필요시 수정필요)
         */
        Map map = new HashMap();

        /*
         * 파라메터 추출
         */
        // int page = (Integer)map.get("page");
        int page = Integer.parseInt("" + params.get("page"));
        int rows = Integer.parseInt("" + params.get("rows"));

        // System.out.println( "==========page=== " + page);
        // System.out.println( "==========rows=== " + rows);

        String sortoder = (String) params.get("sord");
        String sidx = (String) params.get("sidx");

        /*
         * 페이징처리 알고리즘
         */
        int start_row = (page - 1) * rows + 1;
        int end_row = (page - 1) * rows + rows;

        // System.out.println(rows);
        // System.out.println(end_row);

        /*
         * 총Count
         */
        int max_page = totalCount / rows;
        if (totalCount % rows != 0)
            max_page++;

        map = params; // 검색조건을 jqgrid 조건과 합한다.

        /*
         * 페이징처리 파라메터
         */
        map.put("startRow", start_row);
        map.put("endRow", end_row);
        map.put("maxPage", max_page);
        map.put("totalRecords", totalCount);

        return map;
    }

    public jqgridJason makeJqgridJason(List dataSource, Map params) {

        int page = Integer.parseInt("" + params.get("page"));
        int rows = Integer.parseInt("" + params.get("rows"));
        int maxPage = Integer.parseInt("" + params.get("maxPage"));
        int totalRecords = Integer.parseInt("" + params.get("totalRecords"));

        jqgridJason jq = new jqgridJason();
        jq.setRows(dataSource);
        jq.setPage(page);
        jq.setRecords(rows);
        jq.setTotal(maxPage);
        jq.setTotalRecords(totalRecords);
        return jq;
    }

    public jqgridJason makeJqgridJason(List dataSource) {

        jqgridJason jq = new jqgridJason();
        jq.setRows(dataSource);
        jq.setPage(1);
        jq.setRecords(dataSource.size());
        jq.setTotal(1);
        // System.out.println("jqqqqq");
        return jq;
    }
}
