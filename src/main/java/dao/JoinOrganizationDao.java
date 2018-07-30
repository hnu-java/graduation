package dao;

import entity.JoinOrganizationEntity;
import entity.OrganizationEntity;

import java.util.List;

public interface JoinOrganizationDao {
    boolean joinOrg(int id, JoinOrganizationEntity join);
    List<JoinOrganizationEntity> getMyInvite(String org_name);
    List<JoinOrganizationEntity> getMyInvited(String org_name);
    boolean accept(int id_user, int id_org);
    boolean refuse(int id_user, int id_org);
}
