package entity;

import java.util.Date;

public class OrganizationManagementEntity {
    private int ID_ORGANIZAITION;
    private String ORG_NAME;
    private int ID_USER;
    private Date TIME;
    private String NAME;
    private String MAIL;

    public OrganizationManagementEntity(int ID_ORGANIZAITION, String ORG_NAME, int ID_USER, Date TIME, String NAME, String MAIL) {
        this.ID_ORGANIZAITION = ID_ORGANIZAITION;
        this.ORG_NAME = ORG_NAME;
        this.ID_USER = ID_USER;
        this.TIME = TIME;
        this.NAME = NAME;
        this.MAIL = MAIL;
    }

    public OrganizationManagementEntity() {
    }

    public int getID_ORGANIZAITION() {
        return ID_ORGANIZAITION;
    }

    public void setID_ORGANIZAITION(int ID_ORGANIZAITION) {
        this.ID_ORGANIZAITION = ID_ORGANIZAITION;
    }

    public String getORG_NAME() {
        return ORG_NAME;
    }

    public void setORG_NAME(String ORG_NAME) {
        this.ORG_NAME = ORG_NAME;
    }

    public int getID_USER() {
        return ID_USER;
    }

    public void setID_USER(int ID_USER) {
        this.ID_USER = ID_USER;
    }

    public Date getTIME() {
        return TIME;
    }

    public void setTIME(Date TIME) {
        this.TIME = TIME;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getMAIL() {
        return MAIL;
    }

    public void setMAIL(String MAIL) {
        this.MAIL = MAIL;
    }
}
