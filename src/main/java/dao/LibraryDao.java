package dao;
import java.util.List;
import entity.LibraryEntity;

public interface LibraryDao {
    LibraryEntity getOne(int id_library);

    List<LibraryEntity> getAll(int id_user,int num1,int num2);

    List<LibraryEntity> getCommon(int id_user,int num1,int num2);

    List<LibraryEntity> getUser(int id_user,int num1,int num2);

    List<LibraryEntity> getCase(int id_user,int num1,int num2);

    List<LibraryEntity> getPicture(int id_user,int num1,int num2);

    List<LibraryEntity> getMycollect(int id_user,int num1,int num2);

    List<LibraryEntity> getUserAll(int id_user,int num1,int num2);
    int getMycollectcount(int id_user);

    int getAllcount();
    int getUsercount();
    int getCasecount();
    int getPicturecount();
    int getCommoncount();
    int getNowcount(int id_user);
    List<LibraryEntity> getTypeOfLib(int id_user,int id_type);
    List<LibraryEntity> getTypeOfUserLib(int id_user,int id_type,int id_project);
    List<LibraryEntity> getTypeOfOneLib(int id_user,int id_type);
    boolean newLibrary(String name,int id_user,int id_template,String mention);
    boolean deleteLibrary(int id_library);
}
