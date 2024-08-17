package com.xhu.computermall.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.computermall.dao.mapper.UserMapper;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public User findUser(String mobile, String pwd) {
		User record = new User();
		record.setMobile(mobile);
		record.setPwd(pwd);
		List<User> ret = mapper.select(record);
		if(ret == null || ret.size() == 0) {
			return null;
		}else {
			return ret.get(0);
		}
	}

	@Override
	public void saveUser(User user) {
		mapper.insertSelective(user);
	}

	@Override
	public void updateUser(User user) {
		mapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public void deleteUser(Integer uid) {
		mapper.deleteByPrimaryKey(uid);
	}

	@Override
	public List<User> findUsers(int start, int end) {
		return mapper.selectByRowBounds(new User(), new RowBounds(start, end));
	}

	@Override
	public Integer findUserCount() {
		return mapper.selectCount(new User());
	}

	@Override
	public User findUser(Integer uid) {
		return mapper.selectByPrimaryKey(uid);
	}

}
