package entity;

import java.sql.Timestamp;

public class OrgListEntity {
    int id_user;
    int statu;
    int id_organization;
    String org_name;
    String name;
    String mail;
    String tel;

    public OrgListEntity(int id_user, int statu, int id_organization, String org_name, Timestamp time, String name, String mail, String tel) {
        this.id_user = id_user;
        this.statu = statu;
        this.id_organization = id_organization;
        this.org_name = org_name;
        this.name = name;
        this.mail = mail;
        this.tel = tel;
    }

    public OrgListEntity() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getStatu() {
        return statu;
    }

    public void setStatu(int statu) {
        this.statu = statu;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
