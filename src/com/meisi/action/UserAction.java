package com.meisi.action;
/*
 * 用户交互层
 */

import java.util.List;

import com.meisi.bean.Course;
import com.meisi.bean.User;
import com.meisi.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public class UserAction extends ActionSupport implements ModelDriven<User>{	
	//生成模型
		//用户模型
		private User user;
		@Override
		public User getModel() {
			 if(user == null){
		           user = new User();
		       }
			return this.user;
		}
	//向微信端发送的JSON数据
		private User mediaUser;	
		public User getMediaUser() {
			return mediaUser;
		}
		public void setMediaUser(User mediaUser) {
			this.mediaUser = mediaUser;
		}
		private String msg;
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		} 
		
	//微信小程序传过来的非模型元素	
		private String flag;	
		public String getFlag() {
			return flag;
		}
		public void setFlag(String flag) {
			this.flag = flag;
		}
		
	//用户业务层注入
	private UserService UserService;
	public void setUserService(UserService userService) {
		UserService = userService;
	}
	
	
	//登陆功能
	public String login(){
		System.out.println("UA.login被调用了。。");
		User u = UserService.login(user);
		if(u!=null){
			//u.pushSet();
			//System.out.println(u.toString());
			ActionContext ac = ActionContext.getContext();
		    ac.getSession().put("user",u);	 		    
		    return "Login_SUCCESS";	
		}else{
			return "Login_FAIL";
		}				
	}
	//查询所有会员信息
	public String findAllVip(){
		System.out.println("UA.findAllUser被调用了。。");
		List<User> VipList =UserService.findAllVip();
		ActionContext ac = ActionContext.getContext();
	    ac.getSession().put("VipList",VipList);	 	
		return "findAllUser_SUCCESS";				
	}
	//查询所有教练信息
	public String findAllCoach(){
		System.out.println("UA.findAllCoach被调用了。。");
		List<User> CoachList =UserService.findAllCoach();
		for (User user : CoachList) {
			System.out.println(user.getName());
		}
		ActionContext ac = ActionContext.getContext();
	    ac.getSession().put("CoachList",CoachList);	 	
		return "findAllCoach_SUCCESS";				
	}
	//微信用户登陆-移动端
	public String meidalogin(){
		System.out.println("UA.meidalogin被调用了。。");
		mediaUser = UserService.login(user);		
		return "MediaUser";		
	}
	//修改用户信息-移动端
	public String mediaUpdataInfo(){
		msg = UserService.updateUserInfo(flag, user);		
		return "MediaMsg";
	}
	
	
}
