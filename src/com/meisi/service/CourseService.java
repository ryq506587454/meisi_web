package com.meisi.service;
/*
 * 课程业务层
 */
import java.util.List;

import com.meisi.bean.Course;
import com.meisi.dao.CourseDao;
import com.meisi.util.ApptLog;


public class CourseService {
	//课程业务层注入
	private CourseDao CourseDao;
	public void setCourseDao(CourseDao courseDao) {
		CourseDao = courseDao;
	}
	//根据课程类型查课
	public List<Course> findCourseByType(Course course){
		return CourseDao.findCourseByType(course);
	}
	//根据课程ID查课
	public Course findCourseById(Course course){
		return CourseDao.findCourseById(course);
	}
	//移动端预约选课
	public String apptmenCourse(String userId,Course c,String data){
		return CourseDao.apptmenCourse(userId,c,data);		
	}
	//热门推荐
	public List<Course> addviceCourse(){
		return CourseDao.addviceCourse();
	}	
	//查询所有课程
	public List<Course> findAllCourse(){
		return CourseDao.findAllCourse();		
	}
	//根据教练查询
	public List<Course> findCourseByCoach(String name,Course Course){
		if(name.equals("无")){
			return findCourseByType(Course);
		}else{
			return CourseDao.findCourseByCoach(name);
		}		
	}
	//按照条件查询
	public List<Course> findCourseByFlag(String flag,String data){
		if(flag.equals("All")){
			return this.findAllCourse();
		}else if(data.length()<1){	
			return null;
		}else{
			System.out.println("111");
			return CourseDao.findCourseByFlag(flag, data);
		}		
	}
	//预约情况
	public List<ApptLog> findAppt(String date){
		return CourseDao.findAppt(date);		
	}
	//添加课程
	public String addCourse(Course c,String coachId){
		return CourseDao.addCourse(c, coachId);
	}
	//课程查重
	public String checkCourseTwo(Course c){
		return CourseDao.checkCourseTwo(c);
	}
	//删除课程
	public String deleteCourse(Course c){
		return CourseDao.deleteCourse(c);
	}
	//安排课程
	public String planCourse(Course c,String date,String coachName){
		return CourseDao.planCourse(c, date, coachName);
	}
}	
