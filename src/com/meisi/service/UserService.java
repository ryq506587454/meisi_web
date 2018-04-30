package com.meisi.service;
/*
 * 用户业务层
 */

import java.util.List;

import com.meisi.bean.User;
import com.meisi.dao.UserDao;

public class UserService {
	//用户持久层类注入
	private UserDao UserDao;
	public void setUserDao(UserDao userDao) {
		UserDao = userDao;
	}
	//登陆
	public User login(User user){
		System.out.println("US.login被调用。。");
		if(UserDao.login(user)!=null){
			return UserDao.login(user);
		}else{
			return null;
		}
	}
	//遍历所有会员信息
	public List<User> findAllVip(){
		System.out.println("US.findAllUser被调用。。");
		return UserDao.findAllVip();
	}
	//遍历所有教练信息
	public List<User> findAllCoach(){
		System.out.println("US.findAllCoach被调用。。");
		return UserDao.findAllCoach();
	}
	//遍历所有员工信息
	public List<User> findAllStuff(){
		System.out.println("US.findAllStuff被调用。。");
		return UserDao.findAllStuff();
	}
		
	

}
