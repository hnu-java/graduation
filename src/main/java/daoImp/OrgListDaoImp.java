package daoImp;

import dao.DAO;
import dao.OrgListDao;
import entity.OrgListEntity;

import java.sql.Timestamp;
import java.util.List;

public class OrgListDaoImp extends DAO<OrgListEntity> implements OrgListDao {
    @Override
    public List<OrgListEntity> getOrgAllMem(String org_name) {
        String sql = "select * from view_org_list where ORG_NAME = ? and STATU != 1";
        List<OrgListEntity> orglistentity = getForList(sql, org_name);
        return orglistentity;
    }

    @Override
    public boolean setViceAdmin(int id_user, String org_name, String content) {
        String sql1 = "select ID_ORGANIZATION from organization where NAME = ?";
        int id_organization = Integer.valueOf(getForValue(sql1, org_name).toString());
        String sql2 = "update org_member set STATU = 2 where ID_USER = ? and ID_ORGANIZATION = ?";
        update(sql2, id_user, id_organization);
        String sql3 = "insert into message(ID_USER, CONTENT, DATE, ID_ORG) values(?, ?, ?, ?)";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        update(sql3, id_user, content, createDate, id_organization);
        return true;
    }

    @Override
    public boolean moveViceAdmin(int id_user, String org_name, String content) {
        String sql1 = "select ID_ORGANIZATION from organization where NAME = ?";
        int id_organization = Integer.valueOf(getForValue(sql1, org_name).toString());
        String sql2 = "update org_member set STATU = 0 where ID_USER = ? and ID_ORGANIZATION = ?";
        update(sql2, id_user, id_organization);
        String sql3 = "insert into message(ID_USER, CONTENT, DATE, ID_ORG) values(?, ?, ?, ?)";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        update(sql3, id_user, content, createDate, id_organization);
        return true;
    }
}
