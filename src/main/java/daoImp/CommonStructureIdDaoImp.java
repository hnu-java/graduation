package daoImp;

import dao.CommonStructureIdDao;
import dao.DAO;
import entity.CommonStructureIdEntity;

public class CommonStructureIdDaoImp extends DAO<CommonStructureIdEntity> implements CommonStructureIdDao {
    @Override
    public boolean delete(int id_structure) {
        String sql = "delete from structure where ID_STRUCTURE = ?";
        update(sql, id_structure);
        return true;
    }
}
