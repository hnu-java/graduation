package daoImp;

import dao.JoinOrganizationDao;
import entity.JoinOrganizationEntity;
import dao.DAO;
import entity.OrganizationEntity;

import java.sql.Timestamp;
import java.util.List;

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

    @Override
    public List<JoinOrganizationEntity> getMyInvite(String org_name) {
        String sql = "select * from view_join_org where (ORG_NAME = ? and STATUS = 0)";
        List<JoinOrganizationEntity> MyInvite = getForList(sql,org_name);
        return MyInvite;
    }
    public List<JoinOrganizationEntity> getMyInvited(String org_name) {
        String sql = "select * from view_join_org where (ORG_NAME = ? and STATUS != 0)";
        List<JoinOrganizationEntity> MyInvited = getForList(sql,org_name);
        return MyInvited;
    }

    @Override
    public boolean accept(int id_user, int id_org) {
        String sql = "insert into org_member(ID_USER, ID_ORGANIZATION) values (?, ?)";
        update(sql, id_user, id_org);
        String sql1 = "update join_org set STATUS = 1 where (ID_USER = ? AND ID_ORGANIZATION = ?)";
        update(sql1, id_user, id_org);
        return true;
    }

    @Override
    public boolean refuse(int id_user, int id_org) {
        String sql = "update join_org set STATUS = -1 where (ID_USER = ? AND ID_ORGANIZATION = ?)";
        update(sql, id_user, id_org);
        return true;
    }
}
