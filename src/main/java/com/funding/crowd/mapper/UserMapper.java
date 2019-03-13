package com.funding.crowd.mapper;

import com.funding.crowd.pojo.User;

/*
 * 用户业务逻辑
 * 
 */
public interface UserMapper {

	/*
	 * 注册功能
	 * @param:user
	 */
	void signup(User user) ;

	int signin(User user);

	void submitinfo(User user);
}
