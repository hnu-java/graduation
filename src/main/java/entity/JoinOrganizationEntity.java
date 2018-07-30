package entity;

import java.sql.Timestamp;

public class JoinOrganizationEntity {
    private int id_join_org;
    private int id_user;
    private int id_organization;
    private String org_name;
    private Timestamp date;
    private String message;
    private int status;
    private String user_name;

    public JoinOrganizationEntity(String user_name, int id_join_org, int id_user, int id_org, Timestamp date, String message, int status, String org_name, int id_organization) {
        this.id_join_org = id_join_org;
        this.id_user = id_user;
        this.id_organization = id_organization;
        this.date = date;
        this.message = message;
        this.status = status;
        this.org_name = org_name;
        this.user_name = user_name;
    }

    public JoinOrganizationEntity() {
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getId_organization() {
        return id_organization;
    }

    public void setId_organization(int id_organization) {
        this.id_organization = id_organization;
    }

    public String getOrg_name() {
        return org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public int getId_join_org() {
        return id_join_org;
    }

    public void setId_join_org(int id_join_org) {
        this.id_join_org = id_join_org;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
