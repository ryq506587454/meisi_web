package com.meisi.action;


import java.util.List;

import com.meisi.bean.Course;
import com.meisi.dao.CourseDao;
import com.meisi.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CourseAction extends ActionSupport implements ModelDriven<Course>{
	//JSON数据
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
	//模型驱动需要的
	private Course Course;
	@Override
	public Course getModel() {
		if(Course == null){
	           Course = new Course();
	       }
		return this.Course;
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
		return "MeidaFindByType";		
	}
	//根据课程ID查课-移动端
	public String meidaFindByID(){
		System.out.println("CA.meidaFindByType被调用了。。");	
		courList = CourseService.findCourseById(Course);
		return "MeidaFindByType";		
	}
	

}
