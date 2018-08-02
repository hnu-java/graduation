package daoImp;

import dao.JoinOrganizationDao;
import entity.JoinOrganizationEntity;
import dao.DAO;
import entity.OrganizationEntity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class JoinOrganizationDaoImp extends DAO<JoinOrganizationEntity> implements JoinOrganizationDao {
    @Override
    public boolean joinOrg(int id, JoinOrganizationEntity join) {
        String sql1 = "insert into join_org(ID_USER, ID_ORGANIZATION, DATE, MESSAGE) values (?, ?, ?, ?)";
        String sql2 = "select COUNT(*) from organization where NAME = ?";
        String sql3 = "select ID_ORGANIZATION from organization where NAME = ?";
        String sql4 = "insert into message(ID_USER, CONTENT, DATE, ID_ORG) values (?, ?, ?, ?)";
        String sql5 = "select NAME from user where ID_USER = ?";
        String sql6 = "select COUNT(*) from join_org where ID_USER = ? and ID_ORGANIZATION = ? and STATUS = 0";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        int count=Integer.valueOf(getForValue(sql2,join.getOrg_name()).toString());
        String userName = getForValue(sql5, id).toString();
        if (count == 1) {
            int org_id =getForValue(sql3, join.getOrg_name());
            int flag = Integer.valueOf(getForValue(sql6, id, org_id).toString());
            if(flag == 1) {
                return false;
            }
            String content = userName + "申请加入机构" + join.getOrg_name();
            System.out.println(content);
            try {
                updateThrowException(sql1,id,org_id,createDate,join.getMessage());
                updateThrowException(sql4,id,content,createDate,org_id);
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
    public boolean accept(int id_user, int id_org, int id_join_org) {
        String sql = "insert into org_member(ID_USER, ID_ORGANIZATION) values (?, ?)";
        update(sql, id_user, id_org);
        String sql1 = "update join_org set STATUS = 1 where ID_JOIN_ORG = ?";
        update(sql1, id_join_org);
        String sql2 = "insert into message(ID_USER, CONTENT, DATE, ID_ORG) values (?, ?, ?, ?)";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        String sql3 = "select NAME from organization where ID_ORGANIZATION = ?";
        String orgName = getForValue(sql3, id_org).toString();
        String sql5 = "select NAME from user where ID_USER = ?";
        String userName = getForValue(sql5, id_user).toString();
        String content = "管理员同意了" + userName + "加入" + orgName + "机构";
        update(sql2, id_user, content, createDate, id_org);
        return true;
    }

    @Override
    public boolean refuse(int id_user, int id_org, int id_join_org) {
        String sql = "update join_org set STATUS = -1 where ID_JOIN_ORG = ?";
        update(sql, id_join_org);
        String sql2 = "insert into message(ID_USER, CONTENT, DATE, ID_ORG) values (?, ?, ?, ?)";
        String sql3 = "select NAME from organization where ID_ORGANIZATION = ?";
        String orgName = getForValue(sql3, id_org).toString();
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        String sql5 = "select NAME from user where ID_USER = ?";
        String userName = getForValue(sql5, id_user).toString();
        String content = "管理员拒绝了" + userName + "加入" + orgName + "机构";
        update(sql2, id_user, content, createDate, id_org);
        return true;
    }

}
