package dao;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import entity.UserEntity;
import entity.postmailEntity;

public interface UserDao {
	boolean login(String name,String password);
	boolean payment(int id_user,int day);
	boolean proPayment(int id_user,int day);

	boolean registration(String name,String password1,String password2, String mail);
	boolean postmail(postmailEntity info, String title);
	boolean replacepassword(String name,String password2,String password3);

	boolean edit(String username,String qq,String address,String tel,String introduce,String gender);

	UserEntity getOne(String name) throws ParseException;

    List<UserEntity> getAll();
	int Mycollectcount(int id_user);

    int orgManager(int id);
    int projectNumberNow(int id);
	int projectNumberHistory(int id);
	int nowNews(int id);
	int Mpoint();
	List<UserEntity> getOrgAllMem(int user_id,String name);
	boolean nameAndMail(String name, String email);
	//找名字
	String FindName(int id_user);
}
