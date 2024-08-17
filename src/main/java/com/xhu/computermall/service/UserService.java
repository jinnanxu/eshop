package com.xhu.computermall.service;

import java.util.List;

import com.xhu.computermall.dao.model.User;

public interface UserService {

	User findUser(String mobile, String pwd);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteUser(Integer uid);
	
	List<User> findUsers(int start, int end);
	
	Integer findUserCount();
	
	User findUser(Integer uid);
}
