package com.qingshixun.project.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qingshixun.project.dao.UserDao;
import com.qingshixun.project.model.User;
import com.qingshixun.project.service.UserService;



@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public void addStudent(User user) {
		userDao.insertUser(user);
	}
	
	@Override
	public List<User> getUserPage(int pageNo, int pageSize){
		return userDao.getUsersPage(pageNo, pageSize);
		
	}

	@Override
	public int getTotalPage(int pageSize) {
		return userDao.getTotalPage(pageSize);
	}

	@Override
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	@Override
	public void deleteUserById(int id) {
		userDao.deleteUserById(id);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public int getGenderAmount(boolean flag) {
		return userDao.getGenderAmount(flag);
	}

	@Override
	public List<Date> getAmmountByDate() {
		return userDao.getAmmountByDate();
	}

	@Override
	public List<User> queryFromUser(String condition) {
		List<User> listTemp = userDao.queryFromUser(condition);
		
		List<User> list = new ArrayList<User>();
		for(int i = 0;i<listTemp.size();i++){
			if(!list.contains(listTemp.get(i))){
				list.add(listTemp.get(i));
			}
		}
		return list;
	}

}
