package dao;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import entity.UserEntity;
import entity.postmailEntity;

public interface UserDao {
	boolean login(String name,String password);
	boolean exit(String name);
	boolean onLine(String name);
	boolean payment(int id_user,int day);
	boolean proPayment(int id_user,int day);
	boolean checkMail(String mail);
	boolean registration(String name,String password1,String password2, String mail,Date registrationtime);
	boolean postmail(postmailEntity info, String title);
	boolean replacepassword(String name,String password2,String password3);

	boolean edit(String username,String qq,String realname,String address,String tel,String introduce,String gender);

	UserEntity getOne(String name) throws ParseException;
	UserEntity getOne1(int id_user) throws ParseException;
    List<UserEntity> getAll();

    int orgManager(int id);
    int projectNumberNow(int id);
	int projectNumberHistory(int id);
	int nowNews(int id);
	int Mpoint(int id_rule);
	int msgNum(int id_user);
	List<UserEntity> getOrgAllMem(int user_id,String name);
	boolean nameAndMail(String name, String email);
	//找名字
	String FindName(int id_user);
	int JudgmentOne(String user_name);

	boolean changepwd(String oldpwd, String newpwd, String username);
	boolean points_enough(int id_user,int point);
	boolean pay(int id_user,int id_publisher,int point);
}
