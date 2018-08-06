package entity;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Created by DELL on 2017/12/25.
 *
 * @author MJY
 */
public class ProDiscussEntity {
    private int id_pro_discuss;
    private int id_user;
    private String name;
    private int id_catalog;
    private  Date time;
    private String content;

    private int id_Project;
    private int id_Document;
    private int version;
    private int first_index;
    private int second_index;
    private int third_index;
    private int fourth_index;
    private int state;
    private String title;
    private String location;
    private List<File> MyFile;
    private List<String> MyFileFileName;
    private List<AccessoryEntity> accessoryEntityList;

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSecond_index() {
        return second_index;
    }

    public void setSecond_index(int second_index) {
        this.second_index = second_index;
    }

    public int getThird_index() {
        return third_index;
    }

    public void setThird_index(int third_index) {
        this.third_index = third_index;
    }

    public int getFourth_index() {
        return fourth_index;
    }

    public void setFourth_index(int fourth_index) {
        this.fourth_index = fourth_index;
    }

    public int getFirst_index() {
        return first_index;
    }

    public void setFirst_index(int first_index) {
        this.first_index = first_index;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public int getId_pro_discuss() {
        return id_pro_discuss;
    }

    public void setId_pro_discuss(int id_pro_discuss) {
        this.id_pro_discuss = id_pro_discuss;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_catalog() {
        return id_catalog;
    }

    public void setId_catalog(int id_catalog) {
        this.id_catalog = id_catalog;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_Project() {
        return id_Project;
    }

    public void setId_Project(int id_Project) {
        this.id_Project = id_Project;
    }

    public int getId_Document() {
        return id_Document;
    }

    public void setId_Document(int id_Document) {
        this.id_Document = id_Document;
    }

    public List<File> getMyFile() {
        return MyFile;
    }

    public void setMyFile(List<File> myFile) {
        MyFile = myFile;
    }

    public List<String> getMyFileFileName() {
        return MyFileFileName;
    }

    public void setMyFileFileName(List<String> myFileFileName) {
        MyFileFileName = myFileFileName;
    }

    public List<AccessoryEntity> getAccessoryEntityList() {
        return accessoryEntityList;
    }

    public void setAccessoryEntityList(List<AccessoryEntity> accessoryEntityList) {
        this.accessoryEntityList = accessoryEntityList;
    }

    public ProDiscussEntity(int id_pro_discuss, int id_user, String name, int id_catalog, Date time, String content, int id_Project, int id_Document, int version, int first_index, int second_index, int third_index, int fourth_index, int state, String title, String location, List<File> myFile, List<String> myFileFileName, List<AccessoryEntity> accessoryEntityList) {
        this.id_pro_discuss = id_pro_discuss;
        this.id_user = id_user;
        this.name = name;
        this.id_catalog = id_catalog;
        this.time = time;
        this.content = content;
        this.id_Project = id_Project;
        this.id_Document = id_Document;
        this.version = version;
        this.first_index = first_index;
        this.second_index = second_index;
        this.third_index = third_index;
        this.fourth_index = fourth_index;
        this.state = state;
        this.title = title;
        this.location = location;
        MyFile = myFile;
        MyFileFileName = myFileFileName;
        this.accessoryEntityList = accessoryEntityList;
    }

    public ProDiscussEntity() {
    }

    @Override
    public String toString() {
        return "ProDiscussEntity{" +
                "id_pro_discuss=" + id_pro_discuss +
                ", id_user=" + id_user +
                ", name='" + name + '\'' +
                ", id_catalog=" + id_catalog +
                ", time=" + time +
                ", content='" + content + '\'' +
                ", id_Project=" + id_Project +
                ", id_Document=" + id_Document +
                ", MyFile=" + MyFile +
                ", MyFileFileName=" + MyFileFileName +
                '}';
    }
}
