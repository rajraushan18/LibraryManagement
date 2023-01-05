package com.nagarro.assignment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nagarro.assignment.model.User;

@Repository
public class Userdao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public boolean checkUser(User user) {
		
		User new_user = new User();
		new_user.setUserid("admin");
		new_user.setPassword("admin123");
		this.hibernateTemplate.save(new_user);

		List<User> user_list = hibernateTemplate.loadAll(User.class);
		for (User u : user_list) {
			if (u.getUserid().equalsIgnoreCase(user.getUserid())
					&& u.getPassword().equalsIgnoreCase(user.getPassword())) {
				return true;
			}
		}
		return false;
	}
}
