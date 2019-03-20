package dao;

import entity.ProjectEntity;
import entity.ShowOrgProjectEntity;

import entity.UserEntity;
import java.util.List;

public interface ProjectDao {
    boolean save(ProjectEntity p);
    UserEntity getPM(ProjectEntity p);
    List<UserEntity> getMember(ProjectEntity p);
    List<UserEntity> getMatched(ProjectEntity p, String name);

    boolean alterPM(int idUser,int idProject);
    void setVPM(int idUser,int idProject);
    void dismissVPM(int idUser,int idProject);
    void deleteMember(int idUser,int idProject);
    boolean inviteMember(int idUser,int idProject, String content);
    void end(int idProject);
    int getRank(int idProject,int idUser);
    ProjectEntity getOne(int id);
    List<ProjectEntity> getAll(int state,int id);
    String findName(int id_Project);        //获取项目ID对应的NAME
    String findAdminName(int id_project);
    boolean copyAll(int id_document,int new_idDocument,int version);

    boolean modified(int flag,int id_project);
    boolean exist(String org_name);
    boolean belong(String org_name,int id_user);
    boolean isIn(int id_user,int id_project);
}
