package dao;

import entity.PointsRecordEntity;

import java.util.List;

public interface ShowPointsRecordDao {
    List<PointsRecordEntity> showPointsRecord(int id_user);
}
