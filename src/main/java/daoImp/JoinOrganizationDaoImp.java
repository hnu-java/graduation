package daoImp;

import dao.JoinOrganizationDao;
import entity.JoinOrganizationEntity;
import dao.DAO;

import java.sql.Timestamp;

public class JoinOrganizationDaoImp extends DAO<JoinOrganizationEntity> implements JoinOrganizationDao {
    @Override
    public boolean joinOrg(int id, JoinOrganizationEntity join) {
        String sql1 = "insert into join_org(ID_USER, ID_ORGANIZATION, DATE, MESSAGE) values (?, ?, ?, ?)";
        String sql2 = "select COUNT(*) from organization where ID_ORGANIZATION = ?";
        String sql3 = "select ID_ORGANIZATION from organization where NAME = ?";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        int org_id = Integer.valueOf(getForValue(sql3, join.getOrg_name()).toString());
        int count=Integer.valueOf(getForValue(sql2,org_id).toString());
        if (count == 1) {
            try {
                updateThrowException(sql1,id,org_id,createDate,join.getMessage());
                return true;
            }catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

}
