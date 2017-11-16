package com.qingshixun.project.dao;

import java.util.Date;
import java.util.List;

import com.qingshixun.project.model.User;

public interface UserDao {

	public void insertUser(User user);
	
	public List<User> getUsers();
	
	public List<User> getUsersPage(int pageNo,int pageSize);
	
	public int getTotalPage(int pageSize);
	
	public User getUserById(int id);
	
	public void deleteUserById(int id);
	
	public void updateUser(User user);
	
	public int getGenderAmount(boolean flag);
	
	public List<Date> getAmmountByDate();
	
	public List<User> queryFromUser(String condition); 
}
