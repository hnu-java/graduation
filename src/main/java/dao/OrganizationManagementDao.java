package dao;

import entity.OrganizationManagementEntity;

import java.util.List;

public interface OrganizationManagementDao {
    List<OrganizationManagementEntity> getAllOrg(int id_user);
}
