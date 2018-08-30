package entity;

import java.sql.Timestamp;

public class PublishLibraryEntity {
    private int id_library;
    private Timestamp date;
    private String content;
    private int status;

    public PublishLibraryEntity(int id_library, Timestamp date, String content, int status) {
        this.id_library = id_library;
        this.date = date;
        this.content = content;
        this.status = status;
    }

    public PublishLibraryEntity() {
    }

    public int getId_library() {
        return id_library;
    }

    public void setId_library(int id_library) {
        this.id_library = id_library;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
