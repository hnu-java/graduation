package entity;

import java.sql.Date;
import java.util.List;


public class StructureEntity {
    private int id_structure;
    private int id_user;
    private String name;
    private int id_template;
    private String date;
    private String content;
    private int flag;
    private String title;
    private String state;
    private int purchasepoints;

    public StructureEntity() {
    }

    public StructureEntity(int id_structure, int id_user, String name, int id_template, String date, String content, int flag, String title, String State, int purchasepoints) {
        this.id_structure = id_structure;
        this.content = content;
        this.id_user = id_user;
        this.name = name;
        this.id_template = id_template;
        this.date = date;
        this.flag = flag;
        this.title = title;
        this.state = state;
        this.purchasepoints = purchasepoints;
    }

    public int getPurchasepoints(){ return purchasepoints; }

    public void setPurchasepoints(int purchasepoints) { this.purchasepoints = purchasepoints; }

    public int getId_user() { return id_user; }

    public void setId_user(int id_user) { this.id_user = id_user; }

    public int getId_structure() { return id_structure; }

    public void setId_structure(int id_structure) { this.id_structure = id_structure; }

    public String getContent() { return content; }

    public void setContent(String content) { this.content = content; }

    public String getName() { return name;}

    public void setName(String name) { this.name = name; }

    public int getId_template() { return id_template; }

    public void setId_template(int id_template) { this.id_template = id_template; }

    public String getDate() { return date; }

    public void setDate(String date) { this.date = date; }

    public int getFlag() { return flag; }

    public void setFlag(int flag) { this.flag = flag; }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getState() { return state; }

    public void setState(String state) { this.state = state; }
}
