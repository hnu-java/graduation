package daoImp;

import dao.DAO;
import dao.securityDao;
import entity.SecurityEntity;

import java.util.List;

public class securityDaoImp extends DAO<SecurityEntity> implements securityDao {
    @Override
    public List<SecurityEntity> getSecurity() {
        String sql="select * from security";
        return getForList(sql);
    }
}
