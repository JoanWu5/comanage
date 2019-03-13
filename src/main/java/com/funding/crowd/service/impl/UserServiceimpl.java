package com.funding.crowd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.crowd.mapper.UserMapper;
import com.funding.crowd.pojo.User;
import com.funding.crowd.service.UserService;

@Service
public class UserServiceimpl implements UserService{

	@Autowired
	private UserMapper usermapper;

	@Override
	public void signup(User user) {
		usermapper.signup(user);
		
	}

	@Override
	public int signin(User user) {
		return usermapper.signin(user);
	}

	@Override
	public void submitinfo(User user) {
		// TODO Auto-generated method stub
		usermapper.submitinfo(user);
	}
	
}
