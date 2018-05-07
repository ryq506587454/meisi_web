package com.meisi.action;


import java.util.List;

import com.meisi.bean.Course;
import com.meisi.bean.User;
import com.meisi.dao.CourseDao;
import com.meisi.service.CourseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.meisi.util.Utillist;

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
	//JSON数据
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
		private List<Course> mediaCourList;
		public List<Course> getMediaCourList() {
			return mediaCourList;
		}
		public void setMediaCourList(List<Course> mediaCourList) {
			this.mediaCourList = mediaCourList;
		}
		//传过来的非模型元素
		private String data;		
		public String getData() {
			return data;
		}
		public void setData(String data) {
			this.data = data;
		}
		private String flag;		
		public String getFlag() {
			return flag;
		}
		public void setFlag(String flag) {
			this.flag = flag;
		}
		private String userId;		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		private String courseDate;		
		public String getCourseDate() {
			return courseDate;
		}
		public void setCourseDate(String courseDate) {
			this.courseDate = courseDate;
		}
		private String coachName;		
		public String getCoachName() {
			return coachName;
		}
		public void setCoachName(String coachName) {
			this.coachName = coachName;
		}
		//辅助工具
		private Utillist utillist; 		
		public Utillist getUtillist() {
			return utillist;
		}
		public void setUtillist(Utillist utillist) {
			this.utillist = utillist;
		}
	//课程业务层注入
	private CourseService CourseService;
	public void setCourseService(CourseService courseService) {
		CourseService = courseService;
	}
	
	//查找所有课程
	public String FindAllCourse(){
		System.out.println("CA.FindAllCourse被调用了。。");	
	    mediaCourList =CourseService.findAllCourse();	    
	    return "MediaCourseList";				
	}		
	//根据课程类型查课-移动端
	public String meidaFindByType(){
		System.out.println("CA.meidaFindByType被调用了。。");	
		mediaCourList = CourseService.findCourseByType(Course);
		return "MediaCourseList";		
	}
	//根据课程ID查课-移动端
	public String meidaFindByID(){
		System.out.println("CA.meidaFindByID被调用了。。");	
		mediaCourse = CourseService.findCourseById(Course);
		return "MediaCourse";		
	}
	//移动端预约选课
	public String meidaAppt(){
		System.out.println("CA.meidaAppt被调用了。。");	
		msg = CourseService.apptmenCourse(userId, Course,courseDate);
		return "MediaMsg";		
	}
	//热门推荐
	public String meidaAdvice(){
		System.out.println("CA.meidaAdvice被调用了。。");	
		mediaCourList=CourseService.addviceCourse();			
		return "MediaCourseList";
	}
	//根据教练选课
	public String meidaFindByCoach(){
		System.out.println("CA.meidaFindByCoach被调用了。。");	
		mediaCourList=CourseService.findCourseByCoach(coachName,Course);			
		return "MediaCourseList";
	}
	//根据条件查询
	public String FindByFlag(){
		System.out.println("CA.meidaFindByFlag被调用了。。");
		mediaCourList = CourseService.findCourseByFlag(flag, data);	
		if(mediaCourList==null||mediaCourList.size()==0){
	    	msg ="未查询到结果";
	    	utillist=utillist.CreatUtillist(msg,mediaCourList,100);	    	
	    	return "UtilList";
	    }else{
	    	msg ="查询到结果";
	    	utillist=utillist.CreatUtillist(msg,mediaCourList,101);	 
	    	return "UtilList";	
	    }
	}
	//查询预约
	public String FindAppt(){
		msg ="查询到结果";
    	utillist=utillist.CreatUtillist(msg,CourseService.findAppt(courseDate),100);	 
    	return "UtilList";	
	}

}
