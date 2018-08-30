package dao;

public interface PublishLibraryDao {
    boolean publishLibrary(int id_library, String content);
    boolean repeatDetect(int id_library);
    boolean officialDetect(int id_library);
}
