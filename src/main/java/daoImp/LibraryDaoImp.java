package daoImp;

import dao.DAO;
import dao.LibraryDao;
import entity.LibraryEntity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class LibraryDaoImp extends DAO<LibraryEntity> implements LibraryDao{

    public LibraryEntity getOne(int id_library)
    {
        String sql="select * from view_lib where ID_LIBRARY=?";
        LibraryEntity library1=get(sql,id_library);
        return library1;
    }
    public List<LibraryEntity> getAll(int id_user,int num1,int num2)
    {
        String sql="select `view_lib`.`ID_LIBRARY` AS `ID_LIBRARY`,(`view_lib`.`ID_USER` * -(1)) AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME,`view_lib`.`TITLE` AS TITLE from `view_lib` where FLAG = 1 and (not(`view_lib`.`ID_LIBRARY` in (select `LIB_COLLECT`.`ID_LIBRARY` from `LIB_COLLECT` where (`LIB_COLLECT`.`ID_USER` = ?)))) union select `LIB_COLLECT`.`ID_LIBRARY` AS `ID_LIBRARY`,`LIB_COLLECT`.`ID_USER` AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME ,`view_lib`.`TITLE` AS TITLE from (`LIB_COLLECT` left join `view_lib` on((`LIB_COLLECT`.`ID_LIBRARY` = `view_lib`.`ID_LIBRARY`))) where (`LIB_COLLECT`.`ID_USER` =? ) order by `ID_LIBRARY` limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,id_user,id_user,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getCommon(int id_user,int num1,int num2)
    {
        String sql="select `view_lib`.`ID_LIBRARY` AS `ID_LIBRARY`,(`view_lib`.`ID_USER` * -(1)) AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME,`view_lib`.`TITLE` AS TITLE from `view_lib` where FLAG = 1 and (not(`view_lib`.`ID_LIBRARY` in (select `LIB_COLLECT`.`ID_LIBRARY` from `LIB_COLLECT` where (`LIB_COLLECT`.`ID_USER` = ?)))and `view_lib`.`ID_TEMPLATE`=1) union select `LIB_COLLECT`.`ID_LIBRARY` AS `ID_LIBRARY`,`LIB_COLLECT`.`ID_USER` AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME ,`view_lib`.`TITLE` AS TITLE from (`LIB_COLLECT` left join `view_lib` on((`LIB_COLLECT`.`ID_LIBRARY` = `view_lib`.`ID_LIBRARY`))) where (`LIB_COLLECT`.`ID_USER` = ? and `view_lib`.`ID_TEMPLATE`=1) order by `ID_LIBRARY` limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,id_user,id_user,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getUser(int id_user,int num1,int num2)
    {
        String sql="select `view_lib`.`ID_LIBRARY` AS `ID_LIBRARY`,(`view_lib`.`ID_USER` * -(1)) AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME,`view_lib`.`TITLE` AS TITLE from `view_lib` where FLAG = 1 and (not(`view_lib`.`ID_LIBRARY` in (select `LIB_COLLECT`.`ID_LIBRARY` from `LIB_COLLECT` where (`LIB_COLLECT`.`ID_USER` = ?)))and `view_lib`.`ID_TEMPLATE`=2) union select `LIB_COLLECT`.`ID_LIBRARY` AS `ID_LIBRARY`,`LIB_COLLECT`.`ID_USER` AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME ,`view_lib`.`TITLE` AS TITLE from (`LIB_COLLECT` left join `view_lib` on((`LIB_COLLECT`.`ID_LIBRARY` = `view_lib`.`ID_LIBRARY`))) where (`LIB_COLLECT`.`ID_USER` = ? and `view_lib`.`ID_TEMPLATE`=2) order by `ID_LIBRARY` limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,id_user,id_user,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getCase(int id_user,int num1,int num2)
    {
        String sql="select `view_lib`.`ID_LIBRARY` AS `ID_LIBRARY`,(`view_lib`.`ID_USER` * -(1)) AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME,`view_lib`.`TITLE` AS TITLE from `view_lib` where FLAG = 1 and (not(`view_lib`.`ID_LIBRARY` in (select `LIB_COLLECT`.`ID_LIBRARY` from `LIB_COLLECT` where (`LIB_COLLECT`.`ID_USER` = ?)))and `view_lib`.`ID_TEMPLATE`=3) union select `LIB_COLLECT`.`ID_LIBRARY` AS `ID_LIBRARY`,`LIB_COLLECT`.`ID_USER` AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME ,`view_lib`.`TITLE` AS TITLE from (`LIB_COLLECT` left join `view_lib` on((`LIB_COLLECT`.`ID_LIBRARY` = `view_lib`.`ID_LIBRARY`))) where (`LIB_COLLECT`.`ID_USER` = ? and `view_lib`.`ID_TEMPLATE`=3) order by `ID_LIBRARY` limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,id_user,id_user,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getPicture(int id_user,int num1,int num2)
    {
        String sql="select `view_lib`.`ID_LIBRARY` AS `ID_LIBRARY`,(`view_lib`.`ID_USER` * -(1)) AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME,`view_lib`.`TITLE` AS TITLE from `view_lib` where FLAG = 1 and (not(`view_lib`.`ID_LIBRARY` in (select `LIB_COLLECT`.`ID_LIBRARY` from `LIB_COLLECT` where (`LIB_COLLECT`.`ID_USER` = ?)))and `view_lib`.`ID_TEMPLATE`=4) union select `LIB_COLLECT`.`ID_LIBRARY` AS `ID_LIBRARY`,`LIB_COLLECT`.`ID_USER` AS `ID_USER`,`view_lib`.`NAME` AS `NAME`,`view_lib`.`ID_TEMPLATE` AS `ID_TEMPLATE`,`view_lib`.`MENTION` AS `MENTION`,`view_lib`.`TIME` AS `TIME`,`view_lib`.`COLLECT_NUM` AS `COLLECT_NUM`,`view_lib`.`USER_NAME` AS USER_NAME ,`view_lib`.`TITLE` AS TITLE from (`LIB_COLLECT` left join `view_lib` on((`LIB_COLLECT`.`ID_LIBRARY` = `view_lib`.`ID_LIBRARY`))) where (`LIB_COLLECT`.`ID_USER` = ? and `view_lib`.`ID_TEMPLATE`=4) order by `ID_LIBRARY` limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,id_user,id_user,num1,num2);
        return library1;
    }

    public int getAllcount()
    {
        String sql="select count(*) from LIBRARY";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }

    public int getCommoncount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=1";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }

    @Override
    public int getNowcount(int id_user) {
        String sql="select count(*) from LIBRARY where ID_USER = ?";
        int count=Integer.valueOf(getForValue(sql,id_user).toString());
        return count;
    }

    public int getUsercount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=2";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }
    public int getCasecount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=3";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }
    public int getPicturecount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=4";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }


    public List<LibraryEntity> getMycollect(int id_user,int num1,int num2)
    {
        String sql="SELECT LIB_COLLECT.ID_USER,view_lib.ID_LIBRARY,view_lib.`NAME`,view_lib.ID_TEMPLATE,view_lib.COLLECT_NUM,view_lib.TIME,view_lib.MENTION FROM LIB_COLLECT INNER JOIN view_lib ON LIB_COLLECT.ID_LIBRARY = view_lib.ID_LIBRARY where LIB_COLLECT.ID_USER=? limit ?,?";
        List<LibraryEntity> librarycollect1=getForList(sql,id_user,num1,num2);
        return librarycollect1;
    }

    @Override
    public List<LibraryEntity> getUserAll(int id_user, int num1, int num2) {
        String sql="select * from `view_lib` where ID_USER = ? order by `ID_LIBRARY` limit ?,? " ;
        List<LibraryEntity> library1=getForList(sql,id_user,num1,num2);
        return library1;
    }

    public int getMycollectcount(int id_user)
    {
        String sql="select count(*) from LIB_COLLECT where ID_USER=?";
        int count=Integer.valueOf(getForValue(sql,id_user).toString());
        return count;
    }

    @Override
    public List<LibraryEntity> getTypeOfLib(int id_user, int id_type) {
        String sql="select * from VIEW_LIB_COLLECT_JOIN_LIBRARY where id_user=? and id_template=?";
        return getForList(sql,id_user,id_type);
    }

    @Override
    public List<LibraryEntity> getTypeOfUserLib(int id_user, int id_type,int id_project) {
        String sql="select * from library where id_template=? and ID_USER=any(select ID_USER from project_member where ID_PROJECT = ?)";
        return getForList(sql,id_type,id_project);
    }

    @Override
    public List<LibraryEntity> getTypeOfOneLib(int id_user, int id_type) {
        String sql="select * from library where id_template=? and ID_USER=?";
        return getForList(sql,id_type,id_user);
    }


    @Override
    public boolean newLibrary(String name, int id_user, int id_template, String mention) {
        String sql = "insert into library(NAME,ID_TEMPLATE,ID_USER,TIME,MENTION) value(?,?,?,?,?)";
        Date date = new Date();
        try {
            update(sql,name,id_template,id_user,date,mention);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteLibrary(int id_library) {
        String sql = "delete from library where ID_LIBRARY = ?";
        update(sql, id_library);
        return true;
    }

}
