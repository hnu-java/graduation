package dao;

import entity.JoinOrganizationEntity;

public interface JoinOrganizationDao {
    boolean joinOrg(int id, JoinOrganizationEntity join);
}
