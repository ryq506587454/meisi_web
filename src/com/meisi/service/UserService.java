package com.meisi.service;
/*
 * 用户业务层
 */

import java.util.List;
import java.util.Random;

import com.meisi.bean.Coach;
import com.meisi.bean.User;
import com.meisi.dao.UserDao;
import com.meisi.util.ReigstSMSUtil;

public class UserService {
	//用户持久层类注入
	private UserDao UserDao;
	public void setUserDao(UserDao userDao) {
		UserDao = userDao;
	}
	//登陆
	public User login(User user){		
		if(UserDao.login(user)!=null){
			return UserDao.login(user);
		}else{
			return null;
		}
	}
	//遍历所有会员信息
	public List<User> findAllVip(int page,int pageSize){		
		return UserDao.findAllVip(page,pageSize);
	}
	//计算用户表总页数
	public int VipNumber(int pageSize){
		return UserDao.VipNumber(pageSize);
	}
	//修改信息
	public String updateUserInfo(String flag,User user){		
		return UserDao.updateUserInfo(flag,user);
	}
	//取消预约
	public String quiteAppt(User user,String courseName,String apptId){		
		return UserDao.quiteAppt(user, courseName, apptId);		
	}
	//按照条件查询
	public List<User> findUserByFlag(String flag,String data,int page,int pageSize){
		if(flag.equals("All")){
			return this.findAllVip(page,pageSize);
		}else if(data.length()<1){	
			return null;
		}else{
			return UserDao.findUserByFlag(flag, data);
		}		
	}
	//用户查重
	public String checkUserTwo(User u){
		return UserDao.checkUserTwo(u);
	}
	//添加用户
	public String addNewUser(User u,String cType){
		return UserDao.addNewUser(u,cType);
	}
	//办卡
	public String addNewCard(User u,String cardType){
		return UserDao.addNewCard(u, cardType);
	}
	//充次
	public String addCost(User u,String resTimes){
		return UserDao.addCost(u, resTimes);
	}
	//获取验证码
	public String getCode(User user){	
		return UserDao.getCode(user);
	}
	//移动端注册
	public String regist(User user){
		return UserDao.regist(user);
	}
	//删除会员
	public String deleteUser(User u){
		return UserDao.deleteUser(u); 
	}
	
	//根据ID查找用户
	public User findByUserId(User u){
		return UserDao.findByUserId(u);
	}
	//更新用户信息
	public String updateUser(User u){
		return UserDao.updateUser(u);
	}
/*
 * 教练部分	
 */
	//遍历所有教练信息
	public List<Coach> findAllCoach(final int page ,final int pageSize){	
		return UserDao.findAllCoach(page,pageSize);
	}
	//教练总页数
	public int CoachNumber(int pageSize){
		return UserDao.CoachNumber(pageSize);
	}
	//根据ID查找教练
	public Coach findByCoachId(Coach c){
		return UserDao.findByCoachId(c);
	}
	//更新教练信息
	public String updateCoach(Coach c){
		return UserDao.updateCoach(c);
	}
	//根绝条件查找教练
	public List<Coach> findCoachByFlag(String flag,String data,final int page ,final int pageSize){
		if(flag.equals("All")){
			return this.findAllCoach( page,pageSize);
		}else if(data.length()<1){	
			return null;
		}else{
			return UserDao.findCoachByFlag(flag, data);
		}	
	}
	//删除教练
	public String deleteCoach(Coach c){
		return UserDao.deleteCoach(c);
	}
	//根据类别查找教练
	public List<Coach> findCoachByType(String courseType){
		return UserDao.findCoachByType(courseType);
	}
	//添加新教练
	public String addNewCoach(Coach coach){
		return UserDao.addNewCoach(coach);
	}
	//教练查重
	public String checkCoachTwo(Coach coach){
		return UserDao.checkCoachTwo(coach); 
	}
}
