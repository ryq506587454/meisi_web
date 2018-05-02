package com.meisi.action;


import java.util.List;

import com.meisi.bean.Course;
import com.meisi.bean.User;
import com.meisi.dao.CourseDao;
import com.meisi.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CourseAction extends ActionSupport implements ModelDriven<Course>{
	//生成模型
		//课程模型
		private Course Course;
		@Override
		public Course getModel() {
			if(Course == null){
		           Course = new Course();
		       }
			return this.Course;
		}
	//向微信端发送的JSON数据
		//信息
		private String msg;				
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		//课程
		private Course mediaCourse;	
		public Course getMediaCourse() {
			return mediaCourse;
		}
		public void setMediaCourse(Course mediaCourse) {
			this.mediaCourse = mediaCourse;
		}
		//课程列表
		private List<Course> courList;
		public List<Course> getCourList() {
			return courList;
		}
		public void setCourList(List<Course> courList) {
			this.courList = courList;
		}
	//微信小程序传过来的非模型元素
		private String userId;		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
	//课程业务层注入
	private CourseService CourseService;
	public void setCourseService(CourseService courseService) {
		CourseService = courseService;
	}
		
	//根据课程类型查课-移动端
	public String meidaFindByType(){
		System.out.println("CA.meidaFindByType被调用了。。");	
		courList = CourseService.findCourseByType(Course);
		return "MeidaCourseList";		
	}
	//根据课程ID查课-移动端
	public String meidaFindByID(){
		System.out.println("CA.meidaFindByID被调用了。。");	
		mediaCourse = CourseService.findCourseById(Course);
		return "MeidaCourse";		
	}
	//移动端预约选课
	public String meidaAppt(){
		System.out.println("CA.meidaAppt被调用了。。");	
		msg = CourseService.apptmenCourse(userId, Course);
		return "MeidaMsg";		
	}

}
