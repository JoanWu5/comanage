package com.funding.crowd.service;

import com.funding.crowd.pojo.User;

public interface UserService {

	void signup(User user);

	int signin(User user);

	void submitinfo(User user);

	
}
