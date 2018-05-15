package com.meisi.action;


import java.util.List;

import com.meisi.bean.Coach;
import com.meisi.bean.Course;
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
		//搜索框内数据
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
		//用户编号
		private String userId;		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		//开课时间
		private String courseDate;		
		public String getCourseDate() {
			return courseDate;
		}
		public void setCourseDate(String courseDate) {
			this.courseDate = courseDate;
		}
		//教练名称
		private String coachName;		
		public String getCoachName() {
			return coachName;
		}
		public void setCoachName(String coachName) {
			this.coachName = coachName;
		}
		//教练编号
		private String coachId;				
		public String getCoachId() {
			return coachId;
		}
		public void setCoachId(String coachId) {
			this.coachId = coachId;
		}
		//开课时间（预约表）
		private String courseTime;				
		public String getCourseTime() {
			return courseTime;
		}
		public void setCourseTime(String courseTime) {
			this.courseTime = courseTime;
		}
		//页数
		private String page;
		public String getPage() {
			return page;
		}
		public void setPage(String page) {
			this.page = page;
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
	//设置页码
		private int pageSize=3;
	
	//查找所有课程
	public String FindAllCourse(){	   
	    utillist=utillist.CreatUtillist(String.valueOf(CourseService.CourseNumber(pageSize)), CourseService.findAllCourse(Integer.parseInt(page),pageSize),100);	    	
    	return "UtilList";				
	}		
	//根据课程类型查课-移动端
	public String meidaFindByType(){		
		mediaCourList = CourseService.findCourseByType(Course);
		return "MediaCourseList";		
	}
	//根据课程ID查课-移动端
	public String meidaFindByID(){	
		mediaCourse = CourseService.findCourseById(Course);
		return "MediaCourse";		
	}
	//移动端预约选课
	public String meidaAppt(){		
		msg = CourseService.apptmenCourse(userId, Course,courseDate);
		return "MediaMsg";		
	}
	//热门推荐
	public String meidaAdvice(){	
		mediaCourList=CourseService.addviceCourse();			
		return "MediaCourseList";
	}
	//根据教练选课
	public String meidaFindByCoach(){		
		mediaCourList=CourseService.findCourseByCoach(coachName,Course);			
		return "MediaCourseList";
	}
	//根据时间查找课程
	public String meidaFindByDate(){		
		mediaCourList=CourseService.findCourseByDate(courseDate,Course);			
		return "MediaCourseList";
	}
	//根据时间和教练查找
	public String meidaFindByDateAndCoach(){		
		mediaCourList=CourseService.findCourseByDateAndCoach(coachName, courseDate, Course);			
		return "MediaCourseList";
	}
	//根据条件查询
	public String FindByFlag(){		
		mediaCourList = CourseService.findCourseByFlag(flag, data,Integer.parseInt(page),pageSize);	
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
	//添加课程
	public String AddCourse(){
		Course.setCourseDuration(Course.getCourseDuration()*60);	
		ActionContext ac = ActionContext.getContext();
	    ac.getSession().put("msg",CourseService.addCourse(Course, coachId));	  
		return "AddCourse_success";
	}
	//课程查重
	public String CheckCourseTwo(){		
		msg = CourseService.checkCourseTwo(Course);
		return "MediaMsg";		
	}
	//删除课程
	public String DeleteCourse(){
		msg = CourseService.deleteCourse(Course);
		return "MediaMsg";
	}
	//安排课程
	public String PlanCourse(){
		String currentDate=courseDate+" "+courseTime;	
		msg = CourseService.planCourse(Course,currentDate);
		System.out.println(msg);
		return "MediaMsg";
	}
	//更新课程
	public String UpdateCourse(){
		msg = CourseService.updateCourse(Course);
		return "Update_suc";
	}
	//查询某一节课已报人数
	public String FindClassNumber(){
		msg = CourseService.findClassNumber(Course, courseDate);
		return "MediaMsg";		
	}
	
}
