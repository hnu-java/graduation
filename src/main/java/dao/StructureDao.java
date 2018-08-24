package dao;
import java.util.List;
import entity.StructureEntity;
public interface StructureDao {
    List<StructureEntity> getAll(int id_library,int num1,int num2);
    int count(int id_library);

    List<StructureEntity> getAll(int id_library);

    boolean create(int id_library,String content);
    boolean edit(int id_structure,String content);
}
