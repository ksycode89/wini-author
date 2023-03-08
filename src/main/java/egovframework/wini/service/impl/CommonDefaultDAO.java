package egovframework.wini.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


@Repository("defaultDAO")
public class CommonDefaultDAO extends EgovComAbstractDAO {

    @Override
    public List list(String queryId, Object parameterObject) {
        // TODO Auto-generated method stub
        return super.list(queryId, parameterObject);
    }

    @Override
    public Object selectByPk(String queryId, Object parameterObject) {
        // TODO Auto-generated method stub
        return super.select(queryId, parameterObject);
    }

}
