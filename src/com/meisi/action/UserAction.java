package com.meisi.action;
/*
 * 用户交互层
 */

import java.util.List;

import com.meisi.bean.User;
import com.meisi.service.UserService;
import com.meisi.util.Utillist;
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
	//JSON数据		
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
		private List<User> userList;						
		public List<User> getUserList() {
			return userList;
		}
		public void setUserList(List<User> userList) {
			this.userList = userList;
		}
	//传过来的非模型元素	
		//输入框数据
		private String data;		
		public String getData() {
			return data;
		}
		public void setData(String data) {
			this.data = data;
		}
		//条件
		private String flag;	
		public String getFlag() {
			return flag;
		}
		public void setFlag(String flag) {
			this.flag = flag;
		}
		//课程名称
		private String courseName;
		public String getCourseName() {
			return courseName;
		}
		public void setCourseName(String courseName) {
			this.courseName = courseName;
		}
		//课程类别
		private String courseType;
		public String getCourseType() {
			return courseType;
		}
		public void setCourseType(String courseType) {
			this.courseType = courseType;
		}
		//预约记录编号
		private String appId;
		public String getAppId() {
			return appId;
		}
		public void setAppId(String appId) {
			this.appId = appId;
		}	
		//会员类型
		private String select;		
		public String getSelect() {
			return select;
		}
		public void setSelect(String select) {
			this.select = select;
		}
		//页码
		private String page;
		public String getPage() {
			return page;
		}
		public void setPage(String page) {
			this.page = page;
		}
		//充值次数
		private String resTimes;		
	    public String getResTimes() {
			return resTimes;
		}
		public void setResTimes(String resTimes) {
			this.resTimes = resTimes;
		}
		//辅助工具
		private Utillist utillist; 		
		public Utillist getUtillist() {
			return utillist;
		}
		public void setUtillist(Utillist utillist) {
			this.utillist = utillist;
		}
	//用户业务层注入
	private UserService UserService;
	public void setUserService(UserService userService) {
		UserService = userService;
	}
	//设置页面大小
	private int pageSize=3; 
	
	//登陆功能
	public String login(){		
		User u = UserService.login(user);
		if(u!=null){
			ActionContext ac = ActionContext.getContext();
		    ac.getSession().put("user",u);	 		    
		    return "Login_SUCCESS";	
		}else{
			return "Login_FAIL";
		}				
	}
	//查询所有会员信息
	public String findAllVip(){
		utillist=utillist.CreatUtillist(String.valueOf(UserService.VipNumber(pageSize)),UserService.findAllVip(Integer.parseInt(page) ,pageSize),100);			
		return "UtilList";			
	}
	//微信用户登陆-移动端
	public String meidalogin(){		
		mediaUser = UserService.login(user);		
		return "MediaUser";		
	}
	//修改用户信息-移动端
	public String mediaUpdataInfo(){		
		msg = UserService.updateUserInfo(flag, user);		
		return "MediaMsg";
	}
	//取消预约
	public String mediaQuiteAppt(){	
		msg = UserService.quiteAppt(user, courseName, appId);
		return "MediaMsg";
	}
	//根据flag查询
	public String FindByFlag(){		
		userList = UserService.findUserByFlag(flag, data,Integer.parseInt(page),pageSize);	
		if(userList==null||userList.size()==0){
	    	msg ="未查询到结果";
	    	utillist=utillist.CreatUtillist(msg,userList,100);	    	
	    	return "UtilList";
	    }else{
	    	msg ="查询到结果";
	    	utillist=utillist.CreatUtillist(msg,userList,101);	 
	    	return "UtilList";	
	    }
	}
	//用户查重
	public String CheckUserTwo(){		
		msg = UserService.checkUserTwo(user);
		return "MediaMsg";		
	}
	//添加新用户
	public String addUser(){	
		msg = UserService.addNewUser(user,select);
		return "ADD_Success";		
	}
	
	//根据类别查找教练	
	public String FindCoachByType(){		
		msg = "查询成功";
		utillist=utillist.CreatUtillist(msg,UserService.findCoachByType(courseType),100);
		return "UtilList";
	}
	//删除Vip
	public String DeletUser(){
		msg = UserService.deleteUser(user);
		return "MediaMsg";
	}
	//通过ID查用户
	public String FindById(){
		ActionContext.getContext().getSession().put("userId",String.valueOf(user.getUserId()));;
		mediaUser = UserService.findByUserId(user);		
		return "MediaUser";	
	}
	//更改用户信息
	public String UpdateUser(){
		msg = UserService.updateUser(user);	
		return "Update_suc";	
	}
	//获取验证码
	public String GetCode(){
		msg = UserService.getCode(user);
		return "MediaMsg";
	}
	//注册
	public String Regist(){
		msg = UserService.regist(user);
		return "MediaMsg";
	}
	//跳转到详情
	public String Jump(){
		ActionContext.getContext().getSession().put("userId",String.valueOf(user.getUserId()));;
		return "JumpToDetail";
	}
	//办卡
	public String AddCard(){
		msg = UserService.addNewCard(user, select);
		return "MediaMsg";	
	}
	//充次
	public String AddRestimes(){
		msg = UserService.addCost(user, resTimes);
		return "MediaMsg";	
	}
}
