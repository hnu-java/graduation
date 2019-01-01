package entity;

import java.util.Date;

public class sha_StructureEntity {
    private int id_structure;
    private int ID_share;
    private String name;
    private int id_template;
    private int PurchasePoint;
    private int id_user;
    private int PurchaseTimes;
    private String mention;
    private Date ReleaseTime;
    private Date PurchaseTime;
    private int flag;
    private String user_name;
    private String title;
    private String content;
    private int evalt;
    private double evalp;

    public int getEvalt() { return evalt; }

    public void setEvalt(int evalt) { this.evalt =evalt; }

    public double getEvalp() { return evalp; }

    public void setEvalp(double evalp) { this.evalp =evalp; }

    public int getId_structure() { return id_structure; }

    public void setId_structure(int id_structure) { this.id_structure = id_structure; }

    public int getID_share() { return ID_share; }

    public void setID_share(int ID_share) { this.ID_share = ID_share; }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_template() {
        return id_template;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }

    public int getPurchasePoint() { return PurchasePoint; }

    public void setPurchasePoint(int purchasePoint) { this.PurchasePoint = purchasePoint; }

    public int getPurchaseTimes() { return PurchaseTimes; }

    public void setPurchaseTimes(int purchaseTimes) { this.PurchaseTimes = purchaseTimes; }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }


    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

    public Date getPurchaseTime() { return PurchaseTime; }

    public void setPurchaseTime(Date purchaseTime) { this.PurchaseTime = purchaseTime; }

    public Date getReleaseTime() { return ReleaseTime; }

    public void setReleaseTime(Date releaseTime) { this.ReleaseTime = releaseTime; }

    public int getFlag() { return flag; }

    public void setFlag(int flag) { this.flag = flag; }

    public String getUser_name() { return user_name; }

    public void setUser_name(String user_name) { this.user_name = user_name; }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }

    public void setContent(String content) { this.content = content; }

    public sha_StructureEntity(int id_structure, String name, int  PurchaseTimes, Date ReleaseTime, String user_name, String title, String content, int id_template, int id_user, String mention, int flag ) {
        this.id_structure = id_structure;
        this.name = name;
        this.PurchaseTimes = PurchaseTimes;
        this.ReleaseTime = ReleaseTime;
        this.user_name = user_name;
        this.title = title;
        this.content = content;
        this.id_template = id_template;
        this.id_user = id_user;
        this.mention = mention;
        this.flag = flag;
    }

    public sha_StructureEntity() {
    }
}
