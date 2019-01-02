//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package dao;

import entity.ApplyOrganizationEntity;
import entity.OrganizationEntity;

import java.text.ParseException;
import java.util.List;

public interface OrganizationDao {
    OrganizationEntity getOne(String name);
    OrganizationEntity getOne(int ID_ORGANIZATION);
    List<OrganizationEntity> getAll();
    void quit(String NAME);
    boolean isIn(int id_user,int id_org);
    List<OrganizationEntity> getMatched(int id_User, String name);
    List<OrganizationEntity> getMyOrg(int id);
    int getStatu(int id_organization,int id_user);
    int getIdOrganization(String org_name);
    String findName(int ID_ORGANIZATION);  //获取机构ID对应的NAME
    String findAdminName(int ID_ORGANIZATION);
    String findUserName(String ORG_NAME);
    int usable(int id_org);
    String getOrgName(int id_org);
}
