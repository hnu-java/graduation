package entity;

import java.sql.Timestamp;

public class PointsRecordEntity {
    private int id_record;
    private int id_user;
    private String content;
    private Timestamp date;
    private String name;

    public int getId_record() {
        return id_record;
    }

    public void setId_record(int id_record) {
        this.id_record = id_record;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PointsRecordEntity() {
    }

    public PointsRecordEntity(int id_record, int id_user, String content, Timestamp date, String name) {
        this.id_record = id_record;
        this.id_user = id_user;
        this.content = content;
        this.date = date;
        this.name = name;
    }
}
