package daoImp;

import dao.DAO;
import dao.PublishLibraryDao;
import entity.PublishLibraryEntity;

import java.sql.SQLException;
import java.sql.Timestamp;

public class PublishLibraryDaoImp extends DAO<PublishLibraryEntity> implements PublishLibraryDao {
    @Override
    public boolean publishLibrary(int id_library, String content) {
        String sql = "insert into lib_apply(ID_LIBRARY, DATE, CONTENT, STATUS) values(?, ?, ?, 0)";
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        update(sql, id_library, date, content);
        return true;
    }

    @Override
    public boolean repeatDetect(int id_library){
        String sql = "select count(*) from lib_apply where ID_LIBRARY = ?";
        int count=Integer.valueOf(getForValue(sql,id_library).toString());
        if (count == 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean officialDetect(int id_library) {
        String sql = "select count(*) from library where ID_LIBRARY = ? and FLAG = 1";
        int count=Integer.valueOf(getForValue(sql,id_library).toString());
        if (count == 1) {
            return true;
        }
        return false;
    }
}
