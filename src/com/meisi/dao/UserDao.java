package com.meisi.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.meisi.bean.Course;
import com.meisi.bean.User;
/*
 * 用户持久层
 */

public class UserDao extends HibernateDaoSupport{
	//用户登录
	public User login(User user){		
		System.out.println("UD.login被调用。。");
		System.out.println(user.getUserId()+" "+user.getPassword());
		User u = (User)this.getHibernateTemplate().get(User.class, user.getUserId());	
		if(u.getPassword().equals(user.getPassword())){		
			return u;
		}else{
			return null;
		}
	}
	//查询所有用户
	public List<User> findAllVip(){
		System.out.println("UD.findAllVip被调用。。");
		List<User> VipList = new ArrayList<User>(); 
		String hql = "from User where grade = 0 ";  
		VipList= this.getHibernateTemplate().find(hql);		
		return VipList;		
	}
	//查询所有教练
	public List<User> findAllCoach(){
		System.out.println("UD.findAllCoach被调用。。");
		List<User> CoachList = new ArrayList<User>(); 
		String hql = "from User where grade = 1";  	
		CoachList= this.getHibernateTemplate().find(hql);		
		return CoachList;		
	}
	//查询所有员工
	public List<User> findAllStuff(){
		System.out.println("UD.findAllCoach被调用。。");
		List<User> StuffList = new ArrayList<User>();	
		String hql = "from User where grade = 1 ";  
		StuffList= this.getHibernateTemplate().find(hql);		
		return StuffList;		
	}
}
