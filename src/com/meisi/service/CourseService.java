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
		System.out.println("CS.findCourseType被调用。。");
		return CourseDao.findCourseByType(course);
	}
	//根据课程ID查课
	public Course findCourseById(Course course){
		System.out.println("CS.findCourseById被调用。。");
		return CourseDao.findCourseById(course);
	}
	//移动端预约选课
	public String apptmenCourse(String userId,Course c,String data){
		System.out.println("CS.apptmenCourse。。");
		return CourseDao.apptmenCourse(userId,c,data);		
	}
	//热门推荐
	public List<Course> addviceCourse(){
		System.out.println("CS.addviceCourse被调用。。");
		return CourseDao.addviceCourse();
	}	
	//查询所有课程
	public List<Course> findAllCourse(){
		System.out.println("CS.findAllCoursee被调用。。");
		return CourseDao.findAllCourse();		
	}
	//根据教练查询
	public List<Course> findCourseByCoach(String name,Course Course){
		System.out.println("CS.findCourseByCoach被调用。。");
		if(name.equals("无")){
			return findCourseByType(Course);
		}else{
			return CourseDao.findCourseByCoach(name);
		}		
	}
	//按照条件查询
	public List<Course> findCourseByFlag(String flag,String data){
		System.out.println("CS.findCourseByFlag被调用。。");
		System.out.println(data);
		System.out.println(flag);
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
}	
