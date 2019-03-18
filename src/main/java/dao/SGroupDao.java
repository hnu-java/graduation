package dao;

import entity.SGroupEntity;
import entity.UserEntity;

public interface SGroupDao {
    SGroupEntity getOne(int id);
    UserEntity getPM(SGroupEntity g);
    int getRank(int idGroup,int idUser);
    int getId_sgroup(int idProject,int type);
}
