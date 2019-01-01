package dao;
import entity.StructureEntity;

import java.util.List;

public interface StructureDao {

    boolean create(String name, int id_user, int id_template);
    boolean Mydelete(int id_structure, int flag);
    List<StructureEntity> SelectAll(int id);
    List<StructureEntity> Search(int id, int id_template);
    StructureEntity deploy(int id_structure);
    boolean deploysure(int id_structure, int purchasepoints);
    StructureEntity Edit(int id_structure, String content);
    boolean edit(int id_structure, String content);
    List<StructureEntity> getAll2(int id_template);
    List<StructureEntity> getAll(int id_template);
    int count(int id_template);
    boolean create2(int id_template, String content);

}
