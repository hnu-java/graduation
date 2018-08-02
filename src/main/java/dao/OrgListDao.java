package dao;

import entity.OrgListEntity;

import java.util.List;

public interface OrgListDao {
    List<OrgListEntity> getOrgAllMem(String org_name);
    boolean setViceAdmin(int id_user, String org_name, String content);
}
