package dao;

import entity.DocumentEntity;

import java.sql.Timestamp;
import java.util.List;

public interface DocumentDao {
    int create(int id_project, int version, Timestamp timestamp, int id_user,String name, int type);
    int create(int id_project, int version, Timestamp timestamp, int id_user);
    void deploy(int Id_Document);
    int getVersion(int id);
    DocumentEntity getOne(int id);
    List<DocumentEntity> getAll(int id);
    List<DocumentEntity> getAlltype(int id);
    List<DocumentEntity> getOnetype(int id,int type);
    int getDocumentId(int id_project);

    void delete(int Id_Document);
}
