package daoImp;

import dao.DAO;
import dao.ShowPointsRecordDao;
import entity.PointsRecordEntity;

import java.util.List;

public class ShowPointsRecordDaoImp extends DAO<PointsRecordEntity> implements ShowPointsRecordDao {

    @Override
    public List<PointsRecordEntity> showPointsRecord(int id_user) {
        String sql1="select * from view_user_record where id_user = ?";
        List<PointsRecordEntity> list = getForList(sql1,id_user);
        return list;
    }
}
