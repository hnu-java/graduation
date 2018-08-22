package daoImp;

import dao.DAO;
import dao.UserStructureIdDao;
import entity.UserStructureIdEntity;

public class UserStructureIdDaoImp extends DAO<UserStructureIdEntity> implements UserStructureIdDao {

    @Override
    public boolean delete(int id_structure) {
        String sql = "delete from structure where ID_STRUCTURE = ?";
        update(sql, id_structure);
        return true;
    }
}
