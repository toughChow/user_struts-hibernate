package com.qingshixun.project.service;

import java.util.Date;
import java.util.List;

import com.qingshixun.project.model.User;

public interface UserService {

	public void addStudent(User user);

	public List<User> getUserPage(int pageNo, int pageSize);

	public int getTotalPage(int pageSize);

	public User getUserById(int id);

	public void deleteUserById(int id);
	
	public void updateUser(User user);
	
	public int getGenderAmount(boolean flag);
	
	public List<Date> getAmmountByDate();
	
	public List<User> queryFromUser(String condition);
}
