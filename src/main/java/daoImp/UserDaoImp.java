package daoImp;

import dao.DAO;
import dao.UserDao;
import entity.UserEntity;
import entity.postmailEntity;
import util.MailUtil;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by DELL on 2017/11/28.
 *
 * @author MJY
 */
public class UserDaoImp extends DAO<UserEntity> implements UserDao {
    public boolean login(String name,String password)
    {
        String sql="SELECT COUNT(*) from USER WHERE NAME=? and PASSWORD=?";
        String sql1="update user set ID_SESSION = 1 where NAME = ?";
        int count=Integer.valueOf(getForValue(sql,name,password).toString());
        if(count==1) {
            update(sql1,name);
            return true;
        }
        else return false;
    }

    public boolean exit(String name)
    {
        String sql1="update user set ID_SESSION = 0 where NAME = ?";
        update(sql1,name);
        return true;
    }

    public boolean onLine(String name)
    {
        String sql1="SELECT COUNT(*) from USER where NAME = ? and ID_SESSION = 1";
        int count=Integer.valueOf(getForValue(sql1,name).toString());
        if(count==1){
            return true;
        }
        else return false;
    }

    public boolean payment(int id_user,int day)
    {
        String sql="SELECT COUNT(*) from USER WHERE ID_USER=? and POINTS>=?";
        String sql8="select points from points_rule where id_rule = ?";
        int points = getForValue(sql8,2);
        int m_point = day/30*points;
        int count=Integer.valueOf(getForValue(sql,id_user,m_point).toString());
        if(count==1) {
            String sql1="update USER set points = points - ? WHERE ID_USER=?";
            update(sql1,m_point,id_user);
            try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            String tmp = sdf.format(date);
            java.text.SimpleDateFormat formatter = new  SimpleDateFormat( "yyyy-MM-dd");
            date = formatter.parse(tmp);
            Calendar c = Calendar.getInstance();
            c.setTime(date);
            c.add(Calendar.DATE,day);
            date = c.getTime();
            String sql2="update user set deadline = ? WHERE ID_USER=?";
            update(sql2,date,id_user);

            String sql3="insert into points_record(id_user,content,date) values(?,?,?)";
            Timestamp createDate = new Timestamp(new java.util.Date().getTime());
            String content = "于" + createDate + "消耗" + m_point + "积分，开通会员" + day + "天";
            update(sql3,id_user,content,createDate);
            } catch (ParseException e) {
            e.printStackTrace();
            }
            return true;
        }
        else return false;
    }

    public boolean checkMail(String  mail){
        String sql = "select count(*) from user where MAIL = ?";
        int count = Integer.valueOf(getForValue(sql,mail).toString());
        if(count >= 1){
            return false;
        }
        return true;
    }

    public int Mpoint(int id_rule){
        String sql = "select points from points_rule where id_rule = ?";
        int points = getForValue(sql,id_rule);
        return points;
    }

    public int msgNum(int id_user){
        String sql = "select COUNT(*) from message where id_user = ?";
        int msgNum= Integer.valueOf(getForValue(sql,id_user).toString());
        return msgNum;
    }

    public boolean proPayment(int id_user,int day)
    {
        String sql="SELECT COUNT(*) from USER WHERE ID_USER=? and POINTS>=?";
        String sql8="select points from points_rule where id_rule = ?";
        int points = getForValue(sql8,2);
        int m_point = day/30*points;
        int count=Integer.valueOf(getForValue(sql,id_user,m_point).toString());
        if(count==1) {
            String sql1="update USER set points = points - ? WHERE ID_USER=?";
            update(sql1,m_point,id_user);
            try {
                String date_sql="select deadline from USER WHERE ID_USER=?";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = getForValue(date_sql,id_user);
                String tmp = sdf.format(date);
                java.text.SimpleDateFormat formatter = new  SimpleDateFormat( "yyyy-MM-dd");
                date = formatter.parse(tmp);
                Calendar c = Calendar.getInstance();
                c.setTime(date);
                c.add(Calendar.DATE,day);
                date = c.getTime();
                String sql2="update user set deadline = ? WHERE ID_USER=?";
                update(sql2,date,id_user);

                String sql3="insert into points_record(id_user,content,date) values(?,?,?)";
                Timestamp createDate = new Timestamp(new java.util.Date().getTime());
                String content = "于" + createDate + "消耗" + m_point + "积分，开通会员" + day + "天";
                update(sql3,id_user,content,createDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return true;
        }
        else return false;
    }

    public boolean registration(String name, String password1, String password2, String mail) {
        String sql8="select points from points_rule where id_rule = ?";
        int points = getForValue(sql8,3);
        int days = getForValue(sql8,4);
        String sql = "insert into USER(NAME,PASSWORD,MAIL,POINTS,deadline) values(?,?,?,?,?)";
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                String tmp = sdf.format(date);
                java.text.SimpleDateFormat formatter = new  SimpleDateFormat( "yyyy-MM-dd");
                date = formatter.parse(tmp);
                Calendar c = Calendar.getInstance();
                c.setTime(date);
                c.add(Calendar.DATE,days);
                date = c.getTime();
                updateThrowException(sql, name, password1,mail,points,date);
            }catch (SQLException e) {
                e.printStackTrace();
                return false;
            }catch (ParseException e) {
                e.printStackTrace();
            }
        return true;
    }

    public boolean postmail(postmailEntity info, String title){
        if (Integer.parseInt(info.getContent())>=100000 && Integer.parseInt(info.getContent())<=999999){
            try {
                MailUtil.sendTextMail(info);
            } catch (Exception e) {
                System.out.print("'" + title + "'的邮件发送失败！");
                e.printStackTrace();
                return false;
            }
            return true;
        }
        else
            return false;
    }

    public boolean replacepassword(String name, String password2, String password3) {
        if (password2.equals(password3)) {
            String sql = "update USER set password=? where name=?";
            update(sql, password2, name);
            return true;
        } else return false;
    }

    public boolean nameAndMail(String name, String email) {
        String sql = "select count(*) from USER where name=? and MAIL=?";
        int count = Integer.valueOf(getForValue(sql, name, email).toString());
        if (count == 1)
            return true;
        else
            return false;
    }

    public boolean edit(String username, String qq, String address, String tel, String introduce, String gender) {
        String sql = "update USER set qq=?,address=?,tel=?,introduce=?,gender=? where name=?";
        System.out.println(username + qq + address  + tel + introduce + gender);
        update(sql, qq, address, tel, introduce, gender, username);
        return true;
    }

    public UserEntity getOne(String name) throws ParseException {
        String sql = "select * from USER where name=?";
        UserEntity user1 = get(sql, name);
//        String sql1="SELECT DATEDIFF(?,?) AS DiffDate";
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = new Date();
//        String tmp = sdf.format(date);
//        java.text.SimpleDateFormat formatter = new  SimpleDateFormat( "yyyy-MM-dd");
//        date = formatter.parse(tmp);
//        int res = Integer.valueOf(getForValue(sql1,user1.getDeadline(),date).toString());
//        user1.setDays(res);
        return user1;
    }
    public UserEntity getOne1(int id) {
        String sql = "select * from USER where ID_USER=?";
        UserEntity user1 = get(sql, id);
        return user1;
    }

    public List<UserEntity> getAll() {
        String sql = "select * from USER ";
        List<UserEntity> user1 = getForList(sql);
        return user1;
    }

    public int Mycollectcount(int id_user){
        String sql="SELECT COUNT(*) from LIB_COLLECT WHERE ID_USER=? ";
        int count=Integer.valueOf(getForValue(sql,id_user).toString());
        return count;
    }

    public int orgManager(int id){
        String sql="select count(*) from ORGANIZATION where ID_USER=?";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    @Override
    public int projectNumberNow(int id) {
        String sql="select count(*) from VIEW_projectMember where ID_USER=? and STATE=1";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    @Override
    public int projectNumberHistory(int id) {
        String sql="select count(*) from VIEW_projectMember where ID_USER=? and STATE=0";
        int count = Integer.valueOf(getForValue(sql,id).toString());
        return count;
    }

    @Override
    public int nowNews(int id) {
        String sql1="select count(*) from VIEW_PROJECT_APPLY where ID_USER=? and STATE=0";
        int count1 = Integer.valueOf(getForValue(sql1,id).toString());
        String sql2="select count(*) from VIEW_ORG_USER_APPLY where ID_USER=? and STATE=0";
        int count2 = Integer.valueOf(getForValue(sql2,id).toString());
        int count=count1+count2;
        return count;
    }

    @Override
    public List<UserEntity> getOrgAllMem(int user_id,String name){
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int id_org=getForValue(sql1,name);
        System.out.println(id_org);
        String sql2 = "select a.ID_USER,NAME,MAIL,TEL,STATU from user a,org_member b where a.ID_USER = b.ID_USER and ID_ORGANIZATION = ? and STATU != 1";
        List<UserEntity> list=getForList(sql2,id_org);
        return list;
    }
    @Override
    public String FindName(int id_user){
        String sql = "select NAME from USER where ID_USER=?";
        String name = getForValue(sql,id_user);
        return name;
    }

    @Override
    public int JudgmentOne(String user_name) {
        String sql="SELECT COUNT(*) from USER WHERE NAME=?";
        int count=Integer.valueOf(getForValue(sql,user_name).toString());
        if(count == 1){
            return count;
        }
        return 0;
    }
}
