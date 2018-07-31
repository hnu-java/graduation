package daoImp;

import dao.DAO;
import dao.OrganizationManagementDao;
import entity.OrganizationManagementEntity;

import java.util.List;

public class OrganizationManagementDaoImp extends DAO<OrganizationManagementEntity> implements OrganizationManagementDao {

    @Override
    public List<OrganizationManagementEntity> getAllOrg(int id_user) {
        System.out.println(id_user);
        String sql = "select * from view_org_user where ID_USER = ?";
        List<OrganizationManagementEntity> allOrg = getForList(sql, id_user);
        return allOrg;
    }
}
