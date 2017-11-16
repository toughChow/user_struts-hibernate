package com.qingshixun.project.dao.Impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qingshixun.project.dao.UserDao;
import com.qingshixun.project.model.User;

@Transactional
@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;

	protected Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void insertUser(User user) {
		Session session = getCurrentSession();
		session.save(user);
	}

	@Override
	public List<User> getUsers() {
		Session session = getCurrentSession();
		return session.createQuery("From User").list();
	}

	@Override
	public List<User> getUsersPage(int pageNo, int pageSize) {
		Session session = getCurrentSession();
		Query query = session.createQuery("From User");
		query.setFirstResult((pageNo - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	public int getTotalPage(int pageSize) {
		Session session = getCurrentSession();
		Long rowsTemp = (Long) session.createQuery("Select count(id) from User").uniqueResult();
		int rows = rowsTemp.intValue();

		int temp = rows % pageSize;

		if (temp == 0)
			return rows / pageSize;
		else
			return rows / pageSize + 1;
	}

	@Override
	public User getUserById(int id) {
		Session session = getCurrentSession();
		User user = session.get(User.class, id);

		return user;
	}

	@Override
	public void deleteUserById(int id) {
		Session session = getCurrentSession();
		User user = session.get(User.class, id);
		session.delete(user);
	}

	@Override
	public void updateUser(User user) {
		Session session = getCurrentSession();
		session.update(user);
	}

	@Override
	public int getGenderAmount(boolean flag) {
		Session session = getCurrentSession();
		Query query = session.createQuery("SELECT COUNT(id) FROM User u WHERE u.gender = ?");
		Long ammount = (Long) query.setParameter(0, flag).uniqueResult();
		return ammount.intValue();
	}

	@Override
	public List<Date> getAmmountByDate() {
		Session session = getCurrentSession();
		
		Query query = session.createQuery("SELECT createTime FROM User");
		List<Date> list = query.list();
		for (Date date : list) {
			System.out.println(date);
		}
		return list;
	}

	@Override
	public List<User> queryFromUser(String condition) {
		Session session = getCurrentSession();
		Query query = session.createQuery("FROM User u WHERE u.username LIKE '%"+condition+"%'");
		List<User> list = query.list();
		
		Query query2 = session.createQuery("FROM User u WHERE u.id LIKE '%"+condition+"%'");
		query2.list();
		list.addAll(query2.list());
		
		Query query3 = session.createQuery("FROM User u WHERE u.email LIKE '%"+condition+"%'");
		query3.list();
		list.addAll(query3.list());
		
		return list;
	}

}
