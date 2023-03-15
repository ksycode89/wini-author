package egovframework.wini.service.impl.menuMgmt;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public abstract class EgovComAbstractDAO extends EgovAbstractDAO {

    @Resource(name = "egov.sqlMapClient")
    public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        super.setSuperSqlMapClient(sqlMapClient);
    }

}
