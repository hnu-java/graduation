package daoImp;

import dao.ApplyOrganizationDao;
import dao.DAO;
import entity.ApplyOrganizationEntity;

import java.sql.SQLException;
import java.sql.Timestamp;


public class ApplyOrganizationDaoImp extends DAO<ApplyOrganizationEntity> implements ApplyOrganizationDao{

    @Override
    public boolean applyOrg(int id,ApplyOrganizationEntity apply) {
        String sql="insert into ORG_APPLY(ID_USER,ORG_NAME,DATE,MESSAGE,TEL) values(?,?,?,?,?)";
        String sql1="select COUNT(*) from organization where name = ?";
        //String sql2="select COUNT(*) from org_apply where org_name = ?";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        int count=Integer.valueOf(getForValue(sql1,apply.getOrg_name()).toString());
        //int count1=Integer.valueOf(getForValue(sql2,apply.getOrg_name()).toString());
        if(count ==1){
            return false;
        }
        try {
            updateThrowException(sql,id,apply.getOrg_name(),createDate,apply.getMessage(),apply.getTel());
        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean alreadyApp(int id,ApplyOrganizationEntity apply){
        String sql="select COUNT(*) from org_apply where org_name = ? and id_user = ? and state = 0";
        int count=Integer.valueOf(getForValue(sql,apply.getOrg_name(),id).toString());
        if(count ==1){
            return true;
        }
        return false;
    }
}
