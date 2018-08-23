package daoImp;

import dao.DAO;
import dao.FunStructureIdDao;
import entity.FunStructureIdEntity;

public class FunStructureIdDaoImp extends DAO<FunStructureIdEntity> implements FunStructureIdDao {

    @Override
    public boolean delete(int id_structure) {
        String sql = "delete from structure where ID_STRUCTURE = ?";
        update(sql, id_structure);
        return true;
    }
}
