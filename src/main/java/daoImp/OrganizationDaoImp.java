//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package daoImp;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import dao.DAO;
import dao.OrganizationDao;
import entity.ApplyOrganizationEntity;
import entity.OrganizationEntity;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class OrganizationDaoImp extends DAO<OrganizationEntity> implements OrganizationDao {

    @Override
    public List<OrganizationEntity> getMatched(int id_User, String name) {
        name="%"+name+"%";
        String sql = "select * from VIEW_ORGINFO where MEMBERID = ? and NAME LIKE ?";
        return getForList(sql,id_User,name);
    }

    @Override
    public List<OrganizationEntity> getMyOrg(int id) {
        String sql = "select NAME,ID_ORGANIZATION from view_org_member where ID_USER=?";
        List<OrganizationEntity> MyOrgList = getForList(sql,id);
        return MyOrgList;
    }

    @Override
    public int getStatu(int id_organization, int id_user) {
        System.out.println(id_organization);
        String sql = "select STATU from org_member where ID_ORGANIZATION = ? and ID_USER = ?";
        int statu=Integer.valueOf(getForValue(sql,id_organization,id_user).toString());
        return statu;
    }

    @Override
    public int getIdOrganization(String org_name) {
        String sql = "select ID_ORGANIZATION from organization where NAME = ?";
        int id_organization = Integer.valueOf(getForValue(sql,org_name).toString());
        return id_organization;
    }

    @Override
    public OrganizationEntity getOne(String name) {
        String sql = "select * from ORGANIZATION where NAME = ? ";
        return get(sql,name);
    }

    public OrganizationEntity getOne(int id_organization) {
        String sql = "select * from ORGANIZATION where ID_ORGANIZATION = ? ";
        return get(sql,id_organization);
    }

    @Override
    public List<OrganizationEntity> getAll() {
        String sql = "select * from ORGANIZATION";
        List<OrganizationEntity> list = getForList(sql);
        return list;
    }

    @Override
    public void quit(String NAME) {
        String sql = "delete from VIEW_MYORGANIZATION where NAME = ?";
        update(sql,NAME);
    }

    @Override
    public String findName(int ID_ORGANIZATION) {
        String sql = "select NAME from ORGANIZATION where ID_ORGANIZATION = ?";
        String name = getForValue(sql,ID_ORGANIZATION);
        System.out.println("orgName:"+name);
        return name;
    }
    @Override
    public String findUserName(String ORG_NAME) {
        //查询机构管理员ID
        String sql0 = "select ID_USER from ORGANIZATION where NAME = ?";
        int AdminID = Integer.valueOf(getForValue(sql0,ORG_NAME).toString());
        //查询机构管理员名字
        String sql1 = "select NAME from USER where ID_USER = ?";
        String AdminName = getForValue(sql1,AdminID);
        System.out.println("adminname:"+AdminName);
        return AdminName;
    }

    public String findAdminName(int ID_ORGANIZATION) {
        String sql0 = "select ID_USER from ORGANIZATION where ID_ORGANIZATION = ?";
        int AdminID = Integer.valueOf(getForValue(sql0,ID_ORGANIZATION).toString());
        //查询机构管理员名字
        String sql1 = "select NAME from USER where ID_USER = ?";
        String AdminName = getForValue(sql1,AdminID);
        System.out.println("adminname:"+AdminName);
        return AdminName;
    }

    @Override
    public int usable(int id_org){
        String sql1="select USABLE from organization where ID_ORGANIZATION=?";
        int flag = Integer.parseInt(getForValue(sql1,id_org));
        System.out.println(flag+"zz");
        return flag;
    }


    @Override
    public boolean isIn(int id_user,int id_org) {
        String sql = "select count(*) from ORG_MEMBER where ID_USER = ? and ID_ORGANIZATION = ?";
        if (Integer.valueOf(getForValue(sql,id_user,id_org).toString())>0)
            return true;
        else
            return false;
    }

    @Override
    public String getOrgName(int id_org){
        String sql1="select NAME from organization where ID_ORGANIZATION=?";
        String orgName = getForValue(sql1,id_org);
        System.out.println(orgName+"zz");
        return orgName;
    }
}
