package com.meisi.service;
/*
 * 用户业务层
 */

import java.util.List;

import com.meisi.bean.Coach;
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
	public List<Coach> findAllCoach(){
		System.out.println("US.findAllCoach被调用。。");
		return UserDao.findAllCoach();
	}
	//遍历所有员工信息
	public List<User> findAllStuff(){
		System.out.println("US.findAllStuff被调用。。");
		return UserDao.findAllStuff();
	}
	//修改信息
	public String updateUserInfo(String flag,User user){
		System.out.println("US.updateUserInfo被调用。。");
		return UserDao.updateUserInfo(flag,user);
	}
	//取消预约
	public String quiteAppt(User user,String courseName,String apptId){
		System.out.println("US.quiteAppt被调用。。");
		return UserDao.quiteAppt(user, courseName, apptId);		
	}
	//按照条件查询
	public List<User> findUserByFlag(String flag,String data){
		System.out.println("US.findUserByFlag");
		if(flag.equals("All")){
			return this.findAllVip();
		}else if(data.length()<1){	
			return null;
		}else{
			return UserDao.findUserByFlag(flag, data);
		}		
	}
	//用户查重
	public String checkUserTwo(User u){
		System.out.println("US.checkUserTwo");
		return UserDao.checkUserTwo(u);
	}
	//添加用户
	public String addNewUser(User u,String cType){
		System.out.println("US.addNewUser");
		return UserDao.addNewUser(u,cType);
	}
	//根据类别查找教练
	public List<Coach> findCoachByType(String courseType){
		System.out.println("US.findCoachByType");
		return UserDao.findCoachByType(courseType);
	}
}
