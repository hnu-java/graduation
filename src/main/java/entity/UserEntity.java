package entity;

import java.util.Date;

/**
 * Created by DELL on 2017/11/28.
 *
 * @author MJY
 */
public class UserEntity {
    private int id_user;
    private int verification;
    private String password;
    private String name;
    private String gender;
    private String address;
    private String introduce;
    private java.sql.Date dob;
    private String mail;
    private String qq;
    private String tel;
    private int status;
    private int rank;
    private int flag;
    private int points;
    private Date deadline;
    private int days;
    private String photo;
    private int id_session;

    public int getId_session() {
        return id_session;
    }

    public void setId_session(int id_session) {
        this.id_session = id_session;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getVerification() {
        return verification;
    }

    public void setVerification(int verification) {
        this.verification = verification;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public java.sql.Date getDob() {
        return dob;
    }

    public void setDob(java.sql.Date dob) {
        this.dob = dob;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public UserEntity(int id_user, int verification, String password, String name, String gender, String address, String introduce, java.sql.Date dob, String mail, String qq, String tel, int status, int rank, int flag, int points, Date deadline, int days, String photo, int id_session) {
        this.id_user = id_user;
        this.verification = verification;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.introduce = introduce;
        this.dob = dob;
        this.mail = mail;
        this.qq = qq;
        this.tel = tel;
        this.status = status;
        this.rank = rank;
        this.flag = flag;
        this.points = points;
        this.deadline = deadline;
        this.days = days;
        this.photo = photo;
        this.id_session = id_session;
    }

    public UserEntity() {
    }
}