package entity;

import java.sql.Date;

public class SGroupEntity {
    private int id_sgroup;
    private int doc_type;
    private int id_project;
    private int id_user;
    private int version;
    private Date date;
    private String username;

    public SGroupEntity(int id_sgroup, int doc_type, int id_project, int id_user, int version, Date date, String username) {
        this.id_sgroup = id_sgroup;
        this.doc_type = doc_type;
        this.id_project = id_project;
        this.id_user = id_user;
        this.version = version;
        this.date = date;
        this.username = username;
    }

    public SGroupEntity() {
    }

    public int getId_sgroup() {
        return id_sgroup;
    }

    public void setId_sgroup(int id_sgroup) {
        this.id_sgroup = id_sgroup;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public int getDoc_type() {
        return doc_type;
    }

    public void setDoc_type(int doc_type) {
        this.doc_type = doc_type;
    }

    public int getId_project() {
        return id_project;
    }

    public void setId_project(int id_project) {
        this.id_project = id_project;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
}
