//        Created by IntelliJ IDEA.
//        User: wwc
//        Date: 22/12/2017
//        Time: 15:55

package daoImp;

import dao.DAO;
import dao.PersonalCenterDao;
import entity.PersonalCenterEntity;
import entity.UserEntity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PersonalCenterDaoImp extends DAO<PersonalCenterEntity> implements PersonalCenterDao {

    @Override
    public List<PersonalCenterEntity> getAll(int ID) {
        String sql = "select * from view_org_user where ID_ORGANIZATION = any(select ID_ORGANIZATION from org_member where ID_USER = ?)";
        List list = new ArrayList();
        list = getForList(sql,ID);
        return list;
    }

    @Override
    public boolean quitorg(int ID,int ID_ORG){
        String sql0 = "select ID_USER from ORGANIZATION where ID_ORGANIZATION = ?";
        int ID_USER = getForValue(sql0,ID_ORG);
        if(ID == ID_USER){
            return false;
        }
        else{
            String sql1 = "delete from ORG_MEMBER where ID_USER = ? and ID_ORGANIZATION = ?";
            String sql2 = "select * from view_org_user where ID_ORGANIZATION = ?";
            String sql3 = "insert into MESSAGE (ID_USER,CONTENT,DATE,ID_ORG) values(?,?,?,?)";
            String sql4 = "select NAME from user where ID_USER = ?";
            PersonalCenterEntity orgInfo = get(sql2,ID_ORG);
            String user_name = getForValue(sql4,ID);
            String content1="您退出了机构"+orgInfo.getORG_NAME();
            String content2=user_name+"退出了您的机构"+orgInfo.getORG_NAME();
            Timestamp NowTime = new Timestamp(new java.util.Date().getTime());
            update(sql3,ID,content1,NowTime,ID_ORG);
            update(sql3,orgInfo.getID_USER(),content2,NowTime,ID_ORG);
            System.out.println("out of Org");
            update(sql1,ID, ID_ORG);
            return true;
        }
    };
}
