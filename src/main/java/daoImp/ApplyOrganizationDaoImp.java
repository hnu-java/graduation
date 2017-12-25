package daoImp;

import dao.ApplyOrganizationDao;
import dao.DAO;
import entity.ApplyOrganizationEntity;
import entity.ShowApplyOrganizationEntity;
import java.sql.Date;
import java.util.List;


public class ApplyOrganizationDaoImp extends DAO<ApplyOrganizationEntity> implements ApplyOrganizationDao{

    @Override
    public boolean applyOrg(int id,ApplyOrganizationEntity apply) {
        String sql="insert into ORG_APPLY(ID_USER,ORG_NAME,DATE,MESSAGE,TEL) values(?,?,?,?,?)";
        System.out.println("location:applyOrgimp");
        Date createDate = new Date(new java.util.Date().getTime());
        System.out.println(apply.getOrg_name()+" "+createDate);
        update(sql,id,apply.getOrg_name(),createDate,apply.getMessage(),apply.getTel());
        return true;
    }
    @Override
    public boolean createOrg(ApplyOrganizationEntity create) {
        String sql1="update ORG_APPLY set STATE=1 where ORG_NAME=?";
        String sql2="insert into ORGANIZATION (NAME,ID_USER,TIME) value(?,?,?)";
        Date NowTime = new Date(new java.util.Date().getTime());
        update(sql1,create.getOrg_name());
        update(sql2,create.getOrg_name(),create.getId_user(),NowTime);
        return true;
    }
}