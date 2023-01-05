package com.nagarro.assignment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nagarro.assignment.dao.Userdao;
import com.nagarro.assignment.model.User;

@Service
public class UserService {

	@Autowired
	private Userdao userDao;

	public boolean getUser(User user) {
	
		return this.userDao.checkUser(user);
	}

}
