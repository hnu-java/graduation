package daoImp;

import dao.DAO;
import dao.OrganizationManagementDao;
import entity.OrganizationManagementEntity;

import java.util.List;

public class OrganizationManagementDaoImp extends DAO<OrganizationManagementEntity> implements OrganizationManagementDao {

    @Override
    public List<OrganizationManagementEntity> getAllOrg(int id_user) {
        System.out.println(id_user);
        String sql = "select * from view_org_list where ID_ORGANIZATION = any(select ID_ORGANIZATION from view_org_list where ID_USER = ? and STATU != 0) and STATU = 1";
        List<OrganizationManagementEntity> allOrg = getForList(sql, id_user);
        return allOrg;
    }

    @Override
    public int getStatu(int id_org, int id_user) {
        String sql = "select STATU from view_org_list where ID_USER = ? and ID_ORGANIZATION = ?";
        int statu = Integer.valueOf(getForValue(sql, id_user, id_org).toString());
        return statu;
    }

    @Override
    public int getID_ORGANIZAITION(String org_name) {
        String sql = "select ID_ORGANIZATION from view_org_list where ORG_NAME = ?";
        int id_org = Integer.valueOf(getForValue(sql, org_name).toString());
        return id_org;
    }
}
