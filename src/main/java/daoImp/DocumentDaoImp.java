package daoImp;

import dao.DAO;
import dao.DocumentDao;
import entity.DocumentEntity;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class DocumentDaoImp extends DAO<DocumentEntity> implements DocumentDao {
    @Override
    public int create(int id_project, int version, Timestamp timestamp, int id_user, String DocName, int type) {
        String sql = "insert into DOCUMENT(ID_PROJECT, VERSION, DATE, ID_USER, TYPE, DOCUMENT_NAME) VALUES (?,?,?,?,?,?)";
        String sql1="select points from points_rule where id_rule = ?";
        String sql2="update USER set points = points - ? WHERE ID_USER=?";
        String sql3="insert into points_record(id_user,content,date) values(?,?,?)";
        String sql4="select name from project where id_project = ?";
        String sql6 = "insert into SGROUP(DOC_TYPE, ID_PROJECT, ID_USER, VERSION, DATE) VALUES (?,?,?,?,?)";
        String sql7 = "insert into SGROUP_MEMBER(ID_SGROUP, ID_USER, RANK) VALUES (?,?,?)";
        //String sql5="select document_name from project where id_project = ?";
        Timestamp createDate = new Timestamp(new java.util.Date().getTime());
        try {
            int id =  insert(sql,id_project,version,timestamp,id_user,type,DocName);
            //创建小组
            int id_sgroup = insert(sql6,type,id_project,id_user,version,timestamp);
            //小组长
            updateThrowException(sql7,id_sgroup,id_user,3);
            //扣分，记录
            int points = getForValue(sql1,5);
            update(sql2,points,id_user);
            String name = (String)getForValue(sql4,id_project);
            //String doc_name = (String)getForValue(sql5,id_project);
            String content = "于" + createDate + "消耗" + points + "积分，创建“" + name +"”项目的“" + DocName + "”文档";
            update(sql3,id_user,content,createDate);
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void deploy(int Id_Document) {
        String sql = "update DOCUMENT set state = 1 where ID_DOCUMENT = ?";
        update(sql,Id_Document);
    }

    @Override
    public int getVersion(int id) {
        try {
            String sql = "select max(VERSION) from DOCUMENT where ID_PROJECT = ?";
            int version = Integer.valueOf(getForValue(sql,id).toString());
            return version;
        }
        catch (Exception e){
            return 0;
        }


    }

    @Override
    public DocumentEntity getOne(int id) {
        String sql = "select * from DOCUMENT where ID_DOCUMENT = ?";
        DocumentEntity document = get(sql,id);
        return document;
    }
    @Override
    public List<DocumentEntity> getAll(int id) {
        String sql = "select * from VIEW_projectDocs where ID_PROJECT = ?";
        List<DocumentEntity> list = getForList(sql,id);
        return list;
    }

    @Override
    public List<DocumentEntity> getAlltype(int id) {
        String sql = "select * from DOCUMENT where ID_PROJECT = ? and STATE = 0";
        List<DocumentEntity> list = getForList(sql,id);
        return list;
    }

    @Override
    public int getDocumentId(int id_project) {
        try {
            String sql="select max(ID_DOCUMENT) from DOCUMENT where ID_PROJECT=? ";
            int id_document = Integer.valueOf(getForValue(sql,id_project).toString());
            return  id_document;
        }
        catch (Exception e)
        {
            return -1;
        }
    }

    @Override
    public void delete(int Id_Document) {
        String sql="delete from DOCUMENT where id_document=?";
        update(sql,Id_Document);
    }
}
