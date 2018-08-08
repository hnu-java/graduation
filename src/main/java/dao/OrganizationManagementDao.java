package dao;

import entity.OrganizationManagementEntity;

import java.util.List;

public interface OrganizationManagementDao {
    List<OrganizationManagementEntity> getAllOrg(int id_user);
    int getStatu(int id_org, int id_user);
    int getID_ORGANIZAITION(String org_name);
}
