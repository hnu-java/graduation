package dao;

import entity.DocumentEntity;
import entity.SGroupEntity;
import entity.UserEntity;

import java.util.List;

public interface SGroupDao {
    SGroupEntity getOne(int id);
    UserEntity getPM(SGroupEntity g);
    int getRank(int idGroup,int idUser);
    int getId_sgroup(int idProject,int type);
    List<UserEntity> getMember(SGroupEntity s);
    boolean inviteMember(int idUser,int idSGroup, String content);
    boolean has(int idProject,int docType);
    List<SGroupEntity> getAll(int idProject);
    boolean setVersion(int version,int id);
    boolean alterPM(int idUser,int idSGroup);
}
