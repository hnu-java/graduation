package dao;

import entity.sha_StructureEntity;

import java.util.List;

public interface sha_StructureDao {
    List<sha_StructureEntity> SelectMysha(String name);
    boolean ReleaseDelete(int id_structure);
    sha_StructureEntity getview(int id_structure);

    boolean deletemycollect(int id_share, int id_user);
    boolean Collect(int id_user, int id_share, String name);
    boolean notexist_collect(int id_user, int id_share);
    sha_StructureEntity getOne(int id);
    List<sha_StructureEntity> getMycollect(int id_user);
    List<sha_StructureEntity> getAll(int id_user);
    boolean eval(int id_structure, int eval);
    List<sha_StructureEntity> Search(int id_template);
    List<sha_StructureEntity> SearchCollect(int id, int id_template);
    List<sha_StructureEntity> SearchRelease(String name, int id_template);
    int getCollectcount();
}
